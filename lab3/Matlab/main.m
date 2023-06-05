clear all; close all; clc;


%% Square wave
syms t s square
f = 100;
T = 1/f;
w = 2 * pi * f;
amplitude = 1;
offset = 0.5;
square = amplitude *heaviside(t - T/2) - amplitude *heaviside(t - T) + offset * heaviside(t);


%% Circuit A
C1 = 47e-9;
R = 1.5e3;
response1(t) = ilaplace(laplace(square) * (1/(s*C1))/(R + 1/(s*C1)));
steps = 1000;
step = (0.6*T-0.49*T)/steps;
t = 0.49*T:step:0.6*T;
x = response1(t);
tauA = 1.5e3 * 47e-9;
tauA1 = tauA;
tauA5 = 5*tauA;
tauA10 = 10*tauA;
percent10 = 0.1*max(x) + offset;
percent90 = 0.9*max(x);
invresponse = finverse(response1);
xpercent10 = double(invresponse(percent10));
xpercent90 = double(invresponse(percent90));
% figures
fig = figure('Name', 'Circuit A');
fig.Position(3:4) = [600 400];
grid on;
hold on;
plot(T/2+tauA1, response1(T/2+tauA1), 'ro')
plot(T/2+tauA5, response1(T/2+tauA5), 'ro')
plot(T/2+tauA10, response1(T/2+tauA10), 'ro')
plot(xpercent10, percent10, 'ro')
plot(xpercent90, percent90, 'ro')
xticks([xpercent10, T/2+tauA1, xpercent90, T/2+tauA5, T/2+tauA10]);
xticklabels({'10%' '\tau' '90%' '5\tau' '10\tau'})
yticks(sort(double([response1(T/2+tauA1) percent10 percent90 response1(T/2+tauA5)]),2, "ascend"));
plot(t, x)
ylim([offset-0.2, amplitude+offset+0.2])
xlim([0.49*T, T/2 + 1.1*tauA10])
xtickangle(45)
title('Circuit A response')
xlabel('time [s]')
ylabel('voltage [V]')
print('img/CircuitA','-depsc')

%% Circuit B
C2 = 10e-9;
R = 1.5e3;
response1(t) = ilaplace(laplace(square) * R/(R + 1/(s*C2)));
steps = 1000;
step = (0.6*T-0.49*T)/steps;
t = 0.49*T:step:0.6*T;
x = response1(t);
tauA = 1.5e3 * 10e-9;
tauA1 = tauA;
tauA5 = 5*tauA;
tauA10 = 10*tauA;
percent10 = double(0.1*max(x))
percent90 = double(0.9*max(x))
invresponse = finverse(response1);
xpercent10 = double(invresponse(percent10))
xpercent90 = double(invresponse(percent90))
xpercent90 - T/2
xpercent10 - T/2
% figures
fig = figure('Name', 'Circuit B');
fig.Position(3:4) = [600 400];
grid on;
hold on;
plot(T/2+tauA1, response1(T/2+tauA1), 'ro')
plot(T/2+tauA5, response1(T/2+tauA5), 'ro')
plot(T/2+tauA10, response1(T/2+tauA10), 'ro')
plot(xpercent10, percent10, 'ro')
plot(xpercent90, percent90, 'ro')
xticks(sort([xpercent10, T/2+tauA1, xpercent90, T/2+tauA5, T/2+tauA10],2,"ascend"));
xticklabels({'10%' '\tau' '90%' '5\tau' '10\tau'})
yticks(sort(double([response1(T/2+tauA1) percent10 percent90 response1(T/2+tauA5)]),2, "ascend"));
plot(t, x)
ylim([-0.2, amplitude])
xlim([0.498*T, T/2 + 1.1*tauA10])
xtickangle(45)
title('Circuit B response')
xlabel('time [s]')
ylabel('voltage [V]')
print('img/CircuitB','-depsc')

