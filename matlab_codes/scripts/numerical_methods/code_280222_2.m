clear; clc; close all;

% Description: Finds the root using Newton's method

f = @(x1,x2) x1.^4 + x1.*x2 + (1+x2).^2;

function [x,iter] = newtons(f,df,x,tol,maxIter)
    err = 1;
	iter = 0;
	while ((iter < maxIter) && (err > tol))
		xold = x - f(x)./df(x);
        err = abs(x-xold)/xold;
        x = xold;
		iter = iter + 1;
	end
end

