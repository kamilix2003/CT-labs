function [frequency, CH1, CH2, anglediff] = import_csv(file)
CSV = readtable(file, VariableNamingRule="preserve");
N = size(CSV,1);
frequency = table2array(CSV(1:N,1));
CH1 = table2array(CSV(1:N,2));
CH2 = table2array(CSV(1:N,3));
anglediff = table2array(CSV(1:N,4));
end