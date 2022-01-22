clear; clc; close all;

% Description: Plots a contour plot of the solution to an ODE

% Solution with M = 1 and U = 1
r = @(C,theta) C*csc(theta) - theta*csc(theta)/2/pi;

C = linspace(-100,100,200);
theta = linspace(0.001,2*pi,200);

[c,t] = meshgrid(C,theta);

contourf(t,c,r(c,t),100,'edgecolor','none')
colorbar