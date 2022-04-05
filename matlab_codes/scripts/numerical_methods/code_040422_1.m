clear; clc; close all;

% Description: Solves a pde using finite difference method

% Boundary conditions
u0 = 1;
u1 = 3;

h = 0.1;

figure(1)
hold on
xlabel('x')
ylabel('u')
for epsilon = [1,0.5,0.1,0.01,0.001]
    L = epsilon/h^2 + 1/2/h;
    C = -2/h^2;
    R = epsilon/h^2 - 1/2/h;
    
    x   = 0:h:1;
    nx  = numel(x);
    
    AU = diag(R*ones(1,nx-1), 1);
    AC = diag(C*ones(1,nx), 0);
    AL = diag(L*ones(1,nx-1),-1);
    A = AU + AC + AL;
    
    A(1,:) = 0;
    A(1,1) = 1;
    A(end,:) = 0;
    A(end,end) = 1;
    
    b = -1*ones(nx,1);
    b(1) = u0;
    b(end) = u1;
    
    u = A\b;
    plot(x,u,'-o','DisplayName',sprintf('e = %.5f',epsilon))
end
legend('Location','northwest')
title(sprintf('h = %.4f',h))
grid on

figure(2)
hold on
xlabel('x')
ylabel('u')
epsilon = 0.5;
for h = [0.1,0.05,0.025,0.001]
    L = epsilon/h^2 + 1/2/h;
    C = -2/h^2;
    R = epsilon/h^2 - 1/2/h;
    
    x   = 0:h:1;
    nx  = numel(x);
    
    AU = diag(R*ones(1,nx-1), 1);
    AC = diag(C*ones(1,nx), 0);
    AL = diag(L*ones(1,nx-1),-1);
    A = AU + AC + AL;
    
    A(1,:) = 0;
    A(1,1) = 1;
    A(end,:) = 0;
    A(end,end) = 1;
    
    b = -1*ones(nx,1);
    b(1) = u0;
    b(end) = u1;
    
    u = A\b;
    plot(x,u,'-','DisplayName',sprintf('h = %.5f',h))
end
legend('Location','northwest')
title(sprintf('e = %.4f',epsilon))
grid on

x = roots([1 -2 3 0 0 -4]);

for i = 1:5
    fprintf('%.10f+%.10f*I, ',real(x(i)),imag(x(i)))
end