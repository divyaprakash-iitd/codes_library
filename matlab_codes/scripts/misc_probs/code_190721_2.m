clear; clc; close all;

% Description: Solves a system of non-linear equations using Newton-Rhapson
% Method and fsolve.

%% Newton-Rhapson Method
syms x y

f1 = x.^2+0.5*y-5;
f2 = 3*exp(-x)+y-2;
J = matlabFunction(jacobian([f1,f2],[x,y]));
f1 = matlabFunction(f1);
f2 = matlabFunction(f2);
x = [0;1];
iter = 0;
maxiter = 1000;
tol = 1e-14;
err = 1;
while iter < maxiter && err > tol
    xtemp = x(:) - J(x(1))\[f1(x(1),x(2));f2(x(1),x(2))];
    err = norm(x-xtemp)./norm(xtemp);
    x = xtemp;
    iter = iter + 1;
end

fprintf("Newton-Rhapson's Method\n")
disp(x)

%% fsolve
clear;
F = @(x) [x(1).^2+0.5*x(2)-5; 
          3*exp(-x(1))+x(2)-2];
      
x0 = [0,1];
options = optimset('Display','off');
x = fsolve(F,x0,options);

fprintf("fsolve\n")
disp(x(:))

