function [maxima, maxindex] = find_maxima(x)
maxima(1:20) = 1;
maxindex(1:20) = 1;
minima(1:20) = 1;
minindex(1:20) = 1;
temp_x = double(x);
for k=1:20
    [maxima(k), maxindex(k)] = max(temp_x(minindex(k),size(temp_x)))
    [minima(k), minindex(k)] = min(temp_x(maxindex(k),size(temp_x)))
end
end

