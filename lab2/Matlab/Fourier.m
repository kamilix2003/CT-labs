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
[Square50_integrator, Square50_differentiatior, Triangle40_integrator, Triangle40_differentiatior, time] = Import_csv('csv/RC_filters.csv');

pause(1);
%fourier coefficient
fourier_coefficient(Sinus, frequency, 'sinus', 'sin');
fourier_coefficient(Square50, frequency, 'square wave 50% duty cycle', 'sqr50');
fourier_coefficient(Square25, frequency, 'square wave 25% duty cycle', 'sqr25');
fourier_coefficient(Triangle50, frequency, 'triangle wave 50% symmetry ratio', 'tri50');
fourier_coefficient(Triangle40, frequency, 'triangle wave 40% symmetry ratio', 'tri40');
% fourier_coefficient(Square50_integrator, frequency, 'RC low-pass filter square wave 50% duty cycle', 'RCLPsqr50');
% fourier_coefficient(Square50_differentiatior, frequency, 'RC high-pass filter square wave 50% duty cycle', 'RCHPsqr50');
% fourier_coefficient(Triangle40_integrator, frequency, 'RC low-pass filter triangle wave 40% symmetry ratio', 'RCLPtri40');
% fourier_coefficient(Triangle40_differentiatior, frequency, 'RC high-pass filter triangle wave 40% symmetry ratio', 'RCHPtri40');