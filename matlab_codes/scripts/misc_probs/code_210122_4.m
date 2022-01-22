clear; clc; close all;

% Description: Fits data to a given equation

t = [1 2 5 7 18 28 50];
fck = [1 2 5 16 24 25 34];

eqn = 'a1+a2*log(x)';

% Fit the curve
f = fit(t',fck',eqn)

plot(f,t,fck)
xlabel('Curing time [day]')
ylabel('Compressive strength [MPa]')
legend('Location','SouthEast')
grid on

d = 38;
fprintf('\nCompressive strength at t = %d days: %.4f MPa\n',d,f(d))



