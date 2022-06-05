clear; clc; close all;

% Description: Manipulates elemets of a matrix

A = randi([0,20],6);

val = 12;
fprintf('Indices of matrix H equal to %d\n',val)
disp(find(A==val))

A(4,2) = 6 + 11i;

fprintf('Real components of matrix H\n')
real(A)
fprintf('Imaginary components of matrix H\n')
imag(A)