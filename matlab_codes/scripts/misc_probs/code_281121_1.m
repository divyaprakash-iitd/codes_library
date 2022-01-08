clear; clc; close all;

% Description: Computes the position and velocity of a satellite

r = [7000 -12124];
v = [2.6679 4.6210];

tsim = 60*60; % [s]

dt = 0.1;

t = 0:dt:tsim;
nt = numel(t);

hold on
for i = 1:nt
    rx = r(1) + v(1)*dt;
    ry = r(2) + v(2)*dt;
    
    r = [rx, ry];
    plot(rx,ry,'rx')
end




