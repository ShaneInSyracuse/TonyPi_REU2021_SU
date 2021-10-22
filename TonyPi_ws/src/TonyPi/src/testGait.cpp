#include <iostream>
#include <fstream>
#include <sstream>

int main(){
    int numLines = 17;
    int target_vals[numLines][10];
    int temp;
    std::ifstream gaitFile;
    gaitFile.open("/home/shane/TonyPi_ws/src/TonyPi/src/gait.csv");
    for(int row = 0; row < numLines; ++row){
        std::string line;
        std::getline(gaitFile, line);
        std::stringstream iss(line);
        for (int col = 0; col < 10; ++col){
            std::string val;
            std::getline(iss, val, ',');
            std::stringstream convertor(val);
            convertor >> target_vals[row][col];
            std::cout << target_vals[row][col];
            std::cout << " ";
        }
        std::cout << "\n";
    }
    return 0;
}
