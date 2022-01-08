clear; clc; close all;

% Description: Calculates the roots of equation(s) using Newton-Rhapson
% Method (Using the Symbolic Toolbox)

syms v1 v2 v3
f1 = v1 - 0.3676*v2;
f2 = 8.1346*v1^2 + 6.3354*v2^2 - 11;
f3 = 0.025*v1 + 0.014*v2 - 0.01*v3;

F       = [f1, f2, f3];
maxiter = 1000;
tol     = 1e-10;
X0      = [5, 5, 5]; % Initial guess

X = newtonrhapson(F,X0,tol,maxiter);
fprintf('Example: 1\n')
fprintf('%s=0\n',F)
fprintf('Root(s): \n')
disp(X')

