clear; clc; close all;

% Description: Solves a set of equation using Gauss-Seidel method

% Gauss-Seidel parameters
maxiter = 1000;
tol = 1e-12;
R = 1;
iter = 1;

Bi = 0.1;

T = zeros(1,3);
figure(1)
hold on

while (iter < maxiter && R > tol)
    Told = T;
    T(1) = (3*T(2)/2+200+100/2+30*Bi)/(2+Bi);
    T(2) = 1/3*(800 - 100 -T(1) - T(3));
    T(3) = 1/4*(400+3*T(2)+100);
    
    % Residual norm
    R = norm(T-Told);
    plot(iter,R,'rx')
    iter = iter + 1;
end
clear; clc; close all;

% Description: Solves a set of equation using Gauss-Seidel method

% Gauss-Seidel parameters
maxiter = 1000;
tol = 1e-12;
R = 1;
iter = 1;

Bi = 0.1;

T = zeros(1,3);
figure(1)
hold on

while (iter < maxiter && R > tol)
    Told = T;
    T(1) = (3*T(2)/2+200+100/2+30*Bi)/(2+Bi);
    T(2) = 1/3*(800 - 100 -T(1) - T(3));
    T(3) = 1/4*(400+3*T(2)+100);
    
    % Residual norm
    R = norm(T-Told);
    plot(iter,R,'rx')
    iter = iter + 1;
end

set(gca,'yScale','log')
xlabel('Iterations')
ylabel('Residual Norm')

T
set(gca,'yScale','log')
xlabel('Iterations')
ylabel('Residual Norm')

T