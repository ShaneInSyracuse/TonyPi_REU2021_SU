%% Clear Workspace
clc
clear
close all

%% Data
time = 6.08;
distance = [71.1, 61.5, 58.5, 45.8, 0];
ratios = [1, 0.75, 0.5, 0.25, 0];
speed = distance ./ time;
u_time = 0.005;
u_distance = 0.005;
u_speed = zeros(length(speed),1) + sqrt(u_time.^2 + u_distance.^2);

%% Lin Reg
[b,S] = polyfit(ratios, speed, 1);
yLinReg = b(1) .* ratios + b(2);
r = corrcoef(speed, yLinReg);
r_2 = round(1000*r(2,1).^2)/1000;

%% Plot
figure(1)
hold on;
scatter(ratios, speed, 'bo' )
plot(ratios, yLinReg)
errorbar(ratios, speed, -u_speed, u_speed, 'LineStyle', 'none')
title("Speed of TonyPi based on Intended Stride Length")
xlabel("Ratio of Intended Stride Length to Reference Stride Length")
ylabel("Speed (mm/s)")
legend("Experimental Values", "Linear Regression, r^2 = " + r_2, "Uncertainty in Speed", 'Location', 'southeast')