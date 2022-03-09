clear; clc; close all;

% Description: Plots velocity field

u = @(x,y) x.^2.*y; 
v = @(x,y) -x.*y.^2;

N = 20;
x = linspace(-5,5,N);
y = linspace(-5,5,N);

[x,y] = meshgrid(x,y);

U = u(x,y);
V = v(x,y);
quiver(x,y,U,V)
