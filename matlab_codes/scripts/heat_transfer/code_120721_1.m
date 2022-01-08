clear; clc; close all;

% Solves a 1D steady state heat transfer problem with dirichlet boundary
% conditions

% Boundary conditions
TL = 10;
TR = 100;

N = 6;
T = zeros(1,N);
T(1) = TL;
T(end) = TR;

imax = 500;
for k = 1:imax
    for i = 2:N-1
        T(i) = (T(i+1) + T(i-1))/2;
    end
end

T
