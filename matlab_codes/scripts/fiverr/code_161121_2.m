clear; clc; close all;

% Description: Finds the root numerically

% Parameters
A       = 6.66e-4;
Patm    = 101.325;
C1      = 30.59051;
C2      = 8.2;
C3      = 0.0024804;
C4      = 3142.31;

% Input
phi     = 0.6;
Tdb     = 85;

% Equations
P = @(T) 10^(C1 - C2*log10(T+273.15) + C3*(T+273.15) - C4/(T+273.15));
y = @(Twb) P(Tdb)*phi - P(Twb) + Patm*A*(Tdb-Twb);

% Newton-Rhapson parameters
x = 10;
tol = 1e-4;

% Newton-Rhapson method    
iter = 0;
h = 0.001;
while abs(y(x)) > tol
    df = (y(x+h) - y(x-h))/2/h;
    x = x - y(x)./df;
    iter = iter + 1;
end

fprintf('The wet-bulb temperature is: %.4f\n',x)