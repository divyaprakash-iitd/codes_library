clear; clc; close all;

% Description: Solves for roots using bisection method.

f = @(x) x.^4 -1 - 3*exp(-x);

a = -5; b = 0;
tol = 0.00000005;
maxIter = 1000;

[c1, ~] = bisection(f,a,b,tol,maxIter);

fplot(f,[-3 2])
hold on
plot(c1,f(c1),'rx','DisplayName','Root:1')
set(gca,'xaxislocation','origin')
set(gca,'yaxislocation','origin')
legend show
xlabel('x')
ylabel('f(x)')

a = 0; b = 2;
[c2, ~] = bisection(f,a,b,tol,maxIter);
plot(c2,f(c2),'rx','DisplayName','Root:2')

fprintf('The roots are: %.4f and %.4f\n',c1,c2)

function [c, iter] = bisection(f,a,b,tol,maxIter)
	c = mean([a,b]);
    err = 1;
	iter = 0;
	while ((iter < maxIter) && (err > tol))
		[a,b] = rootInterval(f,a,b,c);
		cold = mean([a,b]);
        err = abs(c-cold);
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
