function [amplitude, phase, T] = fourier_coefficient(f, frequency, name, filename)
figure('Name', name);
%domain
N = size(f,2);
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
    AB(k) = sqrt(A(k).^2.+B(k).^2);
    % phi = angle(conj(complex(A(k), B(k))));
    fFS = fFS + A(k)*cos(k*pi*x*frequency) + B(k)*sin(k*pi*x*frequency);
    % fFS = fFS + AB(k)*cos((k*pi*x*frequency)+phi);
    plot(x, fFS);
    pause(.05);
end
% amplitude = 20 .* log10(AB/AB(1));
amplitude = AB;
phase = rad2deg(angle(conj(complex(A, B))));
% phase = atand(-B/A);
subplot(2,4,[5,6]);
stem(amplitude);
title('subplot 2: amplitude');
subplot(2,4,[7,8]);
stem(phase);
title('subplot 3: phase')
%T = table((1:10)', amplitude', phase', 'VariableNames', {'N', 'Amplitude', 'Phase'});
print(join(['img/',filename]), '-deps');
end

