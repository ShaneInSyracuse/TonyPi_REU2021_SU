#!/usr/bin/python3
# coding=utf8
import sys
import os
import cv2
import time
import queue
import Camera
import logging
import threading
import RPCServer
import MjpgServer
import numpy as np
import Functions.Running as Running
from CameraCalibration.CalibrationConfig import *

# 主线程，已经以后台的形式开机自启
# 自启方式systemd，自启文件/etc/systemd/system/tonypi.service
# sudo systemctl stop tonypi  此次关闭
# sudo systemctl disable tonypi 永久关闭
# sudo systemctl enable tonypi 永久开启
# sudo systemctl start tonypi 此次开启

if sys.version_info.major == 2:
    print('Please run this program with python3!')
    sys.exit(0)

QUEUE_RPC = queue.Queue(10)

#加载参数
param_data = np.load(calibration_param_path + '.npz')

#获取参数
mtx = param_data['mtx_array']
dist = param_data['dist_array']

def startTonyPi():

    RPCServer.QUEUE = QUEUE_RPC

    threading.Thread(target=RPCServer.startRPCServer,
                     daemon=True).start()  # rpc服务器
    threading.Thread(target=MjpgServer.startMjpgServer,
                     daemon=True).start()  # mjpg流服务器
    
    loading_picture = cv2.imread('/home/pi/TonyPi/loading.jpg')
    cam = Camera.Camera()  # 相机读取
    newcameramtx, roi = cv2.getOptimalNewCameraMatrix(mtx, dist, (cam.width, cam.height), 0, (cam.width, cam.height))
    mapx, mapy = cv2.initUndistortRectifyMap(mtx, dist, None, newcameramtx, (cam.width, cam.height), 5)
    
    Running.cam = cam

    while True:
        time.sleep(0.03)

        # 执行需要在本线程中执行的RPC命令
        while True:
            try:
                req, ret = QUEUE_RPC.get(False)
                event, params, *_ = ret
                ret[2] = req(params)  # 执行RPC命令
                event.set()
            except:
                break
        #####
        # 执行功能玩法程序：
        try:
            if Running.RunningFunc > 0 and Running.RunningFunc <= 7:
                if cam.frame is not None:
                    if Running.RunningFunc == 2:
                        frame = cam.frame.copy()
                    else:
                        frame = cv2.remap(cam.frame.copy(), mapx, mapy, cv2.INTER_LINEAR)  # 畸变矫正
                    MjpgServer.img_show = Running.CurrentEXE().run(frame)
                else:
                    MjpgServer.img_show = loading_picture
            else:
                cam.frame = None
        except KeyboardInterrupt:
            break
        except BaseException as e:
            print('error', e)

if __name__ == '__main__':
    logging.basicConfig(level=logging.ERROR)
    startTonyPi()
