clear; clc; close all;

% Description: Solves a spring mass damper system

x0 = 0.1;   % [m]
v0 = 1e-3;  % [m/s]
ic = [x0, v0];
m = 100; % [kg]
k = 10000;
c = 900;
f = @(t) 0;
tspan = 0:0.001:2;

[x, v] = smdnumerical(m,c,k,f,ic,tspan);

plot(tspan,x)

cc = 2*m*sqrt(k/m);
fprintf('zeta: %.4f\n',c/cc)

function [x, v] = smdnumerical(m,c,k,f,ic,tspan)
    odefun = @(t,x) [x(2); 1/m*(f(t) - c*x(2) - k*x(1))];
    [~,x] = ode45(odefun,tspan,ic);
    v = x(:,2);
    x = x(:,1);
end