clear; clc; close all;

% Description: Shows propeties of matrices

A = [1 -3 5; 2 2 4; -2 0 6];
B = [0 -2 1; 5 1 -6; 2 7 -1];
C = [-3 4 -1;0 8 2; -3 5 3];

%(a)
disp('22(a): Commutative')
disp('A+B')
A+B
disp('B+A')
B+A

%(b)
disp('22(b): Associative')
disp('A+(B+C)')
A+(B+C)
disp('(A+B)+C')
(A+B)+C

%(c)
disp('22(c): Scalar Multiplication is Distributive')
disp('3(A+C)')
3*(A+C)
disp('3A+3C')
3*A+3*C

%(d)
disp('22(d): Matrix Multiplication is Distributive')
disp('A(B+C)')
A*(B+C)
disp('AB+AC')
A*B+A*C

