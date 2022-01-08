clear; clc; close all;

% Description: Solves odes using ode45
tspan = [0 10];
odefun = @(t,x) [x(2); -16*x(1)-x(2)];
x0 = [1 0];
[t,x] = ode45(odefun,tspan,x0);
figure(1)
subplot(1,2,1)
plot(t,x(:,1))

subplot(1,2,2)
plot(x(:,1),x(:,2))

odefun = @(t,x) [x(2); -16*x(1)-abs(x(2))*x(2)];
x0 = [1 0];
[t,x] = ode45(odefun,tspan,x0);

figure(2)
subplot(1,2,1)
plot(t,x(:,1))

subplot(1,2,2)
plot(x(:,1),x(:,2))

odefun = @(t,x) [x(2); -15*x(1)-x(1)^3];
x0 = [1 0];
[t,x] = ode45(odefun,tspan,x0);

figure(3)
subplot(1,2,1)
plot(t,x(:,1))

subplot(1,2,2)
plot(x(:,1),x(:,2))

