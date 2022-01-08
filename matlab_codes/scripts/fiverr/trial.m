clear; clc; close all;

% Description: Finds the root numerically

% Parameters
nn = 0.95;
gamma = 1.4;

% Function
syms M
f   =  M^4*(nn-1) + M^2/(gamma-1) * ...
         (3*nn - ((3*gamma-1)/(gamma-1))) + 2*nn/(gamma-1)^2;
 
df  = matlabFunction(diff(f));
f   = matlabFunction(f);


% Numerical parameters
tol     = 1e-6; % Tolerance
maxIter = 1e5;  % Maximum iterations

% The Newton-Rhapson method
%x0 = 1;
%[c,CNT] = newtons(f,df,x0,tol);
%fprintf('The Newton-Rhapson method: %.7f\n',c);

% % The Bisection method
a = 0;
b = 1;
[c, iter] = bisection(f,a,b,tol,maxIter);
% fprintf('Bisection Method: %.7f\n',c);
% 
% % The Newton-Rhapson method (Numerical differentiation)
%[c,CNT] = newtons_diff(f,x0,tol);
% fprintf('The Newton-Rhapson method (Numerical differentiation): %.7f\n',c);
% 
% % The Secant method
% [c,iter] = secant(f,a,b,tol);
% fprintf('The Secant method: %.7f\n',c);


%% Functions
function [c, iter] = bisection(f,a,b,tol,maxIter)
	c = mean([a,b])
    err = 1;
	iter = 0;
    for i = 1:2
% 	while ((iter < maxIter) && (err > tol))
		[a,b] = rootInterval(f,a,b,c)
		cold = mean([a,b])
        err = abs(c-cold)/abs(cold);
        c = cold;
		iter = iter + 1;
	end
end

function [x,CNT] = newtons(y,df,x,tol)
	CNT = 0;
	for i = 1:2
    %while abs(y(x)) > tol
        y(x)
        df(x)
		x = x - y(x)./df(x)
		CNT = CNT + 1;
	end
end

function [x,CNT] = newtons_diff(y,x,tol)
	CNT = 0;
    h = 0.001;
	for i = 1:2
    %while abs(y(x)) > tol
        y(x)
        df = (y(x+h) - y(x-h))/2/h
		x = x - y(x)./df
		CNT = CNT + 1;
	end
end

function [c,iter] = secant(f,a,b,tol)
	iter = 0;
	c = (a*f(b) - b*f(a))/(f(b)-f(a))
	for i = 1:2
    %while abs(f(c)) > tol
		a = b
		b = c
		c = (a*f(b) - b*f(a))/(f(b)-f(a))
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

