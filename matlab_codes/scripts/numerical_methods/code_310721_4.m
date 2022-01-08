clear; clc; close all;

% Description: Integrates numerically using the trapezoidal method.

f = @(x) 3*exp(2.*x);

a = 0;
N = input('Enter the value of N: ');
b = N;
c = 10*N;

h = (b-a)/c;
x = a:h:b;

F = f(x);

I = h/2* (F(1) + 2*sum(F(2:end-1)) + F(end));

fprintf('Approximate area: %e\n',I)
