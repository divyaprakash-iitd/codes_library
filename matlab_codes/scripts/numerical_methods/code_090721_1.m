clear; clc; close all;

% Description: Find the root using bisection method.

fun = @(x) x.^4 -2*x.^3 + 8*x;

fplot(fun)
xlim([-2 0])
set(gca,'xaxislocation','origin')

[c, iter] = bisection(fun,-2,0,0.01);
fprintf('The closest root is: %.4f\n',c)
fprintf('F(x) for the root is: %.4f\n',fun(c))

function [c, iter] = bisection(f,a,b,tol)
	iter = 0;
	c = mean([a,b]);
	while abs(f(c)) > tol
		[a,b] = rootInterval(f,a,b,c);
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
