clear; clc; close all;

% Description: Solves the spring-mass-damper system using ode45 and Euler's
% Method.

% Data
m   = 4;          % [kg]
k   = 12;         % [N/m]
c   = 8*sqrt(3);  % [N-s/m]
t0  = 0;
tN  = 10;
dt  = 0.01;

% ODE
odefun = @(t,x) [x(2); 1/m*(-c*x(2) - k*x(1))];

% Initial Conditions
x0 = 10e-2;     % [m]
v0 = 3;         % [m/s]

% ode45 Solution
[t,x] = ode45(odefun,[t0 tN],[x0 v0]);

figure(1)
plot(t,x(:,1),'DisplayName','ode45')
hold on
figure(2)
plot(t,x(:,2),'DisplayName','ode45')
hold on

% Euler's Method Solution
[t,x] = euler_ivp(odefun,[t0 tN],[x0 v0],dt);
figure(1)
plot(t,x(:,1),'--','DisplayName',"Euler's Method")
xlabel('Time [s]')
ylabel('Displacement [m]')
legend show
figure(2)
plot(t,x(:,2),'--','DisplayName',"Euler's Method")
xlabel('Time [s]')
ylabel('Velocity [m/s]')
legend show