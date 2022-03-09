clear; clc; close all;

% Description: Solves an ODE using Euler's method

%%% Define the interval [a,b] and the initial condition
a = 0;
b = 0.5;
y0 = 1;

%%% Find the approximated solution using Euler's method
N = 10;
[x1,y1] = Euler(a,b,y0,N);

N = 100;
[x2,y2] = Euler(a,b,y0,N);

%%% Define the exact solution
N = 1000;
x3 = a:(b-a)/N:b;
y3 = 3*exp(1/2*x3) - x3 - 2;

%%% Plot the three solutions on the same figure
figure;
plot(x1,y1,'r'); hold on;
plot(x2,y2,'g'); hold on;
plot(x3,y3,'b'); hold off;

function [x,y] = Euler(a,b,y0,N)
    f = @(x,y) 1/2*x + 1/2*y;
    
    h          = (b-a)/N;
    x           = a:h:b;
    y           = zeros(1,N+1);
    x(1)      = a;
    y(1)     = y0;
    

    %%% Main loop for Euler's method
    for i = 2:N+1
        y(i) = y(i-1) + f(x(i-1),y(i-1))*h;
    end
end