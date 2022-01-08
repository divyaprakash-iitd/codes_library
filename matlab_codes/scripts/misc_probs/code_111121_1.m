clear; clc; close all;

% Description: Numerical differentiation

y = @(x) x.^3 + 2*x.^2 - x + 3;
dy = @(x) 3*x.^2 + 4*x - 1;


x = linspace(-5,5,100);

dy1 = dy(x);
dy2 = diff(y(x))/(x(2)-x(1));
dy2 = [dy2, NaN];
dy3 = gradient(y(x))/(x(2)-x(1));

hold on
plot(x,dy1,'--')
plot(x,dy2,'-*')
plot(x,dy3,'-o')

legend('Analytical','Forward difference','Gradient')


