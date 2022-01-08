clear; clc; close all;

% Description: Generates the required matrix

z = [eye(2,3),zeros(2,1);sqrt(16) 8 5 1;6 10 3 exp(0)]

z([2,3],[3,4])

z([3,4],[1,2])

v = z(:,1) - z(:,3)

z.^2

R = z(1,:) + z(4,:)