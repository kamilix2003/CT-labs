function [] = quick_plot(f, period)
syms f
steps = 100;
step = period/steps;
t = 0:step:period;
x = f(t);
plot(t, x)
end

