clear; clc; close all;

% Description: Solves a set of Differential equation

A = [10 0;0 2];
B = [50 20;20 20];

X0 = [0.8 0.5]';
dX0 = [0 0]';

syms x1(t) x2(t)

X = [x1; x2];
DX = diff(X);
odes = A*diff(DX) + B*X == 0;


cond = [X(0)==X0, DX(0)==dX0];

[x1Sol(t), x2Sol(t)] = dsolve(odes,cond);
x1Sol(t) = simplify(x1Sol(t));
x2Sol(t) = simplify(x2Sol(t));

digits(4)
fprintf('x_1(t) = %s\n',char(vpa(x1Sol)))
fprintf('x_2(t) = %s\n',char(vpa(x2Sol)))