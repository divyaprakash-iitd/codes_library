clear; clc; close all;

% Description: Finds the roots of non-linear equations using the Newton
% Rhapson method

% x = sym('x',[1 2]);
% f1 = x(1) + x(1)*x(2) - 4;
% f2 = x(1) + x(2) - 3;

syms x y
f1 = x + x*y - 4;
f2 = x + y - 3;

F = [f1;f2];
maxiter = 1000;
tol = 1e-10;
X0 = [0; 0]; % Initial guess

X = newtonrhapson(F,X0,tol,maxiter);

% F = matlabFunction(F,'vars',{x});
% 
% J = jacobian([f1,f2],x);
% J = matlabFunction(J,'vars',{x});
% 
% 


% iter = 1;
% 
% while iter < maxiter
%     X = X - J(X')\F(X');
%     iter = iter + 1; 
% end

% while iter < maxiter
%     X = X - J(X(1),X(2))\F(X(1),X(2));
%     iter = iter + 1; 
% end

% Xp = num2cell(X);
% while iter < maxiter
%     X = X - J(Xp{:})\F(Xp{:});
%     Xp = num2cell(X);
%     iter = iter + 1; 
% end