function [color] = color(i)
if mod(i, 7) == 1
    color = "y";
elseif mod(i, 7) == 2
    color = "m";        
elseif mod(i, 7) == 3
    color = "c";
elseif mod(i, 7) == 4
    color = "r";
elseif mod(i, 7) == 5
    color = "g";
elseif mod(i, 7) == 6
    color = "b";
else
    color = "k";
end

