clear; clc; close all;

% Description: Integrates using the trapezoidal method.

f = @(x) sin(x);

M = 5;
a = 0; b = pi;
dx = (b-a)/M;
x = a:dx:b;
I = trapz(x,f(x));
Iexact = integral(f,a,b);
fprintf('The value for M=%d is: %.4f using Trapezoidal Method\n',M,I)

err = 1;
tol = 0.001;
M = 0;
while err > tol
    M = M + 1;
    dx = (b-a)/M;
    x = a:dx:b;
    I = trapz(x,f(x));
    err = abs(Iexact-I);
end
fprintf('The value for M=%d is: %.4f for which the error is %.5f(<%.4f) using Trapezoidal Method\n',M,I,err,tol)