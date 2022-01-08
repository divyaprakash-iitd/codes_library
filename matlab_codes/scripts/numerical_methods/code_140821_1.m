clear; clc; close all;

% Description: Solves for the roots using bisection method.

x = linspace(-15,15,10000);
f = @(x) sin(x) + 0.15*x;

figure(1)
plot(x,f(x))
set(gca,'xaxislocation','origin')

g = @(x) 1.3*cos(2*x) + exp(0.025*abs(x));

figure(2)
plot(x,g(x))
set(gca,'xaxislocation','origin')

a = -1; b = -4.5; tol = 1e-10; maxIter = 10000;
intervals = [-5, -6;
             -1. -4.5;
              1 -1;
              1 5];
for i = 1:size(intervals,1)
    a = intervals(i,1);
    b = intervals(i,2);
    [c, iter] = bisection(f,a,b,tol,maxIter);
    fprintf('The root in the interval [%.4f %.4f] is %.4f\n',a,b,c)
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

