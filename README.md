# TonyPi_REU2021_SU
Code modified and created to generate a walking gait for Hiwonder's TonyPi Robot.

TonyPi modification for introducing User-Made Walking Gaits

## MatLab Code
GaitPatternGenerationTest.m - main function, creates a variable named pulses for 
user to generate a .csv to replace a gait.csv file in ROS and in TonyPi code

## TonyPi Folder
Contains all edited source code and basic gait patterns to replace /home/pi/TonyPi on TonyPi
Use a USB drive and VNC Remote Desktop Viewer to install

## TonyPi_ws
Contains a ROS workspace, to run, run the following commands in a terminal
	cd TonyPi_ws
	source devel/setup.bash
	./visualize.sh
