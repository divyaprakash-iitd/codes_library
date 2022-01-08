clear; clc; close all;

% Description: Solves an optimization problem with a non-linear constraint
% using the in-built function fmincon.

fun = @(x) 5*x(1).*x(2);
nonlcon = @constraint;
x0 = [1 1];
A = []; % No other constraints
b = [];
Aeq = [];
beq = [];
lb = [];
ub = [];
options = optimset('Display','off');
x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
fprintf('Minimum: (x,y) = (%.1f, %.1f)\nf(x,y) = %.1f\n',x(1),x(2),fun(x))
x = fmincon(@(x) -fun(x),x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
fprintf('Maximum: (x,y) = (%.1f, %.1f)\nf(x,y) = %.1f\n',x(1),x(2),fun(x))

function [c,ceq] = constraint(x)
    c   = 256*x(1).^2 + x(2).^2 - 512;
    ceq = [];
end