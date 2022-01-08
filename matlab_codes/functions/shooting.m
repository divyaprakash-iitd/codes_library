clear; clc; close all;

Ta = 20;
a = 0.01;

% BVP 
odefun = @(x,T) [T(2); -a*(Ta-T(1))];

% Boundary Conditions
T0 = 40;
TN = 200;

% IVP Problem
x0 = 0; xN = 10; N = 1000;
x = linspace(x0,xN,N);

initialGuess = 10;
shootingGuess = fzero(@(guess) residual(odefun,x,[T0 guess],TN),initialGuess);

% Shooting Method
T1 = zeros(1,N);
T2 = zeros(1,N);
T1(1) = T0; T2(1) = shootingGuess;

h = x(2)-x(1);

% ode45
[X,TT] = ode45(odefun,x,[T0 shootingGuess]);
plot(X,TT(:,1))

for i = 1:N-1
    [~, T1Temp] = RK4(@(x,T2) odefun(x,[T1(i) T2]),x(i),x(i+1),h,T2(i),2);
    T1(i+1) = T1Temp(2);
    
    [~, T2Temp] = RK4(@(x,T1) odefun(x,[T1 T2(i)]),x(i),x(i+1),h,T1(i),2);
    T2(i+1) = T2Temp(2);
end

hold on
plot(x,T1,'-.');
function r = residual(odefun,tspan,IC,TN)
    [~,T] = ode45(odefun,tspan,IC);
    r = T(end,1) - TN;
end
