clear; clc; close all;

% Description: Finds the roots of a quadratic equation

% x^2 -5000x + 10 = 0 (ax^2 + bx + c = 0)
a = 1;
b = -5000;
c = 10;

format long
x1a = (-b + sqrt(b^2-4*a*c))/2/a
x2a = (-b - sqrt(b^2-4*a*c))/2/a

xb = roots([a b c]);
x1b = xb(1)
x2b = xb(2)

% True relative error
fprintf('True relative error\n')
x1e = abs((x1a-x1b)/x1b)
x2e = abs((x2a-x2b)/x2b)

x1c = -2*c/(b+sqrt(b^2-4*a*c))
x2c = -2*c/(b-sqrt(b^2-4*a*c))
% True relative error
fprintf('True relative error\n')
x1e = abs((x1c-x1b)/x1b)
x2e = abs((x2c-x2b)/x2b)

