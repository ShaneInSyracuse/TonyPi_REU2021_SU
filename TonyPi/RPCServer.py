#!/usr/bin/python3
# coding=utf8
import os
import sys
import time
import math
import logging
import threading
from werkzeug.wrappers import Request, Response
from werkzeug.serving import run_simple
from jsonrpc import JSONRPCResponseManager, dispatcher
from ActionGroupDict import action_group_dict
import HiwonderSDK.Board as Board
import HiwonderSDK.Mpu6050 as Mpu6050
import HiwonderSDK.ActionGroupControl as AGC
import Functions.Running as Running
import Functions.KickBall as KickBall
import Functions.ColorTrack as ColorTrack
import Functions.VisualPatrol as VisualPatrol

# 远程调用api，框架jsonrpc
# 主要用于手机端和电脑端的客户端调用

if sys.version_info.major == 2:
    print('Please run this program with python3!')
    sys.exit(0)

__RPC_E01 = "E01 - Invalid number of parameter!"
__RPC_E02 = "E02 - Invalid parameter!"
__RPC_E03 = "E03 - Operation failed!"
__RPC_E04 = "E04 - Operation timeout!"
__RPC_E05 = "E05 - Not callable"

Board.setBuzzer(1)
time.sleep(0.1)
Board.setBuzzer(0)
ColorTrack.initMove()
AGC.runActionGroup('stand_slow')

#mpu6050初始化
mpu = Mpu6050.mpu6050(0x68)
mpu.set_gyro_range(mpu.GYRO_RANGE_2000DEG)
mpu.set_accel_range(mpu.ACCEL_RANGE_2G)

HWSONAR = None
QUEUE = None

# pwm舵机控制
# 参数1：时间（ms）
# 参数2：舵机个数
# 参数3：舵机id（1或2）
# 参数4：舵机位置（500-2500）
# ...舵机id
# ...舵机位置
# 例如：[1000, 2, 1, 1500, 5, 1500]
@dispatcher.add_method
def SetPWMServo(*args, **kwargs):
    print(args)
    ret = (True, ())
    arglen = len(args)
    if 0 != (arglen % 2):
        return (False, __RPC_E01)
    try:
        servos = args[2:arglen:2]
        pulses = args[3:arglen:2]
        use_times = args[0]
        for s in servos:
            if s < 1 or s > 2:
                return (False, __RPC_E02)
        dat = zip(servos, pulses)
        for (s, p) in dat:
            Board.setPWMServoPulse(s, p, use_times)
    except Exception as e:
        print(e)
        ret = (False, __RPC_E03)
    return ret

# 串口舵机控制
# 参数1：时间（ms）
# 参数2：舵机个数
# 参数3：舵机id
# 参数4：舵机位置（0-500）
# ...舵机id
# ...舵机位置
# ...
# 例如：[1000, 1, 1, 500]
@dispatcher.add_method
def SetBusServoPulse(*args, **kwargs):
    ret = (True, ())   
    arglen = len(args)
    if (args[1] * 2 + 2) != arglen or arglen < 4:
        return (False, __RPC_E01)
    try:
        servos = args[2:arglen:2]
        pulses = args[3:arglen:2]
        use_times = args[0]
        for s in servos:
           if s < 1 or s > 16:
                return (False, __RPC_E02)
        dat = zip(servos, pulses)
        for (s, p) in dat:
            Board.setBusServoPulse(s, p, use_times)
    except Exception as e:
        print(e)
        ret = (False, __RPC_E03)
    return ret

# 串口舵机偏差设置
# 参数：舵机偏差（-125-125）
@dispatcher.add_method
def SetBusServoDeviation(*args):
    ret = (True, ())
    arglen = len(args)
    if arglen != 2:
        return (False, __RPC_E01)
    try:
        servo = args[0]
        deviation = args[1]
        Board.setBusServoDeviation(servo, deviation)
    except Exception as e:
        print(e)
        ret = (False, __RPC_E03)
    return ret

# 串口舵机偏差读取
# 参数：readDeviation
# 返回：1-16舵机偏差
@dispatcher.add_method
def GetBusServosDeviation(args):
    ret = (True, ())
    data = []
    if args != "readDeviation":
        return (False, __RPC_E01)
    try:
        for i in range(1, 16):
            dev = Board.getBusServoDeviation(i)
            if dev is None:
                dev = 999
            data.append(dev)
        ret = (True, data)
    except Exception as e:
        print(e)
        ret = (False, __RPC_E03)
    return ret 

# 串口舵机偏差保存
# 参数：downloadDeviation
@dispatcher.add_method
def SaveBusServosDeviation(args):
    ret = (True, ())
    if args != "downloadDeviation":
        return (False, __RPC_E01)
    try:
        for i in range(1, 16):
            dev = Board.saveBusServoDeviation(i)
    except Exception as e:
        print(e)
        ret = (False, __RPC_E03)
    return ret 

# 串口舵机掉电 
# 参数：servoPowerDown
@dispatcher.add_method
def UnloadBusServo(args):
    ret = (True, ())
    if args != 'servoPowerDown':
        return (False, __RPC_E01)
    try:
        for i in range(1, 16):
            Board.unloadBusServo(i)
    except Exception as e:
        print(e)
        ret = (False, __RPC_E03)
    return ret

# 获取串口舵机位置
# 参数：angularReadback
# 返回：1-16舵机位置
@dispatcher.add_method
def GetBusServosPulse(args):
    ret = (True, ())
    data = []
    if args != 'angularReadback':
        return (False, __RPC_E01)
    try:
        for i in range(1, 16):
            pulse = Board.getBusServoPulse(i)
            if pulse is None:
                ret = (False, __RPC_E04)
                return ret
            else:
                data.append(pulse)
        ret = (True, data)
    except Exception as e:
        print(e)
        ret = (False, __RPC_E03)
    return ret 

