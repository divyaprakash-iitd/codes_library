clear; clc; close all;

% Description: Finds roots of a system of non-linear equations using
% fixed-point iteration method and Newton-Rhapson method.

syms x y
f1 = 1/2*sin(x*y) - y/4/pi - x/2;
f2 = (1-1/4/pi)*(exp(2*x)-exp(1)) + exp(1)*y/pi - 2*exp(1)*x;

X = newtonrhapson([f1 f2],[1.1 1.6],1e-6,1000);