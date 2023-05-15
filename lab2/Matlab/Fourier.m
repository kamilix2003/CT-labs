clear all; close all; clc;

%domain
frequency = 1000;
Vpp = 5;
L = 1/frequency;
N = 5.*1024;
dx = 2*L/(N-1);
x = -L:dx:L;

%%signals
%sin
Sinus = 0*x;
Sinus(1:N) = sin(pi*frequency*x);
%square duty cycle 50
Square50 = 0*x;
Square50(1:N/2-1) = -Vpp/2;
Square50(N/2:N) = Vpp/2;
%square duty cycle 25
Square25 = 0*x;
Square25(1:N/4-1) = -Vpp/2;
Square25(N/4:N) = Vpp/2;
%triangle symetry ratio 50
Triangle50 = 0*x;
Triangle50(1:N/2-1) = Vpp*(1:N/2-1)/N-(Vpp/2);
Triangle50(N/2:N) = -Vpp*(N/2:N)/N+(Vpp/2);
%triangle symetry ratio 40
Triangle40 = 0*x;
Triangle40(1:(4*N/10-1)) = (Vpp/0.4*(1:4*N/10-1))/N-(Vpp*0.5);
Triangle40((4*N/10):N) = -(Vpp/0.6*(4*N/10:N))/N+(Vpp*1.167);
%%RC filters responses
% [S5I, S5D, T4I, T4D, time] = Import_csv('csv/RC_filters_1.csv');
% figure(1);
% plot(time, S5I);
% figure(2)
% plot(time, S5D);
% figure(3)
% plot(time, T4I);
% figure(4)
% plot(time, T4D);

pause(1);
%fourier coefficient
fourier_coefficient(Sinus, frequency, 'sinus', 'sin');
fourier_coefficient(Square50, frequency, 'square wave 50% duty cycle', 'sqr50');
fourier_coefficient(Square25, frequency, 'square wave 25% duty cycle', 'sqr25');
fourier_coefficient(Triangle50, frequency, 'triangle wave 50% symmetry ratio', 'tri50');
fourier_coefficient(Triangle40, frequency, 'triangle wave 40% symmetry ratio', 'tri40');
% [test] = RC_circuit(frequency, N);
% fourier_coefficient(test,frequency, N, 'test', 'test');