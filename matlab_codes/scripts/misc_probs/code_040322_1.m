clear; clc; close all;

% Description: Plots the graphs of a function

f = @(x,y) x.*exp(-(x-y.^2).^2 + y.^2);

v = -0.2:0.1:0.3;

X = linspace(-3,3,100);
Y = linspace(-3,3,100);
[x, y] = meshgrid(X,Y);

figure(1)
contour(x,y,f(x,y),v)

figure(2)
contour(x,y,f(x,y),[0.2, 0.2])

figure(3)
plot(Y,f(1,y))

func = @(y) f(1,y) - 0.2;

fzero(func,0)


