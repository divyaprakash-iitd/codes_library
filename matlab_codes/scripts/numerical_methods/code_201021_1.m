clear; clc; close all;

% Description: Finds root using bisection method.

f = @(x) x - exp(-x);

fplot(f,[-2 2])
set(gca,'xaxislocation','origin')

a = -2; b = 2;
tol = 0.1;
maxIter = 1000;

[c, iter] = bisection(f,a,b,tol,maxIter);
fprintf('The root in the interval [%d, %d] is %.4f\n',a,b,c)

hold on
plot(c,f(c),'x')

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
