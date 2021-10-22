cmake_minimum_required(VERSION 3.0.2)
project(TonyPi)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  sensor_msgs
  std_msgs
  tf
  message_generation
)
add_message_files(
  FILES
  Debug.msg
)
# add_service_files(
#   FILES
#   Service1.srv
#   Service2.srv
# )
# add_action_files(
#   FILES
#   Action1.action
#   Action2.action
# )
generate_messages(
  DEPENDENCIES
  sensor_msgs
  std_msgs
)
catkin_package(
  INCLUDE_DIRS include
  LIBRARIES TonyPi
  CATKIN_DEPENDS message_runtime roscpp rospy sensor_msgs std_msgs tf
  DEPENDS system_lib
)
include_directories(
 include
  ${catkin_INCLUDE_DIRS}
)
include_directories(include ${catkin_INCLUDE_DIRS})
add_executable(state_publisher src/state_publisher.cpp)
add_dependencies(state_publisher ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(state_publisher ${catkin_LIBRARIES})
