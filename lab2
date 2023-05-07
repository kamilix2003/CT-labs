clear all;

fs = 20000;
duration = 0.1;
N = fs*duration;
t = 0:1/fs:duration-1/fs;
f = 1000;
a = 2.75;
phi = 0;

s = a*sin(2*pi*t*f+phi);
tr = a*sawtooth(2*pi*t*f+phi,0.5);
sq = a*square(2*pi*t*f+phi,50);


%sin
subplot(4,3,1)
plot(t,s)
xlabel('Time (seconds)');
xlim([0,0.002])
ylabel('Amplitude (Volts)');
ylim([-3,3])
title('Time-domain sinus');

%triangle with 50% duty cycle
subplot(4,3,2)
plot(t,tr)
xlabel('Time (seconds)');
xlim([0,0.002])
ylabel('Amplitude (Volts)');
ylim([-3,3])
title('Time-domain triangle');

%square with 50% duty cycle
subplot(4,3,3)
plot(t,sq)
xlabel('Time (seconds)');
xlim([0,0.002])
ylabel('Amplitude (Volts)');
ylim([-3,3])
title('Time-domain square');

%fft sin
s=fft(s);
%fft triangle
tr=fft(tr);
%fft square
sq=fft(sq);


s_oneSide = s(1:N/2);
f = fs*(0:N/2-1)/N; 
S_meg =  abs(s_oneSide)/(N/2);

tr_oneSide = tr(1:N/2);
f = fs*(0:N/2-1)/N; 
Tr_meg =  abs(tr_oneSide)/(N/2);

sq_oneSide = sq(1:N/2);
f = fs*(0:N/2-1)/N; 
Sq_meg =  abs(sq_oneSide)/(N/2);



subplot(4,3,4)
plot(f,S_meg);
xlabel('Frequency (Hz)');
xlim([0,fs/2])
ylabel('Magnitude');
title('Frequency spectrum');

subplot(4,3,5)
plot(f,Tr_meg);
xlabel('Frequency (Hz)');
xlim([0,fs/2])
ylabel('Magnitude');
title('Frequency spectrum');

subplot(4,3,6)
plot(f,Sq_meg);
xlabel('Frequency (Hz)');
xlim([0,fs/2])
ylabel('Magnitude');
title('Frequency spectrum');


subplot(4,3,7)
stem(f,S_meg);
xlabel('Frequency (Hz)');
xlim([0,fs/2])
ylabel('Magnitude');
title('Frequency spectrum');

subplot(4,3,8)
stem(f,Tr_meg);
xlabel('Frequency (Hz)');
xlim([0,fs/2])
ylabel('Magnitude');
title('Frequency spectrum');

subplot(4,3,9)
stem(f,Sq_meg);
xlabel('Frequency (Hz)');
xlim([0,fs/2])
ylabel('Magnitude');
title('Frequency spectrum');

subplot(4,3,10)
stem(f,angle(s_oneSide)*180/pi);
xlabel('Frequency (Hz)');
xlim([0,200])
ylabel('Phase (deg)');
ylim([-180,180])
title('Angle spectrum');

subplot(4,3,11)
stem(f,angle(tr_oneSide)*180/pi);
xlabel('Frequency (Hz)');
xlim([0,200])
ylabel('Phase (deg)');
ylim([-180,180])
title('Angle spectrum');

subplot(4,3,12)
stem(f,angle(sq_oneSide)*180/pi);
xlabel('Frequency (Hz)');
xlim([0,200])
ylabel('Phase (deg)');
ylim([-180,180])
title('Angle spectrum');


