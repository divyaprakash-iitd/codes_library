clear; clc; close all;

% Description: Finds root of the given equation using bisection method.

f = @(x) x.^7 - x.^3 - x - 3;

fplot(f)
a = -5; b = 5;
tol = 0.0001; maxIter = 1000;

[c, iter] = bisection(f,a,b,tol,maxIter);
fprintf('The root in the interval [%d, %d] is %.4f\n',a,b,c)

hold on
plot(c,f(c),'o')
set(gca,'xaxislocation','origin')
set(gca,'yaxislocation','origin')


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
