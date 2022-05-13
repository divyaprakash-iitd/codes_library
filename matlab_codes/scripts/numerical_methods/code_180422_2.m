clear; clc; close all;

% Description: Finds the first ten roots of a function

f = @(x) x - tan(x);
df = @(x) -(tan(x))^2;

hold on
fplot(f,[-20,20])
set(gca,'xaxislocation','origin')

x = -10;

tol = 1e-18;
maxIter = 1000;
% [x,iter] = newtons(f,df,x,tol,maxIter);
a = -1;b=1;
[x, iter] = bisection(f,a,b,tol,maxIter);
plot(x,f(x),'rx')

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

