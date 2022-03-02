clear; clc; close all;

% Description: Plots a surface

x = -25:0.1:25;
y = -25:0.1:25;

[x,y] = meshgrid(x,y);

z = 3*x.^5 - 4*y.^5 -2;

mesh(x,y,z)
xlabel('X')
ylabel('Y')
zlabel('Z')
