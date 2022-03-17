clear; clc; close all;

% Description: Coordinate transformation

P = [20; 5];
theta3 = -60:60;

R = @(t) [cos(t) -sin(t);sin(t) cos(t)];

for i = 1:numel(theta3)
    PRot = R(theta3(i))*P
end