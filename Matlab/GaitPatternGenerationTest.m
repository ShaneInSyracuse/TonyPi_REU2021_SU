%% Clear Workspace
clc
clear
close all
%% Define COM and Pos Params
m = [0.091, 0.017, 0.080, 0.126, 0.017, 1.080, 0.017, 0.126, 0.080, 0.017, 0.091,0];
COMr = 0.0254.*[0.1875, 0.875, 1.375, 1, 0.875, 2, 0.875, 1, 1.375, 0.875, 0.1875,0];
COMt = 0.0254.*[0,0,0,-0.1875,0,0,0,-0.1875,0,0,0,0];
r = 0.0254.*[0.5, 2*0.875, 2.375, 2.3125, 2*0.875,2*sqrt(2), 2*sqrt(2),2*0.875, 2.3125, 2.375,2*0.875,0.5];
%% Define Gait Pattern
% maxStrideLength = 2*(r(3))*cos(pi/4);
% intendedSpeed = 0.75; %ratio of max speed
% intendedStrideLength = intendedSpeed * maxStrideLength;
% expectedAngle = 180/pi*acos((intendedStrideLength)/(2*r(3)));
% leanAngle = 10;
% %Standing
% phi(1,:) = pi/180 .*[90, 90, 60, 120, 90, 90, -90, -90, -60, -120, -90, -90];
% theta(1,:) = pi/180 .*[90, 90, 90, 90, 90, 45, 45, 90, 90, 90, 90, 90];
% phi(2,:) = pi/180 .*[90, 90, 60, 120, 90, 90, -90, -90, -expectedAngle-20, -180+expectedAngle+20, -90, -90];
% theta(2,:) = pi/180 .*[90, 90 + leanAngle, 90, 90, 90, 45, 45, 90, 90, 90, 90 + leanAngle, 90];
% phi(3,:) = pi/180 .*[90, 90, expectedAngle, 180-expectedAngle, 90, 90, -90, -90, -expectedAngle-20, -expectedAngle-20, -90, -90];
% theta(3,:) = pi/180 .*[90, 90 + leanAngle, 90, 90, 90, 45, 45, 90, 90, 90, 90 + leanAngle, 90];
% phi(4,:) = pi/180 .*[90, 90, expectedAngle, 180-expectedAngle, 90, 90, -90, -90, -expectedAngle, -expectedAngle, -90, -90];
% theta(4,:) = pi/180 .*[90, 90 + leanAngle, 90, 90, 90, 45, 45, 90, 90, 90, 90 + leanAngle, 90];
% %MidGait
% phi(5,:) = pi/180 .*[90, 90, expectedAngle, 180-expectedAngle, 90, 90, -90, -90, -expectedAngle, -expectedAngle, -90, -90];
% theta(5,:) = pi/180 .*[90, 90 - leanAngle, 90, 90, 90, 45, 45, 90, 90, 90, 90 - leanAngle, 90];
% phi(6,:) = pi/180 .*[90, 90, expectedAngle, 180-expectedAngle, 90, 90, -90, -90, -expectedAngle, -(180-expectedAngle), -90, -90];
% theta(6,:) = pi/180 .*[90, 90 - leanAngle, 90, 90, 90, 45, 45, 90, 90, 90, 90 - leanAngle, 90];
% %Standing
% phi(7,:) = phi(1,:);
% theta(7,:) = theta(1,:);

[phi, theta] = gaitGeneration([0.75],[5],r(3),0);

%% Smooth the Interval for plotting
intervalSmoother = 10;
phi = smoothIntervals(phi, intervalSmoother);
theta = smoothIntervals(theta, intervalSmoother);
midGait = 7*intervalSmoother/2;
sidestep = 0;
wasLeft = true;
isLeft = true;
for i = 1:1:length(phi(:,1))
    isLeft = i < midGait;
    if (isLeft)
        wasLeft = true;
        [x(i,:),y(i,:),z(i,:),COMx(i,:),COMy(i,:),COMz(i,:)] = definePOI(phi(i,:),theta(i,:),r,m,COMr,COMt,sidestep,true);
    elseif (wasLeft)
        wasLeft = false;
        sidestep = x(i-1,length(x(i-1,:)));
        [x(i,:),y(i,:),z(i,:),COMx(i,:),COMy(i,:),COMz(i,:)] = definePOI(phi(i,:),theta(i,:),r,m,COMr,COMt,sidestep,false);
    else
        [x(i,:),y(i,:),z(i,:),COMx(i,:),COMy(i,:),COMz(i,:)] = definePOI(phi(i,:),theta(i,:),r,m,COMr,COMt,sidestep,false);
    end
end
%% Plot
fignum = 1;
for j = 1:length(x(:,1))/2 - 1:length(x(:,1))
    figure(fignum);
    hold on;
    for i = 2:1:width(x)
        plot([x(j,i-1) x(j,i)]+0.01, [z(j,i-1) z(j,i)], color(7));
    end
    xlim([0 0.15])
    ylim([0 0.3])
    xlabel("x")
    ylabel("z")
    fignum = fignum + 1;
end
figure(fignum)
hold on;
for j = 1:intervalSmoother/2:length(x(:,1))
    for i = 2:1:width(x)
        plot([x(j,i-1) x(j,i)],[z(j,i-1) z(j,i)], color(j-1));
    end
    if(j > 70)
        xyz = 1;
    end
end

pulses = anglesToPulse(phi,theta);