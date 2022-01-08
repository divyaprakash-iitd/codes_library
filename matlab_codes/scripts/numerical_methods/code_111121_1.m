clear; clc; close all;

% Description: Solves a problem using the bisection method

I0 = 0.0006;
t = 0.0191;
    
fun = @(k) (0.625 + 0.3*k)/(0.625 + 3.29*k) - cos(sqrt(k/I0)*t);

a = 2.97;
b = 3.27;

tol = 1e-10;
maxIter = 1000;

[c, iter] = Bisection_method(fun,a,b,tol,maxIter);

fprintf('The required spring constant is: %.4f\n',c)

function [c, iter] = Bisection_method(f,a,b,tol,maxIter)
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
