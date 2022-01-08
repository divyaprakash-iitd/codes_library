clear; close all; clc;

% Description: Solves a set of equations using matrix inversion

A = [ 6 -3 -4  5  0;
     -2  3  0 -4  6;
      2  0  7 -4  1;
      1  1  1  1  1;
      0  5  4  2 -1];

b = [9 -38 32 1 5]';

Ainv = inv(A);

x = Ainv*b;