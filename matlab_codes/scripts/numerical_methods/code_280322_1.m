clear; clc; close all;

% Description: Evalutes an integral numerically using Trapezoidal, 
% Simpson's 1/3rd and 3/8th rule

fun = @(x) exp(cos(exp(x))) + 0.1*x.^2;
a = 0;
b = 3.6;

funcs = {@my_trapz,@simpson13,@simpson38};

for f = 1:numel(funcs)
    fprintf('%s\n',func2str(funcs{f}))
    for h = [1e-1, 1e-2, 1e-3]
        fprintf('%10.7f\n',feval(funcs{f},fun,a,b,h))
    end
end

% Numerical integration functions

function I = my_trapz(f,a,b,h)
  x = a:h:b;
  I = h/2*(f(x(1)) + 2*sum(f(x(2:end-1))) + f(x(end)));
end

function I = simpson13(f,a,b,h)
	x = a:h:b;
    n = (b-a)/h;
	I = h/3*(f(x(1)) + 2*sum(f(x(3:2:n-1))) + 4*sum(f(x(2:2:n))) + f(x(n+1)));
end

function I = simpson38(f,a,b,h)
	x = a:h:b;
    y = f(x);

    I = 3*h/8 * (   y(1)    + ...
                    y(end)  + ...
                    2*sum(y(4:3:end-2)) + ...
                    3*(sum(y(2:end-1))-sum(y(4:3:end-2))));
end