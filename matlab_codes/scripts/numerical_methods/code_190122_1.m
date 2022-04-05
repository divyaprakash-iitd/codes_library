clear; clc; close all;

% Description: Plots the solution of a mass spring system

k = 1;
m = 1;
xe = 1 ;

% Initial conditions
t0 = 0;
x0 = 0;
v0 = -1;

phi = atan(sqrt(m/k)*v0/(x0-xe));

x = @(t) xe + sqrt(k/m*(x0-xe).^2 + v0^2) * cos(sqrt(k/m)*(t-t0)+phi);

t = 0:0.01:10;
plot(t,x(t))