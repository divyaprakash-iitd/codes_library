clear; clc; close all;

% Description: Solve a BVP using shooting method.

odefun = @(x,y) [y(2);
                 2 + x*y(2) + x^2*y(1)];

xStart = 0; xEnd = 2;
N = 1000;
x = linspace(xStart,xEnd,N);
yStart = 1; 
yEnd = 3;
initialGuess = 10;

shootingGuess = fzero(@(guess) residual(odefun,x,[yStart guess],yEnd),initialGuess);

% Shooting Method
h = 0.01;

[x,T] = ode45(odefun,[xStart xEnd],[yStart shootingGuess]);

figure(2)
xlabel('x')
ylabel('y')
hold on
plot(x,T(:,1),'-o');

% Residual Function
function r = residual(odefun,tspan,IC,TN)
    [~,T] = ode45(odefun,tspan,IC);
    r = T(end,1) - TN;
end