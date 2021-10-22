#!/bin/sh
/bin/sh -c 'source devel/setup.bash'
gnome-terminal -- /bin/sh -c 'echo -ne "\033]0;RosTerminal\007"; source devel/setup.bash; catkin_make; roslaunch TonyPi display.launch' &&
gnome-terminal --wait -- /bin/sh -c 'echo -ne "\033]0;RosTerminal\007"; source devel/setup.bash; rosrun rviz rviz -d src/TonyPi/src/TonyPi.rviz'

killall RosTerminal
killall -r '/home/shane/TonyPi_ws/src/TonyPi/display.launch http://localhost:11311'
