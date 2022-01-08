clear; clc; close all;

% Given function
fun = @(x) x.*log(x);
xStart = 2; xEnd = 5; n = 3;
x = linspace(xStart,xEnd,n);
y = fun(x);
dx = 0.25;
xx = xStart:dx:xEnd;

% Spline
p = spline(x,y);

% Plot the results
plot(x,y,'o')
hold on
plot(xx,fnval(p,xx));


% Function values
fprintf('f(1.5): %.5f\n',fnval(p,1.5))
fprintf('f(3.5): %.5f\n',fnval(p,3.5))

I1 = integral(@(x)fnval(p,x),xStart,xEnd);
fprintf('Integral using spline: %.5f\n',I1)
I2 = integral(fun,xStart,xEnd);
fprintf('Exact Integral: %.5f\n',I2)
fprintf('Absolute Error: %.5f\n',abs(I1-I2))

