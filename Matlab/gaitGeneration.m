function [phi, theta] = gaitGeneration(speedRatios,quarterGaits,rad,leanAngle)
maxStrideLength = 2*(rad)*cos(pi/4);
count = 1;
isLeft = true;
for i = 1:1:length(speedRatios)
    intendedStrideLength = speedRatios(i) * maxStrideLength;
    expectedAngle = 180/pi*acos((intendedStrideLength)/(2*rad));
    
    for j = 1:1:quarterGaits(i)
        if(i == 1 && j == 1)
            for(d=1) %Standing to MidGait(L)
                phi(count,:) = pi/180 .*[90, 90, 60, 120, 90, 90, -90, -90, -60, -120, -90, -90];
                theta(count,:) = pi/180 .*[90, 90, 90, 90, 90, 45, 45, 90, 90, 90, 90, 90];
                count = count + 1;
                phi(count,:) = pi/180 .*[90, 90, 60, 120, 90, 90, -90, -90, -expectedAngle-20, -180+expectedAngle+20, -90, -90];
                theta(count,:) = pi/180 .*[90, 90 + leanAngle, 90, 90, 90, 45, 45, 90, 90, 90, 90 + leanAngle, 90];
                count = count + 1;
                phi(count,:) = pi/180 .*[90, 90, expectedAngle, 180-expectedAngle, 90, 90, -90, -90, -expectedAngle-20, -expectedAngle-20, -90, -90];
                theta(count,:) = pi/180 .*[90, 90 + leanAngle, 90, 90, 90, 45, 45, 90, 90, 90, 90 + leanAngle, 90];
                count = count + 1;
                phi(count,:) = pi/180 .*[90, 90, expectedAngle, 180-expectedAngle, 90, 90, -90, -90, -expectedAngle, -expectedAngle, -90, -90];
                theta(count,:) = pi/180 .*[90, 90 + leanAngle, 90, 90, 90, 45, 45, 90, 90, 90, 90 + leanAngle, 90];
                isLeft = false;
            end
        else
            if(isLeft)
                for(d=1)%MidGait(R) to Standing
                    count = count + 1;
                    phi(count,:) = pi/180 .*[90, 90, 180-expectedAngle, 180-expectedAngle, 90, 90, -90, -90, -expectedAngle, -180+expectedAngle, -90, -90];
                    theta(count,:) = pi/180 .*[90, 90 + leanAngle, 90, 90, 90, 45, 45, 90, 90, 90, 90 + leanAngle, 90];
                    count = count + 1;
                    phi(count,:) = pi/180 .*[90, 90, expectedAngle, 180-expectedAngle, 90, 90, -90, -90, -expectedAngle, -180+expectedAngle, -90, -90];
                    theta(count,:) = pi/180 .*[90, 90 + leanAngle, 90, 90, 90, 45, 45, 90, 90, 90, 90 + leanAngle, 90];
                end
                if (i == length(speedRatios) && j == quarterGaits(i))
                    count = count + 1;
                    phi(count,:) = pi/180 .*[90, 90, 60, 120, 90, 90, -90, -90, -60, -120, -90, -90];
                    theta(count,:) = pi/180 .*[90, 90, 90, 90, 90, 45, 45, 90, 90, 90, 90, 90];
                else
                    j = j+1;
                    for(d=1)%Standing to MidGait(L)
                        count = count + 1;
                        phi(count,:) = pi/180 .*[90, 90, 60, 120, 90, 90, -90, -90, -expectedAngle-20, -180+expectedAngle+20, -90, -90];
                        theta(count,:) = pi/180 .*[90, 90 + leanAngle, 90, 90, 90, 45, 45, 90, 90, 90, 90 + leanAngle, 90];
                        count = count + 1;
                        phi(count,:) = pi/180 .*[90, 90, expectedAngle, 180-expectedAngle, 90, 90, -90, -90, -expectedAngle-20, -expectedAngle-20, -90, -90];
                        theta(count,:) = pi/180 .*[90, 90 + leanAngle, 90, 90, 90, 45, 45, 90, 90, 90, 90 + leanAngle, 90];
                        count = count + 1;
                        phi(count,:) = pi/180 .*[90, 90, expectedAngle, 180-expectedAngle, 90, 90, -90, -90, -expectedAngle, -expectedAngle, -90, -90];
                        theta(count,:) = pi/180 .*[90, 90 + leanAngle, 90, 90, 90, 45, 45, 90, 90, 90, 90 + leanAngle, 90];
                    end
                end
                isLeft = false;
            else
                for(d=1)%MidGait(L) to Standing
                    count = count + 1;
                    phi(count,:) = pi/180 .*[90, 90, expectedAngle, 180-expectedAngle, 90, 90, -90, -90, -expectedAngle, -expectedAngle, -90, -90];
                    theta(count,:) = pi/180 .*[90, 90 - leanAngle, 90, 90, 90, 45, 45, 90, 90, 90, 90 - leanAngle, 90];
                    count = count + 1;
                    phi(count,:) = pi/180 .*[90, 90, expectedAngle, 180-expectedAngle, 90, 90, -90, -90, -expectedAngle, -(180-expectedAngle), -90, -90];
                    theta(count,:) = pi/180 .*[90, 90 - leanAngle, 90, 90, 90, 45, 45, 90, 90, 90, 90 - leanAngle, 90];
                end
                if(i == length(speedRatios) && j == quarterGaits(i))
                    count = count + 1;
                    phi(count,:) = pi/180 .*[90, 90, 60, 120, 90, 90, -90, -90, -60, -120, -90, -90];
                    theta(count,:) = pi/180 .*[90, 90, 90, 90, 90, 45, 45, 90, 90, 90, 90, 90];
                else
                    j = j + 1;
                    for(d = 1)%Standing to MidGait(R)
                        count = count + 1;
                        phi(count,:) = pi/180 .*[90, 90, expectedAngle-20, 180-expectedAngle+20, 90, 90, -90, -90, -expectedAngle, -180+expectedAngle, -90, -90];
                        theta(count,:) = pi/180 .*[90, 90 - leanAngle, 90, 90, 90, 45, 45, 90, 90, 90, 90 - leanAngle, 90];
                        count = count + 1;
                        phi(count,:) = pi/180 .*[90, 90, 180-expectedAngle+20, 180-expectedAngle+20, 90, 90, -90, -90, -expectedAngle, -180+expectedAngle, -90, -90];
                        theta(count,:) = pi/180 .*[90, 90 - leanAngle, 90, 90, 90, 45, 45, 90, 90, 90, 90 - leanAngle, 90];
                        count = count + 1;
                        phi(count,:) = pi/180 .*[90, 90, 180-expectedAngle, 180-expectedAngle, 90, 90, -90, -90, -expectedAngle, -180+expectedAngle, -90, -90];
                        theta(count,:) = pi/180 .*[90, 90 - leanAngle, 90, 90, 90, 45, 45, 90, 90, 90, 90 - leanAngle, 90];
                    end
                end
                isLeft = true;
            end
        end
    end
end

end