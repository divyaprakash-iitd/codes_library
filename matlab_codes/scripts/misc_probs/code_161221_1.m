clear; clc; close all;

% Description: Solves a linear programming problem

A = [1 0 -0.5
    1 1 0];
b = [0.5 1];

f = [1 3 5];

x = linprog(f,A,b)