function [finalArray] = smoothIntervals(initial,numIntervals)
for n = 0:1:length(initial(:,1))-2
    finalArray(n*numIntervals + 1,:) = initial(n+1,:);
    for i = 2:1:numIntervals
        for j = 1:1:length(initial(n+1,:))
            finalArray(n*numIntervals + i,j) = initial(n+1,j) + (initial(n+2,j) - initial(n+1,j))*(i-1)/(numIntervals-1); 
        end
    end
end
end

