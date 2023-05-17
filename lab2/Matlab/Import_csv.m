function [Square50_integrator, Square50_differentiatior, Triangle40_integrator, Triangle40_differentiatior, time] = Import_csv(filepath)
CSV = readtable(filepath);
first = 10032;
periods = 10;
last = periods * first;
% CSV = rows2vars(CSV);
Triangle40_integrator = table2array(CSV(first:last,2))';
Triangle40_differentiatior= table2array(CSV(first:last,5))';
Square50_integrator = table2array(CSV(first:last,8))';
Square50_differentiatior = table2array(CSV(first:last,11))';
time = table2array(CSV(first:last,1))';
end

