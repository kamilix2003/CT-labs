function [A, B] = fourier_coefficient(f)
figure;
frequency = 1;
%domain
L = 1/frequency;
N = 1024;
dx = 2*L/(N-1);
x = -L:dx:L;

%function
plot(x, f); hold on;

%fourier coefficient
A0 = sum(f.*ones(size(x)))*dx;
fFS = A0/2;
for k=1:10
    A(k) = sum(f.*cos(pi*k*x*frequency))*dx;
    B(k) = sum(f.*sin(pi*k*x*frequency))*dx;
    fFS = fFS + A(k)*cos(k*pi*x*frequency) + B(k)*sin(k*pi*x*frequency);
    plot(x, fFS)
end
T = table((1:10)', A', B', 'VariableNames', {'N', 'A', 'B'});
end

