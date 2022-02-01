clear; clc; close all;

% Description: Generates a contour plot of a minimum function

% Generate N random numbers between a and b
a = 0; b = 2;
N = 20;
x = (b-a)*rand(1,N) + a;
y = (b-a)*rand(1,N) + a;

[x,y] = meshgrid(x,y);

% Plot contours at a level of z = 1
z = 1;

contour(x,y,min(x,y),'LevelList',z)