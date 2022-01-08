clear; clc; close all;

% Description: Plots a vector valued function

rx = @(t) t;
ry = @(t) -t.^2;
rz = @(t) -t.^3;

t = -1:0.001:1;

plot3(rx(t),ry(t),rz(t))
xlabel('r_x')
ylabel('r_y')
zlabel('r_z')
