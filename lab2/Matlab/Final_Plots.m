function [] = Final_Plots(f, name, filename)
frequency = 1000;
duration = 10/frequency;
N = size(f,2);
sampling_frequency = N/duration;
t = 0:1/sampling_frequency:duration-1/sampling_frequency;
figure('Name', name);

%% signal
subplot(4,1,1);
plot(t, f);
xlabel('Time (seconds)');
xlim([0,0.001])
ylabel('Amplitude (Volts)');
ylim([-max(f)-1,max(f)+1])
title(join(['', name]));

%% fourier series
X = t(1:size(t,2)/10);
% f_short = f(1:size(x,2));
L = 1/frequency;
dx = 2*L/(N/10-1);
x = -L:dx:L;
f_short = f(1:size(x,2));
subplot(4,1,2); hold on;
% plot(x, f_short, 'r*');
A0 = (1/L)*sum(f_short.*ones(size(x)))*dx;
fFS = A0/2;
for k=1:10
    A(k) = (1/L)*sum(f_short.*cos(pi*k*x*frequency))*dx;
    B(k) = (1/L)*sum(f_short.*sin(pi*k*x*frequency))*dx;
    fFS = fFS + A(k)*cos(k*pi*x*frequency) + B(k)*sin(k*pi*x*frequency);
    plot(X, fFS);
    pause(.05);
end
plot(X, fFS,'LineWidth',2);
hold off;

xlabel('Time (seconds)');
xlim([0,0.001])
ylabel('Amplitude (Volts)');
ylim([-max(f)-1,max(f)+1])
title(join(['Fourier series expansion of ', name]));

%% fft amplitude
% plot
f_fft = fft(f);
f_oneSide = f_fft(1:N/2);
frequencies = sampling_frequency * (0:N/2-1) / N; 
f_magnitude = abs(f_oneSide) / (N/2);
f_phase = angle(f_oneSide) * 180/pi;

freq_of_interest = [1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000, 11000];
indices = zeros(size(freq_of_interest));
for i = 1:length(freq_of_interest)
    [~, indices(i)] = min(abs(frequencies - freq_of_interest(i)));
end

% subplot(4,1,2)
% plot(frequencies, db(f_magnitude));
% xlabel('Frequency (Hz)');
% xlim([0, 11000]);
% ylim([-40, 10]);
% ylabel('Magnitude');
% title('Frequency spectrum');

%stem
subplot(4,1,3)
stem(frequencies(indices), f_magnitude(indices), 'x');
xlabel('Frequency (Hz)');
xlim([0, 11000]);
ylabel('Magnitude');
title('Frequency spectrum');

%% fft phase
subplot(4,1,4)
stem(frequencies(indices), f_phase(indices), 'x');
xlabel('Frequency (Hz)');
xlim([0, 11000]);
ylabel('Phase (deg)');
ylim([-180, 180]);
title('Phase spectrum');

%% saving img
print(join(['img/',filename]), '-deps');
end

