function X = newtonrhapson(F,X,tol,maxiter)
% newtonrhapson: Calculates the roots of equation(s) using Newton-Rhapson
% Method
% X = newtonrhapson(F,X,tol,maxiter):
%   Calculates the roots of equation(s) using Newton-Rhapson
%   Method (Using the Symbolic Toolbox)
%   Reference: https://link.springer.com/content/pdf/bbm%3A978-3-319-69407-8%2F1.pdf
%
% input: 
%   F       = A Vector of symbolic functions
%   X       = A Vector of initial guesses of the unknowns
%   tol     = Tolerance value
%   maxiter = Maximum number of iterations
% output:
%   X = A vector of the root(s) of the given equation(s)
%
% Author: Divyaprakash
%         Mechanical Engineer
% e-mail: divyaprakash.poddar@gmail.com
% Date  : 27 August 2021
 
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