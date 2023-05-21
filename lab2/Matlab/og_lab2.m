%% converted to Final_Plot function
% figure(123);
% %sin
% subplot(4,3,1)
% plot(t,s)
% xlabel('Time (seconds)');
% xlim([0,0.002])
% ylabel('Amplitude (Volts)');
% ylim([-3,3])
% title('Time-domain sinus');
% 
% %triangle with 50% duty cycle
% subplot(4,3,2)
% plot(t,tr)
% xlabel('Time (seconds)');
% xlim([0,0.002])
% ylabel('Amplitude (Volts)');
% ylim([-3,3])
% title('Time-domain triangle');
% 
% %square with 50% duty cycle
% subplot(4,3,3)
% plot(t,sq)
% xlabel('Time (seconds)');
% xlim([0,0.002])
% ylabel('Amplitude (Volts)');
% ylim([-3,3])
% title('Time-domain square');
% 
% %fft sin
% s_fft = fft(s);
% %fft triangle
% tr_fft = fft(tr);
% %fft square
% sq_fft = fft(sq);
% 
% s_oneSide = s_fft(1:N/2);
% frequencies = fs * (0:N/2-1) / N; 
% S_magnitude = abs(s_oneSide) / (N/2);
% S_phase = angle(s_oneSide) * 180/pi;
% 
% tr_oneSide = tr_fft(1:N/2);
% Tr_magnitude = abs(tr_oneSide) / (N/2);
% Tr_phase = angle(tr_oneSide) * 180/pi;
% 
% sq_oneSide = sq_fft(1:N/2);
% Sq_magnitude = abs(sq_oneSide) / (N/2);
% Sq_phase = angle(sq_oneSide) * 180/pi;
% 
% freq_of_interest = [1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000, 11000];
% indices = zeros(size(freq_of_interest));
% for i = 1:length(freq_of_interest)
%     [~, indices(i)] = min(abs(frequencies - freq_of_interest(i)));
% end
% 
% subplot(4,3,4)
% plot(frequencies, db(S_magnitude));
% xlabel('Frequency (Hz)');
% xlim([0, 11000]);
% ylim([-40, 10]);
% ylabel('Magnitude');
% title('Frequency spectrum');
% 
% subplot(4,3,5)
% plot(frequencies, db(Tr_magnitude));
% xlabel('Frequency (Hz)');
% xlim([0, 11000]);
% ylabel('Magnitude');
% ylim([-40, 10]);
% title('Frequency spectrum');
% 
% subplot(4,3,6)
% plot(frequencies, db(Sq_magnitude));
% xlabel('Frequency (Hz)');
% xlim([0, 11000]);
% ylabel('Magnitude');
% ylim([-20, 10]);
% title('Frequency spectrum');
% 
% 
% subplot(4,3,7)
% stem(frequencies(indices), S_magnitude(indices));
% xlabel('Frequency (Hz)');
% xlim([0, 11000]);
% ylabel('Magnitude');
% title('Frequency spectrum');
% 
% subplot(4,3,8)
% stem(frequencies(indices), Tr_magnitude(indices));
% xlabel('Frequency (Hz)');
% xlim([0, 11000]);
% ylabel('Magnitude');
% title('Frequency spectrum');
% 
% subplot(4,3,9)
% stem(frequencies(indices), Sq_magnitude(indices));
% xlabel('Frequency (Hz)');
% xlim([0, 11000]);
% ylabel('Magnitude');
% title('Frequency spectrum');
% 
% 
% subplot(4,3,10)
% stem(frequencies(indices), S_phase(indices));
% xlabel('Frequency (Hz)');
% xlim([0, 11000]);
% ylabel('Phase (deg)');
% ylim([-180, 180]);
% title('Phase spectrum');
% 
% subplot(4,3,11)
% stem(frequencies(indices), Tr_phase(indices));
% xlabel('Frequency (Hz)');
% xlim([0, 11000]);
% ylabel('Phase (deg)');
% ylim([-200, 200]);
% title('Phase spectrum');
% 
% subplot(4,3,12)
% stem(frequencies(indices), Sq_phase(indices));
% xlabel('Frequency (Hz)');
% xlim([0, 11000]);
% ylabel('Phase (deg)');
% ylim([-200, 200]);
% title('Phase spectrum');
