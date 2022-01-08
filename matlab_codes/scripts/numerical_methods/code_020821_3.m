clear; clc; close all;

%% Description: Finds the root of an equation using the bisection method

f = @(x) x.^3 - 4;
a = 1; b = 3;
tol = 0.01;
maxIter = 100;

[c, iter] = bisection(f,a,b,tol,maxIter);


%% Helper Functions

function [c, iter] = bisection(f,a,b,tol,maxIter)
	c = mean([a,b]);
    err = 1;
	iter = 1;
	while ((iter < maxIter) && (err > tol))
		[a,b] = rootInterval(f,a,b,c);
		cold = mean([a,b]);
        err = abs(c-cold);
        c = cold;
        fprintf('Iter: %d, root = %.4f\n',iter,c)
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
