clear; clc; close all;

% Description: Linear approximation of a non-linear function

xbar = 0.5;
ybar = 0.75;
k = 1;

m = k;
b = ybar - k*xbar;

% Linear approximation
y = @(x) m*x + b;

fplot(y)