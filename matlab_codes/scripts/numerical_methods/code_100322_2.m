clear; clc; close all;

% Description: Computes numerical integration using trapezoidal and
% Simpson's rule

x = [0.6 1.3 2.1 3.4 4.3]; %[m]
F = [539.213 674.233 909.145 1065.234 2364.321]; % [N]

g = 9.81; % [m/s^2]
h = 32;    % [m]

I = trapz(x,F);
Mmax = I/g/h

fun = @(xq) interp1(x,F,xq);

N = 1000;
I = my_trapz(fun,x(1),x(end),N);
Mmax = I/g/h

I = simpson13(fun,x(1),x(end),N);
Mmax = I/g/h

function I = my_trapz(f,a,b,N)
  dx = (b-a)/N;
  x = a:dx:b;
  I = dx/2*(f(x(1)) + 2*sum(f(x(2:end-1))) + f(x(end)));
end

function I = simpson13(f,a,b,n)
	h = (b-a)/n;
	x = a:h:b;
	I = h/3*(f(x(1)) + 2*sum(f(x(3:2:n-1))) + 4*sum(f(x(2:2:n))) + f(x(n+1)));
end