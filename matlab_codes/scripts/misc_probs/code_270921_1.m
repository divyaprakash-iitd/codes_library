clear; clc; close all;

% Description: Finds roots using Newton's, bisection and secant method.

syms x
f = x.^3 + 10*cos(2*x) + log(x + 11);

df = matlabFunction(diff(f));
f = matlabFunction(f);

fplot(f)
set(gca,'xaxislocation','origin')
x = 2;
tol = 1e-10;
maxIter = 10000;

fprintf("Newton's Method\n")
[x,iter] = newtons(f,df,x,tol,maxIter);
fprintf('Root: %.10f, Iterations: %d\n',x,iter)
hold on
plot(x,f(x),'o')

x = -1; 
[x,iter] = newtons(f,df,x,tol,maxIter);
fprintf('Root: %.10f, Iterations: %d\n',x,iter)
hold on
plot(x,f(x),'o')

x = 1;
[x,iter] = newtons(f,df,x,tol,maxIter);
fprintf('Root: %.10f, Iterations: %d\n',x,iter)
hold on
plot(x,f(x),'o')

fprintf('Bisection Method\n')
a = 1; b = 2;
[x, iter] = bisection(f,a,b,tol,maxIter);
fprintf('Root: %.10f, Iterations: %d\n',x,iter)

a = 0; b = -1;
[x, iter] = bisection(f,a,b,tol,maxIter);
fprintf('Root: %.10f, Iterations: %d\n',x,iter)

a = 0; b = 1;
[x, iter] = bisection(f,a,b,tol,maxIter);
fprintf('Root: %.10f, Iterations: %d\n',x,iter)

fprintf('Secant Method\n')
a = 1.5; b = 2;
[x,iter] = secant(f,a,b,tol);
fprintf('Root: %.10f, Iterations: %d\n',x,iter)

a = 0; b = -1;
[x,iter] = secant(f,a,b,tol);
fprintf('Root: %.10f, Iterations: %d\n',x,iter)

a = 0; b = 1;
[x,iter] = secant(f,a,b,tol);
fprintf('Root: %.10f, Iterations: %d\n',x,iter)


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

function [c,iter] = secant(f,a,b,tol)
	iter = 0;
	c = (a*f(b) - b*f(a))/(f(b)-f(a));
	while abs(f(c)) > tol
		a = b;
		b = c;
		c = (a*f(b) - b*f(a))/(f(b)-f(a));
		iter = iter + 1;
	end
end
