clear; clc; close all;

% Description: Solves an IVP using ode45

fun = @(t,x) [ x(2);
               sin(t) - x(2)];

x0 = [0 0];
tspan = [0 10];

[t,x] = ode45(fun,tspan,x0);
clear; clc; close all;

% Description: Solves an IVP using ode45

fun = @(t,x) [ x(2);
               sin(t) - x(2)];

x0 = [0 0];
tspan = [0 10];

[t,x] = ode45(fun,tspan,x0);

plot(t,x(:,1))


plot(t,x(:,1))

