clear; clc; close all;

% Description: A ball rolling down a table and landing on the floor.

g = 9.8; %[m/s^2]
H = 1.2; %[m]

t = sqrt(1.2*2/g);

fprintf('The ball was in the air for a total of %.3f seconds.\n',t)

D = 1.52; % [m]
s = D/t;

fprintf('The speed of the ball at the instant it leaves the table is %.2f m/s.\n',s)
