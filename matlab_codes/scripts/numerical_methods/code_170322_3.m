clear; clc; close all;

% Description: Solves a system of non-linear equations using
% Newton-Rhapson's Method

syms x1 x2
f1 = 5*x1^2 - x2;
f2 = 3*x1 + 3*x2^3;
F       = [f1, f2];
maxiter = 1;
tol     = 1e-10;
X0      = [1, 2]; % Initial guess
X = newtonrhapson(F,X0,tol,maxiter);
fprintf('%s=0\n',F)
fprintf('Root(s): \n')
disp(X')

function X = newtonrhapson(F,X,tol,maxiter)
    % Reshape the input as column vectors
    F = F(:);
    X = X(:);
    
    % Replace the symbolic variables (x,y,z,..) with x(i) (i = 1,2,3...)
    xs = symvar(F);
    x  = sym('x',[1 numel(xs)]);
    F  = subs(F,xs,x);
    
    % Compute the symboic Jacobian
    J = jacobian(F,x);
    
    % Anonymous functions
    F = matlabFunction(F,'vars',{x});
    J = matlabFunction(J,'vars',{x});
    
    % Iterations
    iter = 0;
    while iter < maxiter && sum(abs(F(X'))) > tol
        X = X - J(X')\F(X');
        iter = iter + 1; 
    end
end