clear; clc; close all;

% Description: Solves an ODE using ode45

odefun = @(t,y) [   y(2);
                    1/3*(-2*sin(t) - 2*y(2) + y(1))];

y0 = [1,0];
tspan = [0,5];

[t,y] = ode45(odefun,tspan,y0);

plot(t,y(:,1))
xlabel('t')
ylabel('y')
grid on

tq = [0,0.0005,0.1882,1.0958,2.9708,3.9708,4.6031,5];
[t,y] = ode45(odefun,tq,y0);
hold on
plot(t,y(:,1),'o')

tab = [t,y(:,1)];
fprintf('\tt\ty\n')
disp(tab)
