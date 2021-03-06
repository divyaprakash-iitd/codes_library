clear; clc; close all;

% Description: Solves a 2D steady state heat transfer problem with no heat
% generation, with Dirichlet boundary conditions at the left and right
% boundary and Neumann boundary conditions at the top and bottom boundary.

% Constants
N           = 5;
LEFT        = 1;
RIGHT       = 2;
TOP         = 3;
BOTTOM      = 4;
CENTER      = 5;
OMEGA       = 1.99;
MAX_ITER    = 10000;
ERR         = 1;
TOLERANCE   = 1e-10;

% Grid Size
h = 0.05;
x = 0:h:2;
y = 0:h:2;

Nx = numel(x);
% Add ghost nodes to top and bottom
Ny = numel(y) + 2;

% Coefficient Matrix
A = ones(Nx,Ny,N);
A(:,:,CENTER) = -4;

% RHS Matrix
B = zeros(Nx,Ny);

% Solution Matrix
T = zeros(Nx,Ny);

% Residual Matrix
R = zeros(Nx,Ny);

% Dirichlet BC (Left and Right)
T(1,:)      = 10;
T(end,:)    = 1;
% Neumann BC (Top and Bottom)
B(:,2) = 24*h;

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

           % Assign Coefficients
           [A(iNx,jNy,TOP), A(iNx,jNy,BOTTOM)] = assigncoefficients(Ny,jNy);

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

           % Assign Coefficients
           [A(iNx,jNy,TOP), A(iNx,jNy,BOTTOM)] = assigncoefficients(Ny,jNy);

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
TA = T(1:Nx,2:Ny-1);
contourf(TA',50,'edgecolor','none')
colormap(jet)
colorbar

figure(1)
set(h1,'yscale','log')


function [TOP_C,BOTTOM_C] = assigncoefficients(Ny,jNy)
    % Default coefficients values
    TOP_C = 1; BOTTOM_C = 1;
    
    % Top Boundary
    if jNy == Ny-1
        TOP_C     = 0;
        BOTTOM_C  = 2;
    end
    
    % Bottom Boundary
    if jNy == 2
        TOP_C     = 2;
        BOTTOM_C  = 0;
    end
end