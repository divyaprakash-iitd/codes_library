clear; clc; close all;

% Description: Finds the root of an equation using Newton-Rhapson's method

fun = @(x) 2.7*x^4 + 14.6*x^3 + 5.6*x^2 + 14.6*x + 2.9;

tol = 1e-6;
x0 = 1;
[x,CNT] = newtons_diff(fun,x0,tol);

fplot(fun,[-1, 1],'HandleVisibility','off')
fprintf('The root of the function is: %.4f\n',x)
hold on
plot(x,fun(x),'ro','Markersize',5,'DisplayName','Root')
set(gca, 'XAxisLocation','origin')
set(gca, 'YAxisLocation','origin')
xlabel('x')clear; clc; close all;

% Description: Finds the root of an equation using Newton-Rhapson's method

fun = @(x) 2.7*x^4 + 14.6*x^3 + 5.6*x^2 + 14.6*x + 2.9;

tol = 1e-6;
x0 = 1;
[x,CNT] = newtons_diff(fun,x0,tol);

fplot(fun,[-1, 1],'HandleVisibility','off')
fprintf('The root of the function is: %.4f\n',x)
hold on
plot(x,fun(x),'ro','Markersize',5,'DisplayName','Root')
set(gca, 'XAxisLocation','origin')
set(gca, 'YAxisLocation','origin')
xlabel('x')
ylabel('f(x)')

function [x,CNT] = newtons_diff(y,x,tol)
	CNT = 0;
    h = 0.001;
	while abs(y(x)) > tol
        df = (y(x+h) - y(x-h))/2/h;
		x = x - y(x)./df;
		CNT = CNT + 1;
	end
end
ylabel('f(x)')

function [x,CNT] = newtons_diff(y,x,tol)
	CNT = 0;
    h = 0.001;
	while abs(y(x)) > tol
        df = (y(x+h) - y(x-h))/2/h;
		x = x - y(x)./df;
		CNT = CNT + 1;
	end
end