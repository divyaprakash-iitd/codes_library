clear; clc; close all;

% Description: Finds the root of a function using the Newton's Method and
% the Bisection Method.

f = @(x) x.^3 - 5*x.^2 + 3*x - 1;
df = @(x) 3*x.^2 -10*x + 3;
x0 = 8;
tol = 0.001;
maxIter = 1000;
[r, iter] = newtons(f,df,x0,tol,maxIter);
fprintf("Newton's Method: Root = %.4f in %d iterations.\n",r,iter);

a = -1; b = 6;
[r, iter] = bisection(f,a,b,tol,maxIter);
fprintf("Bisection Method: Root = %.4f in %d iterations.\n",r,iter);