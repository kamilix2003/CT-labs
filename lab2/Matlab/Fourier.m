clear all; close all; clc;

%domain
frequency = 1000;
Vpp = 5;
L = 1/frequency;
N = 2048;
dx = 2*L/(N-1);
x = -L:dx:L;

%%signals
%sin
Sinus = 0*x;
Sinus(1:N) = sin(2*pi*frequency*x);
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

RC_circuit(Square25, x);
pause(1);
%fourier coefficient
fourier_coefficient(Sinus, frequency, N, 'sinus');
fourier_coefficient(Square50, frequency, N, 'square wave 50% duty cycle');
fourier_coefficient(Square25, frequency, N, 'square wave 25% duty cycle');
fourier_coefficient(Triangle50, frequency, N, 'triangle wave 50% symmetry ratio');
fourier_coefficient(Triangle40, frequency, N, 'triangle wave 40% symmetry ratio');