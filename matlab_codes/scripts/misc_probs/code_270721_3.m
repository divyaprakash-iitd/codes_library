clear; clc; close all;

% Description: Solves an integration problem.

% Q(a)
a = 2; b = 6; n = 601;
xplt = linspace(a,b,n);

% Q(b)
myf = @(x) abs(sin(x)).*exp(-2*x/5);

% Q(c)
plot(xplt,myf(xplt))
xlabel('x')
legend(func2str(myf))
grid on

fprintf('The point is: %.3f\n',xplt(myf(xplt) == min(myf(xplt))))

% Q(d)
I = quad(myf,a,b);
fprintf('I(f) = %.3f\n',I)