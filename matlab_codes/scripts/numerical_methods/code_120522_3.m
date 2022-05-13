clear; clc; close all;

% Description: Finds the root of a given equation

tau = 1.4;

f = @(A,t) A*tau*(1-exp(-t/tau));

fun = (@(A) integral(@(t) f(A,t),0,4) - 15);

[A,iter] = newtons_diff(fun,10,1e-10);

fprintf('The value of A is %.4f\n',A)

function [x,CNT] = newtons_diff(y,x,tol)
	CNT = 0;
    h = 0.0001;
	while abs(y(x)) > tol
        df = (y(x+h) - y(x-h))/2/h;
		x = x - y(x)./df;
		CNT = CNT + 1;
	end
end