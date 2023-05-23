function [Z] = import_csv(file)
CSV = readtable(file);
z11 = table2array(CSV(1, 7));
z21 = table2array(CSV(2, 7));
z12 = table2array(CSV(3, 7));
z22 = table2array(CSV(4, 7));
Z = [[z11, z12];
     [z21, z22]];
end