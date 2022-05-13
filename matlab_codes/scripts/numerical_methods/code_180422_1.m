clear; clc; close all;

% Descripiton: Fits linear splines to the given dataset

t = [0 10 15 20 22.5 30];
v = [0 227.04 362.78 517.35 602.97 901.67];

% pp = interp1(t,v,'linear','pp');
pp = griddedInterpolant(t,v);
plot(t,v,'*')
hold on
plot(t,pp(t))