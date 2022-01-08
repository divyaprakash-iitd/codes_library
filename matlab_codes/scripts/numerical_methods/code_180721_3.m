clear; clc; close all;

% Description: Solves a system of equations using ode45

A = [0 -9 -9; -9 0 -9; -9 -9 0];A = [0 -9 -9; -9 0 -9; -9 -9 0];

odefun = @(t,x) [A(1,1)*x(1) + A(1,2)*x(2) + A(1,3)*x(3);
                 A(2,1)*x(1) + A(2,2)*x(2) + A(2,3)*x(3);
                 A(3,1)*x(1) + A(3,2)*x(2) + A(3,3)*x(3)];
             
x0 = [4 3 -1];
