clear; clc; close all;

% Description: Coordinate system rotation
p = [-3 7 9]';

Rx = @(t) [1 0 0; 0 cos(t) -sin(t); 0 sin(t) cos(t)];
Ry = @(t) [cos(t) 0 sin(t); 0 1 0; -sin(t) 0 cos(t)];
Rz = @(t) [cos(t) -sin(t) 0; sin(t) cos(t) 0; 0 0 1];

% Rotate about the y-axis by 35 degrees counterclockwise.
theta = 35;
p = Ry(theta)*p;    

% Rotate about the z-axis by 30 degrees counterclockwise.
phi = 30;
p = Rz(phi)*p;

% Rotate about the x-axis by 25 degrees counterclockwise.
psi = 30;
p = Rx(psi)*p

