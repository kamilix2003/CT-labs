clear all; close all; clc;

%domain
frequency = 1000;
L = 1/frequency;
N = 1024;
dx = 2*L/(N-1);
x = -L:dx:L;

%function
f = 0*x;
f(1:N/2) = -1;
f(N/2+1:N) = 1;

%fourier coefficient
[A, B] = fourier_coefficient(f);
T = table((1:10)', A', B', 'VariableNames', {'N', 'A', 'B'});