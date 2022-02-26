clear; clc; close all;

% Description: Finds roots of a function of Bessel functions

Bi = 0.5;

f = @(x) x.*besselj(1,x)./besselj(0,x) - Bi;

fplot(f,[0,6])
xlabel('\zeta')
ylabel('f(\zeta)')
set(gca,'xaxislocation','origin')
set(gca,'yaxislocation','origin')

a = 0.5; b = 2.0;

fprintf('fzero method\n')
fprintf('The root in the interval [%.1f, %.1f] is: %.8f\n',a,b,fzero(f,0.5))

tol = 1e-5;
maxIter = 1e5;
[c, iter] = bisection(f,a,b,tol,maxIter);

fprintf('Bisection method\n')
fprintf('The root in the interval [%.1f, %.1f] is: %.8f\n',a,b,c)

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
