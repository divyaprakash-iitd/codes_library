clear; clc; close all;

% Description: Solves a projectile problem using the Newton-Rhapson's
% Method

syms k v0 g theta T
f = (k*v0*sin(theta) + g)/g/k * (1-exp(-k*T)) - T;
df = diff(f,T);

fun = matlabFunction(f);
dfun = matlabFunction(df);

v0 = 600; % [m/s]
theta = deg2rad(60); % [radians];
g = 9.81;

fun = @(T,k) fun(T,g,k,theta,v0);
dfun = @(T,k) dfun(T,g,k,theta,v0);

% Range
R = @(k,T) v0*cos(theta)/k*(1-exp(-k*T));

options = optimset('Display','off');

figure(1)
hold on
xlabel('k')
ylabel('$\frac{R(k)}{R(0)}$','interpreter','latex')
for k = [1e-8 0.01:0.01:0.08]
    %T = fzero(@(T) fun(T,k),100,options);
    [T, ~] = newtons(@(T) fun(T,k), @(T) dfun(T,k),100,1e-9,1e5);
    Rk = R(k,T);
    R0 = R(1e-8,T);
    Rapprox = 1 - 4*v0*sin(theta)*k/3/g;
    plot(k,Rk/R0,'rX')
    plot(k,Rapprox,'b^')
end

function [x,iter] = newtons(f,df,x,tol,maxIter)
    err = 1;
	iter = 0;
	while ((iter < maxIter) && (err > tol))
		xold = x - f(x)./df(x);
        err = abs(x-xold)/xold;
        x = xold;
		iter = iter + 1;
	end
end