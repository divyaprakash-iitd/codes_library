clear; clc; close all;

% Description: Evaluates the given function at a point using Taylor series

x0 = input('Initial value of x: ');
h = input('Increment value: ');
n = input('Number of terms: ');

fun = 'log(x)';

[tFun, y]= taylor_series2(fun,n,x0,h);

fprintf('\nThe series is:\n')
disp(tFun)
fprintf('x0: %.4f\n',x0)
fprintf('y(x_i+1): %.4f\n',y)
fprintf('True value of y(x_i+1): %.4f\n',log(x0+h))
