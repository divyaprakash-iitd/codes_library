clear; clc; close all;

% Description: Solves a PDE using finite difference

nSeg = 10000;

hold on
for NN = [4 8 16 32] 
    nSeg = NN;
    xStart = 0;
    xEnd = 1;
    dx = (xEnd-xStart)/nSeg;
    x = xStart:dx:xEnd;

    N = numel(x);

    T = zeros(1,N);

    % Boundary conditions
    T(1) = 0;
    T(end) = 1;

    % Coefficients
    LC = 1/dx^2 - 1/2./x.^2/dx;
    MC = -2/dx^2 -5./x.^2;
    RC = 1/dx^2 + 1/2./x.^2/dx;

    Au = diag(RC(1:end-1).*ones(1,N-1),1);
    Am = diag(MC.*ones(1,N),0);
    Al = diag(LC(2:end).*ones(1,N-1),-1);

    A = Au+Am+Al;
    A(1,:) = 0;
    A(end,:) = 0;
    A(1,1) = 1;
    A(end,end) = 1;

    b = zeros(N,1);
    b(1) = T(1);
    b(end) = T(end);

    T = A\b;
    plot(x,T,'-o','DisplayName',sprintf('N = %d',NN))
end
legend('Location','NorthWest')