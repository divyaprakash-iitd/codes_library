clear; clc; close all;

% Description: Solves a system of ODEs

a = linspace(-2.5,1.5,80);
b = linspace(-1.25,1.25,50);

M = mabode(a,b);

[A,B] = meshgrid(a,b);
surf(A,B,M)

function M = mabode(A,B)
    NA = length(A);
    NB = length(B);

    M = zeros(NB,NA);

    for row = 1:NB
        for col = 1:NA
            dydt = @(t,y) [ y(1)^2 - y(2)^2 + A(col)*cos(2*pi*t);
                            2*y(1)*y(2) + B(row)*sin(2*pi*t)];
            [T,Y] = ode23(dydt,[0,1],[0;0]);
            M(row,col) = norm(Y(length(T),:));
        end
    end
end