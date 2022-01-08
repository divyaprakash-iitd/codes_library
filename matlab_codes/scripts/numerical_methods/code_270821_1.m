clear; clc; close all;

% Description: Calculates the roots of equation(s) using Newton-Rhapson
% Method (Using the Symbolic Toolbox)

% Example: 1

syms x y
f1 = x + x*y - 4;
f2 = x + y - 3;

F       = [f1, f2];
maxiter = 1000;
tol     = 1e-10;
X0      = [0, 0]; % Initial guess

X = newtonrhapson(F,X0,tol,maxiter);
fprintf('Example: 1\n')
fprintf('%s=0\n',F)
fprintf('Root(s): \n')
disp(X')

% Example: 2

fun = x^2 -4*x + 4;
X = newtonrhapson(fun,0,tol,maxiter);
fprintf('Example: 2\n')
fprintf('%s=0\n',fun)
fprintf('Root(s): \n')
disp(X)