%% Circuit C
R3 = 50;
R2 = 1.15e3;
R1 = 3.35e3;
C = 33e-9;
L = 10e-3;
response33(t) = ilaplace(laplace(square) * (s*L)/(R3 + 1/(s*C)+s*L));
response32(t) = ilaplace(laplace(square) * (s*L)/(R2 + 1/(s*C)+s*L));
response31(t) = ilaplace(laplace(square) * (s*L)/(R1 + 1/(s*C)+s*L));
response33out(t) = ilaplace(laplace(square) * (s*L + 1/(s*C))/(R3 + 1/(s*C)+s*L));
response32out(t) = ilaplace(laplace(square) * (s*L + 1/(s*C))/(R2 + 1/(s*C)+s*L));
response31out(t) = ilaplace(laplace(square) * (s*L + 1/(s*C))/(R1 + 1/(s*C)+s*L));
steps = 1000;
step = (0.8*T-0.49*T)/steps;
t = 0.49*T:step:0.8*T;

% R3
x = response33(t);
figure('Name','Circuit C3')
TF = islocalmax(double(x));
TF(5) = 0;
MF = islocalmin(double(x), 'MaxNumExtrema', 1);
plot(t, x, t(TF), x(TF), 'ro', t(MF), x(MF), 'bo')
ylim([double(min(x)-0.1*max(x)), double(max(x)+0.1*(max(x)))])
xlim([0.49*T 0.8*T])
title('Voltage of coil L_{21} with series resistance 50\Omega')
xlabel('time [s]')
ylabel('voltage [V]')
print('img/CircuitC3','-depsc')

x = response33out(t);
figure('Name','Circuit C3')
TF = islocalmax(double(x));
TF(5) = 0;
MF = islocalmin(double(x));
plot(t, x, t(TF), x(TF), 'ro', 0.0050271, 1.41531, 'bo')
ylim([double(min(x)-0.1*max(x)), double(max(x)+0.1*(max(x)))])
xlim([0.49*T 0.8*T])
title('Output voltage with series resistance 50\Omega')
xlabel('time [s]')
ylabel('voltage [V]')
print('img/CircuitC3out','-depsc')

% R2
x = response32(t);
figure('Name','Circuit C2')
TF = islocalmax(double(x), 'MaxNumExtrema', 10);
TF(5) = 0;
MF = islocalmin(double(x));
plot(t, x, t(TF), x(TF), 'ro', t(MF), x(MF), 'bo')
ylim([double(min(x)-0.1*max(x)), double(max(x)+0.1*(max(x)))])
xlim([0.496*T 0.52*T])
title('Voltage of coil L_{21} with series resistance 1.15k\Omega')
xlabel('time [s]')
ylabel('voltage [V]')
print('img/CircuitC2','-depsc')

x = response32out(t);
figure('Name','Circuit C2')
TF = islocalmax(double(x));
TF(5) = 0;
MF = islocalmin(double(x));
plot(t, x, t(TF), x(TF), 'ro', t(MF), x(MF), 'bo')
ylim([double(min(x)-0.1*max(x)), double(max(x)+0.1*(max(x)))])
xlim([0.496*T 0.52*T])
title('Output voltage with series resistance 1.15k\Omega')
xlabel('time [s]')
ylabel('voltage [V]')
print('img/CircuitC2out','-depsc')

% R1
x = response31(t);
figure('Name','Circuit C1')
TF = islocalmax(double(x));
TF(5) = 0;
MF = islocalmin(double(x), 'MaxNumExtrema', 1);
plot(t, x, t(TF), x(TF), 'ro', t(MF), x(MF), 'bo')
ylim([double(min(x)-0.1*max(x)), double(max(x)+0.1*(max(x)))])
xlim([0.496*T 0.52*T])
title('Voltage of coil L_{21} with series resistance 3.35k\Omega')
xlabel('time [s]')
ylabel('voltage [V]')
print('img/CircuitC1','-depsc')

x = response31out(t);
figure('Name','Circuit C1')
TF = islocalmax(double(x));
TF(5) = 0;
MF = islocalmin(double(x), 'MaxNumExtrema', 1);
plot(t, x, t(TF), x(TF), 'ro', t(MF), x(MF), 'bo')
ylim([double(min(x)-0.1*max(x)), double(max(x)+0.1*(max(x)))])
xlim([0.496*T 0.6*T])
title('Output voltage with series resistance 3.35k\Omega')
xlabel('time [s]')
ylabel('voltage [V]')
print('img/CircuitC1out','-depsc')



