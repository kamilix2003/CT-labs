clear all; close all; clc;

[frequency1_1, CH1_11, CH2_11, anglediff_11] = import_csv('../csv/11.csv');
[frequency1_2, CH1_12, CH2_12, anglediff_12] = import_csv('../csv/12.csv');
[frequency_131, CH1_131, CH2_131, anglediff_131] = import_csv('../csv/131.csv');
[frequency_132, CH1_132, CH2_132, anglediff_132] = import_csv('../csv/132.csv');
characteristics(frequency1_1, CH1_11, CH2_11, anglediff_11, '11', '11');
characteristics(frequency1_2, CH1_12, CH2_12, anglediff_12, '12', '12');
characteristics(frequency_131, CH1_131, CH2_131, anglediff_131, '131', '131');
characteristics(frequency_132, CH1_132, CH2_132, anglediff_132, '132', '132');

% close all;