clear; clc; close all;

% Description: Solves an IVP using Runge-Kutta Method

fun = @(x,y) -2*x.^3 + x - y;

x0 = 0; xN = 3;
dx = 0.01;
y0 = 1;

[x,y] = RK4(fun,x0,xN,dx,y0);

plot(x,y)
xlabel('x')
ylabel('y')
