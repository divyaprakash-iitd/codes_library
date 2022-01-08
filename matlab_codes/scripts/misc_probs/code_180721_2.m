clear; clc; close all;

% Description: Solve an ODE describing a pendulum problem.

g = 9.81; % [m/s^2]
L = 1; % [m]

odefun = @(t,theta) [theta(2); -g/L*theta(1)];

[t,theta] = ode45(odefun,[0 10],[pi/4 0]);

plot(t,theta(:,1))
hold on
plot(t,theta(:,2))