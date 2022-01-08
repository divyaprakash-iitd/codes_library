clear; clc; close all; 

% Description: Solves a vectorization problem.

x = [1 0 0 1 9 5 6 2 2 7];
y = 2*x;
n = numel(x);

z = (-1).^(1:n).*(x.^3 + cos(y))./(1 + x.*y.*sqrt(1+log(x)));
t = table(x',y',z','variablenames',{'x','y','z'});
disp(t)