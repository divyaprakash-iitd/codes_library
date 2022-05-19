clear; clc; close all;

% Description: Finds the root of an equation using bisection, secant and
% Newton's method

f = @(x) x - 3*exp(-2*x);

fplot(f,[0 1])
set(gca,'xaxislocation','origin')
set(gca,'yaxislocation','origin')

a = 0.6;
b = 0.8;
tol = 1e-8;
maxiter = 3;
x0 = a;
[xs,iters] = secant(f,a,b,tol,maxiter);
[xb, iterb] = bisection(f,a,b,tol,maxiter);
[xn,itern] = newtons(f,x0,tol);

fprintf('Bisection Method (Iteration: %d): %.8f\n',iterb,xb)
fprintf('Secant Method (Iteration: %d): %.8f\n',iters,xs)
fprintf('Newton Method (Iteration: %d): %.8f\n',itern,xn)

function [c,iter] = secant(f,a,b,tol,maxiter)
	iter = 0;
	c = (a*f(b) - b*f(a))/(f(b)-f(a));
	while ((iter < maxiter) && (abs(f(c)) > tol))
		a = b;
		b = c;
		c = (a*f(b) - b*f(a))/(f(b)-f(a));
		iter = iter + 1;
	end
end

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

function [x,CNT] = newtons(y,x,tol)
	CNT = 0;
    h = 0.001;
	while abs(y(x)) > tol
        df = (y(x+h) - y(x-h))/2/h;
		x = x - y(x)./df;
		CNT = CNT + 1;
	end
end
