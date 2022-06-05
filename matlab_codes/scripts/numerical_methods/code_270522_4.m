clear; clc; close all;

% Description: Solves the given system of ODEs using ode45

fun = @(t,y) [ y(2);
               -12*y(1) + 2*y(3);
               y(4);
               1/10*(2*y(1) - 12*y(3))];

x0 = [1,0,1,0];
tspan = [1,10];
[t,y] = ode45(fun,tspan,x0);

hold on
grid on
plot(t,y(:,1),'DisplayName','x_1')
plot(t,y(:,2),'DisplayName','dx_1/dt')
plot(t,y(:,3),'DisplayName','x_2')
plot(t,y(:,4),'DisplayName','dx_2/dt')
xlabel('t')
legend('Location','eastoutside')