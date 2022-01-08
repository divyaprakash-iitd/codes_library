clear; clc; close all;

% Description: Calculates the value of a function in a loop.
f = 0.5;
niter = 20;
for i = 1:niter
    f = 1/7*(f.^3 + 2);
end
fprintf('After 20 loops, f(x) = %.4f\n',f)