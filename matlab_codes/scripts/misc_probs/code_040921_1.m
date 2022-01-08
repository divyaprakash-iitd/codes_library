clear; clc; close all;

% Decription: Solves a line problem

f = @(x) sqrt(x.^4 + 2*x.^3 + 3);
b = 1.5007;

x1 = 1.5;
y1 = f(x1);
y = @(x) slope(b)*x -slope(b)*x1+y1;

x = linspace(-2,2,100);

hold on
plot(x,f(x))
plot(x,y(x))

function m = slope(b)
    f = @(x) sqrt(x.^4 + 2*x.^3 + 3);
    m = (f(b)-f(1.5))/(b-1.5);
end