clear; clc; close all;

% Description: Solves a system of linear equations with Jacobi and
% Gauss-Seidel method

A = [    1     -0.25    -0.25          0;
     -0.25         1        0      -0.25;
     -0.25         0        1      -0.25;
         0     -0.25    -0.25          1];

b = [50 50 25 25]';

[x1, x2, x3, x4] = deal(0);

% Augmented matrix
AM = [A b];

% Reduced row-echelon form
rref(AM)

% Jacobi method
for i = 1:10
    x1old = 1/A(1,1) * (b(1) - A(1,2)*x2 - A(1,3)*x3 - A(1,4)*x4);
    x2old = 1/A(2,2) * (b(2) - A(2,1)*x1 - A(2,3)*x3 - A(2,4)*x4);
    x3old = 1/A(3,3) * (b(3) - A(3,1)*x1 - A(3,2)*x2 - A(3,4)*x4);
    x4old = 1/A(4,4) * (b(4) - A(4,1)*x1 - A(4,2)*x2 - A(4,3)*x3);

    x1 = x1old
    x2 = x2old
    x3 = x3old
    x4 = x4old
end

% Gauss-Seidel method
[x1, x2, x3, x4] = deal(0);
for i = 1:10
    x1 = 1/A(1,1) * (b(1) - A(1,2)*x2 - A(1,3)*x3 - A(1,4)*x4)
    x2 = 1/A(2,2) * (b(2) - A(2,1)*x1 - A(2,3)*x3 - A(2,4)*x4)
    x3 = 1/A(3,3) * (b(3) - A(3,1)*x1 - A(3,2)*x2 - A(3,4)*x4)
    x4 = 1/A(4,4) * (b(4) - A(4,1)*x1 - A(4,2)*x2 - A(4,3)*x3)
end