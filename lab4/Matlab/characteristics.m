function [] = characteristics(frequency, CH1, CH2, anglediff, name, filename)
fig = figure('Name', name);
fig.Position(3:4) = [1000 500];
H = CH2 ./ CH1;
%% plot 1 linear V gain
% subplot(1, 3, 1);
subplot(1, 2, 1);
% semilogx(frequency, H);
yyaxis left;
plot(frequency, H);
title('Voltage gain vs. frequency')
% subtitle('linear scale')
xlabel('frequency [kHz]')
ylabel('Voltage gain [V]')
grid on;
%% plot 2 log V gain
% subplot(1, 3, 2);
% semilogx(frequency, 20 * log10(H));
yyaxis right;
plot(frequency, 20 * log10(H));
% title('Voltage gain vs. frequency')
% subtitle('logarithmic scale')
% xlabel('frequency [kHz]')
ylabel('Voltage gain [dB]')
legend('Linear scale', 'Logarithmic scale');
grid on;
%% plot 3 phase diff
subplot(1, 2, 2);
% semilogx(frequency, anglediff);
plot(frequency, anglediff);
title('Phase difference vs. frequency')
xlabel('frequency [kHz]')
ylabel('angle [\circ]')
grid on;
print(join(['img/',filename]), '-depsc');
end