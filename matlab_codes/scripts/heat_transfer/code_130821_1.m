clear; clc; close all;

% Description: Solves a 2D steady state heat transfer problem with no heat
% generation, with Dirichlet boundary conditions at the boundaries.

% Constants
N           = 5;
LEFT        = 1;
RIGHT       = 2;
TOP         = 3;
BOTTOM      = 4;
CENTER      = 5;
OMEGA       = 1.9;
MAX_ITER    = 10000;
ERR         = 1;
TOLERANCE   = 1e-8;

% Grid Size
dx  = 0.02;
dy  = 0.01;
x   = 0:dx:2;
y   = 0:dy:1;

Nx  = numel(x);
Ny  = numel(y);

% Coefficient Matrix
A = ones(Nx,Ny,N);
A(:,:,CENTER) = -4;

% RHS Matrix
B = zeros(Nx,Ny);

% Solution Matrix
Ti = 300; % Initial Guess
T = Ti*ones(Nx,Ny);

% Residual Matrix
R = zeros(Nx,Ny);

% Dirichlet BC (Left and Right)
T(1,:)      = 300;
T(end,:)    = 20;
% Dirichlet BC (Top and Bottom)
T(:,1)      = 300;
T(:,end)    = 300;


figure(1)
h1 = gca;
hold on
xlabel('Iterations')
ylabel('||R||')
iIter = 1;
while (iIter < MAX_ITER && ERR > TOLERANCE)
    % Iterate through the domain
    % [2,Nx] X [2,Ny+1]
    for iNx = 2:Nx-1 % Exclude the left and right boundary
        for jNy = 2:Ny-1 % Exclude the ghost nodes at the top and bottom boundary

            TTemp = B(iNx,jNy) - ...
                    (A(iNx,jNy,LEFT)    *   T(iNx-1,jNy) + ...
                    A(iNx,jNy,RIGHT)   *   T(iNx+1,jNy) + ...
                    A(iNx,jNy,TOP)     *   T(iNx,jNy+1) + ...
                    A(iNx,jNy,BOTTOM)  *   T(iNx,jNy-1));

            %T(iNx,jNy) = 1/A(iNx,jNy,CENTER)*TTemp;
            % Modified SOR Formula
            T(iNx,jNy) = (1-OMEGA)*T(iNx,jNy) + OMEGA/A(iNx,jNy,CENTER)*TTemp;
        end
    end
    
    % Calculate Residual
    for iNx = 2:Nx-1 % Exclude the left and right boundary
        for jNy = 2:Ny-1 % Exclude the ghost nodes at the top and bottom boundary
            
            R(iNx,jNy) =  (A(iNx,jNy,LEFT)   *   T(iNx-1,jNy)    + ...
                          A(iNx,jNy,RIGHT)   *   T(iNx+1,jNy)    + ...
                          A(iNx,jNy,TOP)     *   T(iNx,jNy+1)    + ...
                          A(iNx,jNy,BOTTOM)  *   T(iNx,jNy-1)    + ...
                          A(iNx,jNy,CENTER)  *   T(iNx,jNy))   - ...
                          B(iNx,jNy);
        end
    end
    iIter = iIter + 1;
    
    % Error
    RR = R(2:Nx-1,2:Ny-1);
    ERR = norm(RR(:));
    semilogy(iIter,ERR,'r.')
end
figure(2)
TA = T(1:Nx,1:Ny);
contourf(TA',30,'edgecolor','none')
colorbar

figure(1)
set(h1,'yscale','log')
