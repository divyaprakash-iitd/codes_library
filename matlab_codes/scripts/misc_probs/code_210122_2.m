clear; clc; close all;

% Description: Calculates the row-echelon form of a matrix

% x   +  2y   +  3z   +  4w   +  5v  = 6 
% 7x  +  8y   +  9z   +  10w  +  11v = 12 
% 13x +  14y  +  15z  +  16w  +  17v = 18 
% 19x +  20y  +  21z  +  22w  +  23v = 24 
% 25x +  26y  +  27z  +  28w  +  29v = 30 
% 31x +  32y  +  33z  +  34w  +  35v = 36

% Construct the matrix
x = reshape(1:36,[6,6])';

% Reduced row-echelon form
R = rref(x)

fprintf('Rank of Coefficient matrix\n')
A = x(:,1:5);
rankA = rank(A)

fprintf('Rank of Augmented matrix\n')
rankAB = rank(x)




