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
syms response1(t)
C1 = 47e-9;
R = 1.5e3;
response1(t) = ilaplace(laplace(square) * (1/(s*C1))/(R + 1/(s*C1)));
steps = 10000;
step = T/steps;
t = step:step:T;
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
xticklabels({join(['10% =', string(round(xpercent10,9))]) join(['\tau =', string(round(tauA1,9))]) join(['90% =', string(round(xpercent90,9))]) join(['5\tau =', string(round(tauA5, 5))]) join(['10\tau =', string(round(tauA10, 5))])})
yticks(sort(double([response1(T/2+tauA1) percent10 percent90 response1(T/2+tauA5)]),2, "ascend"));
plot(t, x)
ylim([offset-0.2, amplitude+offset+0.2])
xlim([0.49*T, T/2 + tauA10])
print('img/CircuitA','-depsc')

%% Circuit B
syms response1(t)
C2 = 10e-9;
R = 1.5e3;
response1(t) = ilaplace(laplace(square) * R/(R + 1/(s*C2)));
steps = 10000;
step = T/steps;
t = 0.49*T:step:T*3/4;
x = response1(t);
tauA = 1.5e3 * 10e-9;
tauA1 = tauA;
tauA5 = 5*tauA;
tauA10 = 10*tauA;
percent10 = 0.1*max(x) + offset;
percent90 = 0.9*max(x);
invresponse = finverse(response1);
xpercent10 = double(invresponse(percent10));
xpercent90 = double(invresponse(percent90));
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
xticklabels({join(['10% =', string(round(xpercent10,9))]) join(['\tau =', string(round(tauA1,9))]) join(['90% =', string(round(xpercent90,9))]) join(['5\tau =', string(round(tauA5, 5))]) join(['10\tau =', string(round(tauA10, 5))])})
yticks(sort(double([response1(T/2+tauA1) percent10 percent90 response1(T/2+tauA5)]),2, "ascend"));
plot(t, x)
ylim([-0.2, amplitude+offset+0.2])
xlim([0.498*T, T/2 + tauA10])
print('img/CircuitB','-depsc')

% %% Circuit C
% syms R1 R2 C1 L1 response33(t, C1, L1) response32(t, C1, L1, R2) response(t, C1, L1, R1)
% response33(t, C1 , L1) = ilaplace(laplace(square) * (s*L1)/(s*L1 + 1/(s*C1)))
% response32(t, C1, L1, R2) = ilaplace(laplace(square) * (s*L1)/(s*L1 + 1/(s*C1) + R2))
% steps = 1000;
% step = T/steps;
% t = step:step:T;
% x = response33(t, 33e3, 10e-3);
% x32 = response32(t, 33e3, 10e-3, 1.1e3)
% figure('Name','Circuit C33')
% plot(t, x); hold on;
% plot(t, x32)
% ylim([-0.2, 2])
% 


