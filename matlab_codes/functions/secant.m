function [c,iter] = secant(f,a,b,tol,maxiter)
% secant: Calculates the root of a function
% [c,iter] = secant(f,a,b,tol,maxiter):
%   Calculates the root of a function using the secant methodCalculates the root of a function using the secant method
% Example:
%   f = @(x) 3*x + sin(x) - exp(x);
%   a = 0; b = 1; tol = 1e-6; maxiter = 1e4; 
%   [c,iter] = secant(f,a,b,tol,maxiter)
% input: 
%   f        = A function handle
%   a        = Lower limit of interval in which root lies
%   b        = Upper limit of interval in which root lies
%   maxiter  = Maximum number of iterations
% output:
%   c       = Root of the function
%   iter    = No. of iterations to obtain the root
% Author: Divyaprakash
%         Mechanical Engineer
% e-mail: divyaprakash.poddar@gmail.com
% Date  : 22 January 2022

	iter = 0;
	c = (a*f(b) - b*f(a))/(f(b)-f(a));
	while ((iter < maxiter) && (abs(f(c)) > tol))
		a = b;
		b = c;
		c = (a*f(b) - b*f(a))/(f(b)-f(a));
		iter = iter + 1;
	end
end
