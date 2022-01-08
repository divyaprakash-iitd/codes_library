clear; clc; close all;

% Description: Finds root using Bisection method

fun = @(x) x^2 - x - 1;

[c,iter]=bisection(fun,1,2,1e-6,100);
fprintf('The Golden ratio calculated after %d iterations is: %f\n',iter,c)

function [c, iter] = bisection(f,a,b,tol,maxiter)
    if nargin == 3
        maxiter = 100;
    end
	iter = 0;
	c = mean([a,b]);
	while abs(f(c)) > tol && iter < maxiter
		[a, b ] = rootInterval(f,a,b,c);
		c = mean([a,b]);
		iter = iter + 1;
	end
end

function [a,b] = rootInterval(f,a,b,c)
	if f(a)*f(c) < 0
		b = c;
	else
		a = c;
	end
end