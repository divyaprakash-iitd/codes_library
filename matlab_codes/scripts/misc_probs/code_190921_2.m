clear; clc; close all;

% Description: Solves a system of equations using the Gauss-Seidel method


% Initial guess
T11 = 0; T21 = 0; T12 = 0; T22 = 0;
maxiter = 1000;

for i = 1:maxiter
    T11 = 1/4*(75+100+T12+T21);
    T21 = 1/4*(75+T11+T22+0);
    T12 = 1/4*(T11+100+25+T22);
    T22 = 1/4*(T21+T12+25+0);
end

fprintf('T11 = %.4f\n',T11)
fprintf('T21 = %.4f\n',T21)
fprintf('T12 = %.4f\n',T12)
fprintf('T22 = %.4f\n',T22)