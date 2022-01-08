clear; clc; close all;

% Description: Matrix multiplication

A = [1 2 3; 4 5 6; 7 8 9]
B = [1 6; 2 5; 3 4]

C1 = MatrixMultiplication1(A,B)

C2 = MatrixMultiplication2(A,B)


function C = MatrixMultiplication1(A,B)
    C = A*B;
end

function C = MatrixMultiplication2(A,B)
    row = size(A,1);
    col = size(B,2);
    
    C = zeros(row,col); 
    
    for i = 1:row
        for j = 1:col
            C(i,j) = myScalarProduct(A(i,:),B(:,j));
        end
    end
end

function S = myScalarProduct(x,y)
    N = numel(x);
    S = 0;
    for i = 1:N
        S = S + x(i)*y(i);
    end
end

