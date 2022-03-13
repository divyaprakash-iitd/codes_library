clear; clc; close all;

% Description: Solves a differential equation describing a steady state
% radial heat transfer boundary value problem using dsolve (Analytical 
% Solution) and shooting method and bvp4c (Numerical Solution).

ri = 0.2;   % [m]
ro = 1;     % [m]
Ti = 250;   % [C]
To = 50;    % [C]
k  = 20;    % [W/m/K]
qg = 0*30e3;  % [W/m^3]

figure(1)
hold on
xlabel('r [m]')
ylabel('T [K]')

for N = [10, 20]
    dr = (ro-ri)/N;
    r = ri:dr:ro;
    
    % Initialize the solution vector
    T = zeros(size(r));
    
    % Apply boundary conditions
    T(1) = Ti;
    T(end) = To;
    
    % Calculate coefficients
    A = -1/dr + r/dr^2;
    B = -2*r/dr^2;
    C = 1/dr + r/dr^2;
    
    maxiter = 1e4;
    for iter = 1:maxiter
        for i = 2:N
            T(i) = 1/B(i) * (-qg/k/r(i) - A(i)*T(i-1) - C(i)*T(i+1));
        end
    end   
    plot(r,T,'-o','DisplayName',sprintf('N = %d',N))
end
legend show
grid on