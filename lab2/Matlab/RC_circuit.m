function [Vout_integrator, Vout_differentiator] = RC_circuit(Vin, t)
figure('Name', 'RC circuit');
R = 1.5e3;
C1 = 47e-9;
C2 = 10e-9;
N = size(Vin);
dt = 1/(N(1,2)-1);
Vout_integrator = Vin .* (1 - exp(-t/(R*C1)));
Vout_differentiator = Vin .* exp(-t/(R*C2));
plot(t, Vin, t, Vout_integrator, t, Vout_differentiator);
end

