clear; clc; close all;

% Description: Solves a differential equation describing a steady state
% radial heat transfer boundary value problem using dsolve (Analytical 
% Solution) and shooting method and bvp4c (Numerical Solution).

ri = 0.02;  % [m]
ro = 0.03;  % [m]
Ti = 120;   % [C]
To = 30;    % [C]

%% Analytical Solution
syms T(r) B k
DT = diff(T);

ode = r*diff(T,r,2) + diff(T,r,1) + B/k*r^2 == 0;
cond1 = T(ri) == Ti;
cond2 = T(ro) == To;

conds = [cond1 cond2];
TSol(r) = dsolve(ode,conds);
TSol = simplify(TSol);

k = 80;     % [W/m/K]
B = 1e7;    % [w/m^4]

T = matlabFunction(TSol(r));
analyticalT = @(r) T(B,k,r);

r = linspace(ri,ro,1000);

figure(1)
plot(r,analyticalT(r),'DisplayName','Analytical')
xlabel('r [m]')
ylabel('T [^oC]')
legend show

%% Shooting Method
% BVP 
odefun = @(r,T) [T(2); 1/r*(-T(2)-B/k*r^2)];

% IVP Problem
N = 1000;
r = linspace(ri,ro,N);

initialGuess = 10;
shootingGuess = fzero(@(guess) residual(odefun,r,[Ti guess],To),initialGuess);

% Shooting Method
h = 0.001;

[r,T] = RK4(odefun,[ri ro],[Ti shootingGuess],h);

figure(2)
xlabel('r [m]')
ylabel('T [^oC]')
hold on
plot(r,analyticalT(r),'DisplayName','Analytical')
plot(r,T(:,1),'o','DisplayName','Shooting Method');
legend show

%% bvp4c
bvpfcn = @(r,T) [T(2); 1/r*(-T(2)-B/k*r^2)];

bcfcn = @(Ta,Tb) [Ta(1)-Ti; Tb(1)-To];

guess = @(x) [sin(x); cos(x)];

N = 10;
rmesh = linspace(ri,ro,N);
solinit = bvpinit(rmesh, guess);

sol = bvp4c(bvpfcn, bcfcn, solinit);

figure(3)
xlabel('r [m]')
ylabel('T [^oC]')
hold on
plot(r,analyticalT(r),'DisplayName','Analytical')
plot(sol.x, sol.y(1,:), 'o','DisplayName','bvp4c')
xlabel('r [m]')
ylabel('T [^oC]')
legend show

%% Helper Functions

% Residual Function
function r = residual(odefun,tspan,IC,TN)
    [~,T] = ode45(odefun,tspan,IC);
    r = T(end,1) - TN;
end

% Runge-Kutta 4th Order
function [t,y] = RK4(fun,tspan,y0,dt)
    t           = tspan(1):dt:tspan(2);
    nt          = numel(t);
    y           = zeros(nt, numel(y0));
    y(1,:)      = y0;
    
    
    for i = 1:nt-1
        k1 = fun(t(i),y(i,:))';
        k2 = fun(t(i)+dt/2, y(i,:)+dt*k1/2)';
        k3 = fun(t(i)+dt/2, y(i,:)+dt*k2/2)';
        k4 = fun(t(i)+dt,y(i,:)+dt*k3)';
        
        y(i+1,:) = y(i,:) + 1/6*dt*(k1 + 2*k2 + 2*k3 + k4);
    end
end
