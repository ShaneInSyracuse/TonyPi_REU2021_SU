#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <tf/transform_broadcaster.h>
#include <TonyPi/Debug.h>
#include <fstream>
#include <iostream>
#include <sstream>

int main(int argc, char** argv) {
    ros::init(argc, argv, "state_publisher");
    ros::NodeHandle n;
    ros::Publisher joint_pub = n.advertise<sensor_msgs::JointState>("joint_states", 1);
    ros::Publisher debugPub = n.advertise<TonyPi::Debug>("debug", 1);
    tf::TransformBroadcaster broadcaster;
    ros::Rate loop_rate(30);

    const double degree = M_PI/180;

    // robot state
    double states[10] = {497,500,399,600,500,500,613,388,504,497};
    double offset[10] = {-497,-500,-399,-600,-500,-500,-613,-388,-504,-497};
    double standing[10] = {500.0,500.0,400.0,600.0,500.0,500.0,390.0,610.0,500.0,500.0};
    int parody[10] = {1,1,-1,1,1,-1,1,-1,-1,-1};
    double increment = 1;
    double pulseToDegree = (120*degree)/500;
    int currentLine = 0;
    int numLines = 0;
    std::ifstream gaitFile;
    gaitFile.open("/home/shane/TonyPi_ws/src/TonyPi/src/gait.csv");
    std::string line;
    while (std::getline(gaitFile, line)){
        ++numLines;
    }
    gaitFile.close();
    int target_vals[numLines][10];
    int temp;
    gaitFile.open("/home/shane/TonyPi_ws/src/TonyPi/src/gait.csv");
    for(int row = 0; row < numLines; ++row){
        std::string line;
        std::getline(gaitFile, line);
        std::stringstream iss(line);
        for (int col = 0; col < 10; ++col){
            std::string val;
            std::getline(iss, val, '\t');
            std::stringstream convertor(val);
            convertor >> target_vals[row][col];
            std::cout << target_vals[row][col];
            std::cout << " ";
        }
        std::cout << "\n";
    }

    // message declarations
    geometry_msgs::TransformStamped odom_trans;
    sensor_msgs::JointState joint_state;
    TonyPi::Debug debug;
    debug.IsInPosition = "false";
    odom_trans.header.frame_id = "map";
    odom_trans.child_frame_id = "base_link";
    bool atLocation = false;
    bool foundState[10] = {false,false,false,false,false,false,false,false,false,false};

    while (ros::ok()) {
        //update joint_state
        joint_state.header.stamp = ros::Time::now();
        joint_state.name.resize(10);
        joint_state.position.resize(10);
        joint_state.name[0] ="LHip-Sideways";
        joint_state.name[1] ="RHip-Sideways";
        joint_state.name[2] ="LHip";
        joint_state.name[3] ="RHip";
        joint_state.name[4] ="LKnee";
        joint_state.name[5] ="RKnee";
        joint_state.name[6] ="LAnkle";
        joint_state.name[7] ="RAnkle";
        joint_state.name[8] ="LAnkle-Sideways";
        joint_state.name[9] ="RAnkle-Sideways";

        int currentTarget = 1;
        for (int i = 0; i < 10; i++){
             if(numLines - currentLine >= 10){
                 currentTarget = currentLine;
             }else{
                 currentTarget = numLines - 10;
             }
             joint_state.position[i] = parody[i]*(offset[i] + states[i])*pulseToDegree;
             debug.offset[i] = offset[i];
             debug.states[i] = states[i];
             debug.pos[i] = joint_state.position[i];
             debug.target1[i] = target_vals[currentTarget][i];
             debug.target2[i] = target_vals[1 + currentTarget][i];
             debug.target3[i] = target_vals[2 + currentTarget][i];
             debug.target4[i] = target_vals[3 + currentTarget][i];
             debug.target5[i] = target_vals[4 + currentTarget][i];
             debug.target6[i] = target_vals[5 + currentTarget][i];
             debug.target7[i] = target_vals[6 + currentTarget][i];
             debug.target8[i] = target_vals[7 + currentTarget][i];
             debug.target9[i] = target_vals[8 + currentTarget][i];
             debug.target10[i] = target_vals[9 + currentTarget][i];

        }
        // update transform
        odom_trans.header.stamp = ros::Time::now();
        odom_trans.transform.translation.x = 0.0;
        odom_trans.transform.translation.y = 0.0;
        odom_trans.transform.translation.z = 0.3;
        odom_trans.transform.rotation.x = 0;
        odom_trans.transform.rotation.y = 0;
        odom_trans.transform.rotation.z = 0;
        odom_trans.transform.rotation.w = 1.0;
        //send the joint state and transform
        joint_pub.publish(joint_state);
        debugPub.publish(debug);
        broadcaster.sendTransform(odom_trans);
        // Create new robot state
        atLocation = true;
        for (int i = 0; i < 10; i++){
            if(states[i] < target_vals[currentLine][i] - increment){
                states[i] = states[i] + increment;
            }else if(states[i] > target_vals[currentLine][i] + increment){
                states[i] = states[i] - increment;
            }else{
                foundState[i] = true;
            }
            atLocation = atLocation && foundState[i];
        }
        debug.IsInPosition = "false";
        if (atLocation){
             debug.IsInPosition = "true";
             if(currentLine != numLines - 1){
                 currentLine = currentLine + 1;
             }else{
                 currentLine = 0;
             }
             for (int i = 0; i < 10; i++){
                 foundState[i] = false;
             }
        }
        debug.currentLine = currentLine;
        // This will adjust as needed per iteration
        loop_rate.sleep();
    }
    return 0;
}
