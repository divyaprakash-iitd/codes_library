clear; clc; close all;

% Description: Solves a second order ODE using the finite difference method
% and the shooting method using Runge-Kutta 4th order/ode45 method.

K       = 1;                % [m/d]
N       = 0.1;              % [m/d]
x0      = 0;                % [m]
xN      = 1000;             % [m]
h0      = 10;               % [m]
hN      = 5;                % [m]
hBar    = mean([h0,hN]);    % [m]

% Analytical Solution

h = @(x) -N/K/hBar/2*x.^2 + 6.6617*x + 10;

dx = 20;
x = x0:dx:xN;

plot(x,h(x),'DisplayName','Analytical')
hold on

% Finite Difference Solution
NN = numel(x) - 2; % Number of unknowns

% Coefficient Matrix
Au = diag(ones(NN-1,1),1);
Ad = diag(-2*ones(NN,1),0);
Al = diag(ones(NN-1,1),-1);

A = Au + Ad + Al;

% RHS Vector
b = -N/K/hBar*dx^2*ones(NN,1);
b(1) = b(1) - h0;
b(end) = b(end) - hN;


hFd = zeros(1,NN+2);
hFd(1) = h0; hFd(end) = hN;
hFd(2:end-1) = A\b;

plot(x,hFd,'--','DisplayName','Finite-Difference')

%Shooting Method
odefun = @(x,h) [h(2); -N/K/hBar];

guess = fzero(@(gv) h_res(odefun,gv,x,hN),5);

% RK-4 (ode45)
[X, H] = ode45(odefun,x,[0 guess]);

plot(X,H(:,1),'o','DisplayName','RK4')
legend('location','south')
xlabel('x [m]')
ylabel('h [m]')

function r = h_res(odefun,guess_val,x,hN)
   [~, H] = ode45(odefun,x,[0 guess_val]); 
   r = H(end,1)-hN;
end

% dx = 20;
% x = x0:dx:xN;
% NN   = numel(x);
% h1    = zeros(1,NN);
% h2    = zeros(1,NN);
% h1(1) = h0;
% guess = 6.6717;
% h2(1) = guess;
% 
% dh1dx = @(x,h) h;
% dh2dx = @(x,h) -N/K/hBar;
% 
% for i = 1:NN-1
%     k1 = dh1dx(x(i),h2(i));
%     k2 = dh1dx(x(i)+dx/2, h2(i)+dx*k1/2);
%     k3 = dh1dx(x(i)+dx/2, h2(i)+dx*k2/2);
%     k4 = dh1dx(x(i)+dx,h2(i)+dx*k3);
% 
%     h1(i+1) = h1(i) + 1/6*dx*(k1 + 2*k2 + 2*k3 + k4);
%     
%        
%     k1 = dh2dx(x(i),h1(i));
%     k2 = dh2dx(x(i)+dx/2, h1(i)+dx*k1/2);
%     k3 = dh2dx(x(i)+dx/2, h1(i)+dx*k2/2);
%     k4 = dh2dx(x(i)+dx,h1(i)+dx*k3);
% 
%     h2(i+1) = h2(i) + 1/6*dx*(k1 + 2*k2 + 2*k3 + k4);
% end
% 
% plot(x,h1,'-')

