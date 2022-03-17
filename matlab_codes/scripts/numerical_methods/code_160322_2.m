clear; clc; close all;

% Description: Using symbolic toolbox to solve and plot the given equation

syms V(V0,lambda,alpha,t)
V = V0*exp(lambda*(1-exp(-alpha*t))/alpha);

disp('ODE')
dVdt = diff(V,t)

% Integrating to find the above equation to find the solution
disp('Solution of ODE')
VI = int(dVdt)

V = matlabFunction(V);
alpha = 0.3;
lambda = 1;
V0 = 2;
t = 0:0.2:20;

plot(t,V(V0,alpha,lambda,t))
xlabel('t')
ylabel('V')
grid on