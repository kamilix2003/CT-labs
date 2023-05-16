function [Vout] = RC_circuit(frequency, N)
figure('Name', 'RC circuit');
Vpp = 5;
frequency = 1000;
T = 1/frequency;
R = 1.5e3;
C1 = 47e-4;
C2 = 10;
dt = T/(N-1);
t = 0:dt:T;
Vout = 0*t;
Vout(N/2+1:N) = Vout(N/2+1:N) + Vpp;
Vout(N/2+1:N) = Vout(N/2+1:N) + (-Vpp)*exp(-(1:N/2)/(R*C1));
Vout(1:N) = Vout(1:N) + (Vpp)*exp(-(1:N)/(R*C1));
Vout(1:N) = Vout(1:N) - Vpp/2;
plot(t, Vout);
pause(.1)
end

