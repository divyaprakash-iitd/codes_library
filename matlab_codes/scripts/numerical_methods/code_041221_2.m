clear; clc; close all;

% Description: Solves an integral using simpson's 1/3rd method

f = @(x) 200*(x./(5+x)).*exp(-2*x/30);

a = 0;
b = 30; 
n = 100;

I = simpson13(f,a,b,n);

fprintf('The integral is: %.2f\n',I);

% Simpson's rule
function I = simpson13(f,a,b,n)
	h = (b-a)/n;
	x = a:h:b;
	I = h/3*(f(x(1)) + 2*sum(f(x(3:2:n-1))) + 4*sum(f(x(2:2:n))) + f(x(n+1)));
end