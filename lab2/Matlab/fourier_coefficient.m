function [amplitude, phase, T] = fourier_coefficient(f, frequency, N, name)
figure('Name', name);
%domain
L = 1/frequency;
dx = 2*L/(N-1);
x = -L:dx:L;

%function
subplot(2,4,[1,4]);
plot(x, f); hold on;
title(join(['Subplot 1:',name]));

%fourier coefficient
A0 = (1/L)*sum(f.*ones(size(x)))*dx;
fFS = A0/2;
for k=1:10
    A(k) = (1/L)*sum(f.*cos(pi*k*x*frequency))*dx;
    B(k) = (1/L)*sum(f.*sin(pi*k*x*frequency))*dx;
    fFS = fFS + A(k)*cos(k*pi*x*frequency) + B(k)*sin(k*pi*x*frequency);
    plot(x, fFS);
    pause(.01);
end
amplitude = sqrt(A.^2.+B.^2);
phase = rad2deg(angle(conj(complex(A, B))));
subplot(2,4,[5,6]);
stem(amplitude);
title('subplot 2: amplitude');
subplot(2,4,[7,8]);
stem(phase);
title('subplot 3: phase')
%T = table((1:10)', amplitude', phase', 'VariableNames', {'N', 'Amplitude', 'Phase'});
end

