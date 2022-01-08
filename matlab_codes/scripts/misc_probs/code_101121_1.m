clear; clc; close all;

% Description: Solves a set of odes

gamma = @(x) x^2/3/sqrt(1+x);

odefun = @(r,y) [-y(2)*y(1)/gamma(y(1)^(1/3))/r^2; r^2*y(1)];

rspan = linspace(1e-10,10,10000);

[r,y] = ode45(odefun,rspan,[1e-1, 0]);
figure()

plot(r,y(:,1))
figure()
plot(r,y(:,2))