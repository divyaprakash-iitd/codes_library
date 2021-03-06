clear; clc; close all;
% Description: Calculates the roots of equation(s) using Newton-Rhapson
% Method (Using the Symbolic Toolbox)
% Example: 1

a = 40;
b = 120;
c = 80;
d = 100;

theta2 = 0:0.5:360;
t3 = zeros(size(theta2));
t4 = zeros(size(theta2));

syms theta3 theta4  

for i = 1:numel(theta2)
    f1 = a*cosd(theta2(i)) + b*cosd(theta3) - c*cosd(theta4) - d;
    f2 = a*sind(theta2(i)) + b*sind(theta3) - c*sind(theta4);
    
    F       = [f1, f2];
    maxiter = 1000;
    tol     = 1e-10;
    X0      = [theta2(i), theta2(i)]; % Initial guess
    X = newtonrhapson(F,X0,tol,maxiter);
    t3(i) = X(1);
    t4(i) = X(2);
end

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
        X = X - pinv(J(X'))*F(X');
        iter = iter + 1; 
    end
end