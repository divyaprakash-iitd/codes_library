clear; clc; close all;

% Description: Plots a function

y = @(x) 6*cos(2*x);

x = -2*pi:0.1:2*pi;

plot(x,y(x))
xlabel('X')
ylabel('y = 6cos(2x)')
title('Problem 4')