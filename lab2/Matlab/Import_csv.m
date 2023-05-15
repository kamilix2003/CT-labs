function [Square50_integrator, Square50_differentiatior, Triangle40_integrator, Triangle40_differentiatior, time] = Import_csv(filepath)
CSV = readtable(filepath);
% CSV = rows2vars(CSV);
Triangle40_integrator = table2array(CSV(:,2));
Triangle40_differentiatior= table2array(CSV(:,5));
Square50_integrator = table2array(CSV(:,8));
Square50_differentiatior = table2array(CSV(:,11));
time = table2array(CSV(:,1));
end

