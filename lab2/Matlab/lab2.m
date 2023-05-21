clear all; close all; clc;
[Square50_integrator, Square50_differentiatior, Triangle40_integrator, Triangle40_differentiatior, time] = Import_csv('csv/RC_filters.csv');

fs = 100000;
duration = 0.01;
N = fs * duration;
t = 0:1/fs:duration-1/fs;
f = 1000;
a = 2.119;
phi = 0;

a = 2.5;
phi = 0;

s = a * sin(2*pi*t*f + phi);
tr50 = a * sawtooth(2*pi*t*f + phi, 0.5);
tr40 = a * sawtooth(2*pi*t*f + phi, 0.4);
% tr50 = tr50(size(tr50, 2)/40:size(tr50, 2));

sq50 = a * square(2*pi*t*f + phi, 50);
sq25 = a * square(2*pi*t*f + phi, 25);

Final_Plots(s, 'Sin wave', 'sin');
Final_Plots(tr50, 'Triangle wave 50% symmetry ratio', 'tri50');
Final_Plots(tr40, 'Triangle wave 40% symmetry ratio', 'tri40');
Final_Plots(sq50, 'Square wave 50% duty cycle', 'sqr50');
Final_Plots(sq25, 'Square wave 25% duty cycle', 'sqr25');
Final_Plots(Square50_integrator,['Low-pass filter response for' newline 'Square wave 50% duty cycle'], 'RCLPsqr50');
Final_Plots(Square50_differentiatior,['High-pass filter response for' newline 'Square wave 50% duty cycle'], 'RCHPsqr50');
Final_Plots(Triangle40_integrator,['Low-pass filter response for' newline 'Triangle wave 40% symmetry ratio'], 'RCLPtri40');
Final_Plots(Triangle40_differentiatior,['High-pass filter response for' newline 'Triangle wave 40% symmetry ratio'], 'RCHPtri40');

close all;