# 停止当前动作
# 参数：stopAction
@dispatcher.add_method
def StopBusServo(args):
    ret = (True, ())
    if args != 'stopAction':
        return (False, __RPC_E01)
    try:     
        AGC.stopAction()
    except Exception as e:
        print(e)
        ret = (False, __RPC_E03)
    return ret

# 停止当前动作组运行
# 参数：stopActionGroup
@dispatcher.add_method
def StopActionGroup(args):
    ret = (True, ())
    if args != 'stopActionGroup':
        return (False, __RPC_E01)
    try:     
        AGC.stopActionGroup()
    except Exception as e:
        print(e)
        ret = (False, __RPC_E03)
    return ret

# 动作组运行
# 参数1：动作编号（字符形式）
# 参数2：动作次数（0表示循环）
# 例如：['1', 2]
th = None
have_move = True
@dispatcher.add_method
def RunAction(*args_):
    global th
    global have_move 
    
    ret = (True, ())
    actName = '0'
    times = 1
    
    if len(args_) != 2:
        return (False, __RPC_E01)
    try:
        if int(args_[0]) == 0:
            if have_move:
                AGC.stopActionGroup()
                have_move = False
        else:
            if th is not None:
                if not th.is_alive():
                    if args_[0] in action_group_dict:
                        actName = action_group_dict[args_[0]]
                    else:
                        actName = args_[0]
                    times = int(args_[1])
                    th = threading.Thread(target=AGC.runActionGroup, args=(actName, times))
                    th.start()
                    have_move = True
            else:
                if args_[0] in action_group_dict:
                    actName = action_group_dict[args_[0]]
                else:
                    actName = args_[0]
                times = int(args_[1])
                th = threading.Thread(target=AGC.runActionGroup, args=(actName, times))
                th.start()
                have_move = True
    except Exception as e:
        print(e)
        ret = (False, __RPC_E03)
    return ret

# 跌倒起立检测
def standup():
    count1 = 0
    count2 = 0
    count3 = 0
    for i in range(20):
        try:
            accel_date = mpu.get_accel_data(g=True) #获取传感器值
            angle_y = int(math.degrees(math.atan2(accel_date['y'], accel_date['z']))) #转化为角度值
            
            #print(count1, count2, count3, angle_y)
            if abs(angle_y) > 160: 
                count1 += 1
            else:
                count1 = 0
            if abs(angle_y) < 10:
                count2 += 1
            else:
                count2 = 0
            time.sleep(0.1)
            count3 += 1
            if count3 > 5 and count1 < 3 and count2 < 3:
                break
            if count1 >= 10: #往后倒了一定时间后起来
                count1 = 0
                AGC.runActionGroup('stand_up_back')
                break
            elif count2 >= 10: #后前倒了一定时间后起来
                count2 = 0
                AGC.runActionGroup('stand_up_front')
                break
        except BaseException as e:
            print(e)

# 跌倒起立调用
th2 = None
@dispatcher.add_method
def StandUp():
    global th2

    ret = (True, ())

    if th2 is not None:
        if not th2.is_alive():
            th2 = threading.Thread(target=standup)
            th2.start()
        else:
            pass
    else:
        th2 = threading.Thread(target=standup)
        th2.start()

    return ret

def runbymainth(req, pas):
    if callable(req):
        event = threading.Event()
        ret = [event, pas, None]
        QUEUE.put((req, ret))
        count = 0
        #ret[2] =  req(pas)
        #print('ret', ret)
        while ret[2] is None:
            time.sleep(0.01)
            count += 1
            if count > 200:
                break
        if ret[2] is not None:
            if ret[2][0]:
                return ret[2]
            else:
                return (False, __RPC_E03 + " " + ret[2][1])
        else:
            return (False, __RPC_E04)
    else:
        return (False, __RPC_E05)

@dispatcher.add_method
def LoadFunc(new_func = 0):
    return runbymainth(Running.loadFunc, (new_func, ))

@dispatcher.add_method
def UnloadFunc():
    return runbymainth(Running.unloadFunc, ())

@dispatcher.add_method
def StartFunc():
    return runbymainth(Running.startFunc, ())

@dispatcher.add_method
def StopFunc():
    return runbymainth(Running.stopFunc, ())

@dispatcher.add_method
def FinishFunc():
    return runbymainth(Running.finishFunc, ())

@dispatcher.add_method
def Heartbeat():
    return runbymainth(Running.doHeartbeat, ())

@dispatcher.add_method
def GetRunningFunc():
    #return runbymainth("GetRunningFunc", ())
    return (True, (0,))

# 设置跟踪颜色
# 参数：颜色（red，green，blue）
# 例如：[(red,)]
@dispatcher.add_method
def SetTargetTrackingColor(*target_color):
    return runbymainth(ColorTrack.setTargetColor, target_color)

# 设置巡线颜色
# 参数：颜色（red，green，blue）
# 例如：[(red,)]
@dispatcher.add_method
def SetVisualPatrolColor(*target_color):
    return runbymainth(VisualPatrol.setLineTargetColor, target_color)

# 设置踢球颜色
# 参数：颜色（red，green，blue）
# 例如：[(red,)]
@dispatcher.add_method
def SetBallColor(*target_color):
    return runbymainth(KickBall.setBallTargetColor, target_color)

@Request.application
def application(request):
    dispatcher["echo"] = lambda s: s
    dispatcher["add"] = lambda a, b: a + b
    response = JSONRPCResponseManager.handle(request.data, dispatcher)

    return Response(response.json, mimetype='application/json')

def startRPCServer():
    run_simple('', 9030, application)

if __name__ == '__main__':
    startRPCServer()
