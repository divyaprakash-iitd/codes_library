clear; clc; close all;

% Description: Integrate using simpson's method

DOF = [9 10 30];
a = 0;
b = [1.1, 1.1812, 2.750];
N = 1000;

for i = 1:numel(DOF)
    dof = DOF(i);
    f = @(t) gamma((dof+1)/2)/sqrt(dof*pi)/gamma(dof/2)*(1+t.^2/dof).^(-(dof+1)/2);
    
    I = simpson13(f,a,b(i),N);
    fprintf('Integral (x: %.4f to %.4f, dof: %d): %.5f\n',a,b(i),dof,I)
end

% Simpson's rule
function I = simpson13(f,a,b,n)
	h = (b-a)/n;
	x = a:h:b;
	I = h/3*(f(x(1)) + 2*sum(f(x(3:2:n-1))) + 4*sum(f(x(2:2:n))) + f(x(n+1)));
end
