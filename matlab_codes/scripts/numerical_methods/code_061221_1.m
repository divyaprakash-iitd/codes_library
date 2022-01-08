clear; clc; close all;

% Description: Solves a integral using Simpson's 1/3rd rule

f = @(t) sin(t)./t;

a = 1e-8; 
nseg = 1000;
N = 1000;
x = linspace(-8*pi,8*pi,N);

I = zeros(1,N);
for i = 1:N
    b = x(i);
    I(i) = simpson13(f,a,b,nseg);
end

plot(x,I)
xlabel('x')
ylabel('Si(x)')
grid on

% Simpson's rule
function I = simpson13(f,a,b,n)
	h = (b-a)/n;
	x = a:h:b;
	I = h/3*(f(x(1)) + 2*sum(f(x(3:2:n-1))) + 4*sum(f(x(2:2:n))) + f(x(n+1)));
end
