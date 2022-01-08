clear; clc; close all;

syms x y
f1 = 1/2*sin(x.*y) - y/4/pi - x/2;
f2 = (1-1/4/pi) * (exp(2*x)-exp(1)) + exp(1).*y/pi - 2*exp(1).*x;

F = [f1;f2];
X = [1; -20];
tol = 1e-10;
maxiter = 1000;

X = newtonrhapson(F,X,tol,maxiter);

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