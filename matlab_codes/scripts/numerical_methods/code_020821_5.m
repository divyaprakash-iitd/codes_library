clear; clc; close all;

% Description: Solve a BVP using shooting method.

% Let w=y(1) and z=y(2)

l = 94; % [cm]
T = 700; % [kg]
p = 110; % [kg/cm]
R = 50e6; % [kg.cm^2]

odefun = @(x,y) [y(2);
                 T*y(1)/R + p*x.*(x-l)/2/R];

xStart = 0; xEnd = l;
N = 1000;
x = linspace(xStart,xEnd,N);
yStart = 0; 
yEnd = 0;
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