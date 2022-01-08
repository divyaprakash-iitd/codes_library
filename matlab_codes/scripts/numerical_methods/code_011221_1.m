clear; clc; close all;

f = @(x) sin(x);

a = 0;
b = 1; 
n = 100;

I = simpson13(f,a,b,n);

fprintf('The integral is: %.4f\n',I);

% Simpson's rule
function I = simpson13(f,a,b,n)
	h = (b-a)/n;
	x = a:h:b;
	I = h/3*(f(x(1)) + 2*sum(f(x(3:2:n-1))) + 4*sum(f(x(2:2:n))) + f(x(n+1)));
end
