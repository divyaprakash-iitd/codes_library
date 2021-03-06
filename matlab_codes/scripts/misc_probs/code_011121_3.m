clear; clc; close all;

% Description: Solves a system of linear equations

A = [4 0 6 -2 1;
     4 -6 1 -1 1;
     2 -4 4 -4 3;
     4 -6 5 -1 2;
     2 -4 0 1 1];
 b = [14 25 5 30 30]';
 
 fprintf('Using Inverse of A')
 x = inv(A)*b
 
 fprintf('Left Division Method\n')
 x = A\b
 