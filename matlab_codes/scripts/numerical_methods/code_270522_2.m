clear; clc; close all;

% Description: Finds the roots using Bisection, Secant and Newton-Rhapson
% methods

f = @(x) x.^2 + exp(x) - 5;

fplot(f,[-3,2])

a = 1;
b = -2;
tol = 1e-8;
maxiter = 10000;
[c, iter] = bisection(f,a,b,tol,maxiter);


fprintf('Bisection Method: %.4f\n',c)

[c,iter] = secant(f,a,b,tol,maxiter);

fprintf('Secant Method: %.4f\n',c)

[x,CNT] = newtons(f,b,tol);
fprintf('Newton-Rhapson Method: %.4f\n',x)
hold on
plot(c,f(c),'rx')
set(gca,'xaxislocation','origin')
set(gca,'yaxislocation','origin')
grid on
xlabel('x')
ylabel('y')

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

function [x,CNT] = newtons(y,x,tol)
	CNT = 0;
    h = 0.001;
	while abs(y(x)) > tol
        df = (y(x+h) - y(x-h))/2/h;
		x = x - y(x)./df;
		CNT = CNT + 1;
	end
end
