clear; clc; close all;

% Description: Solves a problem using Newton's method

fun = @(x) exp(x) + 2^(-x) + 2*cos(x) - 6;

tol = 1e-10;
x0 = 1;
[x,CNT] = newtons_diff(fun,x0,tol);

fprintf('The root of the function is: %.4f\n',x)

function [x,CNT] = newtons_diff(y,x,tol)
	CNT = 0;
    h = 0.001;
	while abs(y(x)) > tol
        df = (y(x+h) - y(x-h))/2/h;
		x = x - y(x)./df;
		CNT = CNT + 1;
	end
end



