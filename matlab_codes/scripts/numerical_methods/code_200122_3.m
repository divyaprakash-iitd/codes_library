clear; clc; close all;

% Description: Finds the root using bisection method

Re = 1e5;
f = @(cf) sqrt(1/cf) + 0.4 - 1.74*log(Re*sqrt(cf));

a = 0.0005;
b = 0.005;

tol = 1e-6;
maxiter = 10000;
[cf, iter] = bisection(f,a,b,tol,maxiter);

fprintf('Value of Cf: %.4f\n',cf)

function [c, iter] = bisection(f,a,b,tol,maxIter)
	c = mean([a,b]);
    err = 1;
	iter = 0;
	while ((iter < maxIter) && (err > tol))
		[a,b] = rootInterval(f,a,b,c);
		cold = mean([a,b]);
        err = abs(c-cold)/abs(cold);
        c = cold;
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
