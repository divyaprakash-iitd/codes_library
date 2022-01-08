clear; clc; close all;

% Description: Solves the spring-mass-damper system using ode45.

m = 4; % [kg]
k = 12; % [N/m]
c = 8*sqrt(3); % [N-s/m]

odefun = @(t,x) [x(2); 1/m*(-c*x(2) - k*x(1))];

x0 = 10e-2; % [m]
v0 = 3; % [m/s]

[t,x] = ode45(odefun,[0 10],[x0 v0]);
plot(t,x(:,1),'DisplayName','Displacement [m]')
hold on
plot(t,x(:,2),'DisplayName','Velocity [m/s]')
xlabel('Time [s]')
legend show

fprintf('Maximum displacement from equilibrium: %.4f [m]\n', max(abs(x(:,1))))