clear; clc; close all;

% Description: Solves a system of ODEs

% Let s = x(1), e = x(2), c = x(3) and p = x(4)

% Program # 1
p = calculate_p(1.5)

% Program # 2
fun = @(x) calculate_p(x) - 1.75;

a   = 0;
b   = 2;
tol = 1e-10;
maxiter = 1e5;
[k3,~]  = secant(fun,a,b,tol,maxiter)


% Function to calculate value of p
function p = calculate_p(k3)
   
    k1 = 11;
    k2 = 1.6;

    x0 = [2.2, 2.8, 0, 0];
    odefun = @(t,x) [-k1*x(1)*x(2) + k2*x(3);
                     -k1*x(1)*x(2) + k2*x(3) + k3*x(3);
                     k1*x(1)*x(2) - k2*x(3) - k3*x(3);
                     k3*x(3)];
    [~,x] = ode45(odefun,[0,1.5],x0);

    p = x(end,4);
end

% Function implementing the secant method
function [c,iter] = secant(f,a,b,tol,maxiter)
	iter = 0;
	c = (a*f(b) - b*f(a))/(f(b)-f(a));
	while ((iter < maxiter) && (abs(f(c)) > tol))
		a = b;
		b = c;
		c = (a*f(b) - b*f(a))/(f(b)-f(a));
		iter = iter + 1;
	end
end
