clear; clc; close all;

% Description: Plots a symbolic function

syms A(x,y)
A = sin(x*y) + cos(x*y);

figure(1)
ezsurf(A,[-5,5])

figure(2)
ezcontour(A,[-5,5])