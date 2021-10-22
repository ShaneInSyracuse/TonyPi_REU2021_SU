#!/usr/bin/python3
# coding=utf8
#app调用动作组对应字典，左为app调用，右为实际对应动作
#在app里长按自定义即可进入输入模式，然后填写动作名称和编号，编号即为左边数字, 名称可随意起

action_group_dict = {
    '0': 'stand',           #立正
    '1': 'go_forward',      #前进
    '2': 'back_fast',       #后退
    '3': 'left_move_fast',  #左移
    '4': 'right_move_fast', #右移
    '5': 'push_ups',        #俯卧撑
    '6': 'sit_ups',         #仰卧起坐
    '7': 'turn_left',       #左转
    '8': 'turn_right',      #右转
    '9': 'wave',            #挥手
    '10': 'bow',            #鞠躬
    '11': 'squat',          #下蹲
    '12': 'chest',          #庆祝
    '13': 'left_shot_fast', #左脚踢
    '14': 'right_shot_fast',#右脚踢
    '15': 'wing_chun',      #永春
    '16': 'left_uppercut',  #左勾拳
    '17': 'right_uppercut', #右勾拳
    '18': 'left_kick',      #左侧踢
    '19': 'right_kick',     #右侧踢
    '20': 'stand_up_front', #前跌倒起立
    '21': 'stand_up_back',  #后跌倒起立
    '22': 'twist',          #扭腰
    '23': 'stand_slow',     #立正
    '24': 'stepping',       #原地踏步
    '25': 'jugong',         #鞠躬
    '26': 'user_function',  #tasks laid out in user function (located in Action control groups folder
}
