function [pulse] = anglesToPulse(phi,theta)
%phi, theta start in radians, pulse is formatted in servo pulse according
%to ROS state publisher


%format is 
%     1 -LHip-Sideways   - starts at 90
%     2 -RHip-Sideways   - starts at -90
%     3 -LHip            - starts at 135 (-45 from actuator)
%     4 -RHip            - starts at -45
%     5 -LKnee           - starts at 45  (-135 from actuator)
%     6 -RKnee           - starts at -135
%     7 -LAnkle          - starts at 90
%     8 -RAnkle          - starts at -90
%     9 -LAnkle-Sideways - starts at 90
%     10-RAnkle-Sideways - starts at -90
% %Standing
% phi(1,:) = pi/180 .*[90, 90, 60, 120, 90, 90, -90, -90, -60, -120, -90, -90];
% theta(1,:) = pi/180 .*[90, 90, 90, 90, 90, 45, 45, 90, 90, 90, 90, 90];
radianToPulse = (180/pi)*(500/120);
standing = [497,500,399,600,500,500,613,388,504,497];

for i = 1:1:length(phi)
    pulse(i,:) = fix(radianToPulse.*[ theta(i,2) - pi/2, theta(i,11) - pi/2, ...
                                   -(phi(i,4) - 2*pi/3), -(phi(i,9) + pi/3)  , ...
                                   (phi(i,4) + phi(i,3) - pi), -((phi(i,9) + phi(i,10)) + pi), ...
                                   -(phi(i,3) - pi/3), phi(i,10) + 2*pi/3, ...
                                   (theta(i,2) - pi/2), (theta(i,11) - pi/2)  ]);
    pulse(i,:) = pulse(i,:) + standing;
end



end

