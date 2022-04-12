clear; clc; close all;

% Description: Solves an ODE using Finite Difference Method

% Analytical Solution
ye = @(x) -x + 4.71612*exp(0.5*(sqrt(5)-1).*x) + 3.78388*exp(-0.5*(sqrt(5)+1).*x) - 1;

% Boundary conditions
a   = 7.5;
y0  = a;
y1  = a;

for nseg = [4,8]
    h    = 1/nseg;
    x    = 0:h:1;
    nx   = numel(x);
    
    figure(1)
    hold on
    xlabel('x')
    ylabel('y')
    epsilon = 1;
    
    L = 1/h^2 - 1/2/h;
    C = -2/h^2 - 1;
    R = 1/h^2 + 1/2/h;
    
    AU = diag(R*ones(1,nx-1), 1);
    AC = diag(C*ones(1,nx), 0);
    AL = diag(L*ones(1,nx-1),-1);
    A = AU + AC + AL;
    
    A(1,:) = 0;
    A(1,1) = 1;
    A(end,:) = 0;
    A(end,end) = 1;
    
    b = x(:);
    b(1) = y0;
    b(end) = y1;
    
    y = A\b;
    plot(x,y,'-o','DisplayName',sprintf('N = %d',nseg))
    legend('Location','north')
    grid on
      
    xq           = 0.5;
    yexact      = ye(xq)
    ynumerical  = y(x==xq)
    relerror    = abs((yexact-ynumerical)/yexact) 
end

hold on
xq = linspace(0,1,100);
plot(xq,ye(xq),'DisplayName','Analytical Solution')