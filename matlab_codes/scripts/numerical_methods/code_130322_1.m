clear; clc; close all;

% Description: Solves a 1D heat conduction problem using the iterative
% Gauss-Seidel method

dx = 0.1; % [m]

N = 11;
i = 1:N;
x = (i-1)*dx;

u = zeros(size(x));

% Boundary conditions
u(1) = 0;
u(end) = 100;

% Initial guess
u(2:end-1) = 0;

error = 1;
epsilon = 1e-6;

iter = 0;
while error > epsilon
    error = 0;
    for i = 2:N-1
        res = u(i+1) - 2*u(i) + u(i-1);
        u(i) = u(i) + res/2;
        error = error + (res)^2;
    end
    iter = iter + 1;
    fprintf('\nIteration number: %d\n',iter)
    fprintf('Error: %e\n',error)
end

