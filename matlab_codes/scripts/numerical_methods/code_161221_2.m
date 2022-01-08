clear; clc; close all;

% Description: Solves a gradient descent problem

clear; clc; close all;

% Description: Minimizes area

syms x y
A = x^2/4 + cos(pi/2*y) + 2;
dAx = matlabFunction(diff(A,x));
dAy = matlabFunction(diff(A,y));
A = matlabFunction(A);

N = 50;
x = linspace(-2,2,N);
y = linspace(-2,2,N);

[x,y] = meshgrid(x,y);

surf(x,y,A(x,y));
hold on

% Initial guess
x0 = -1;
y0 = -1.5;

% Step size
dx = 0.01;
dy = 0.01;

reltol = 1;
tol = 1e-6;
it = 0;

while ((reltol > tol) && it < 100) 
    it = it + 1;
    xtemp = x0 + dx*dAx(x0);
    ytemp = y0 + dy*dAy(y0);

    Aold = A(x0,y0);
    
    x0 = xtemp;
    y0 = ytemp;

    Anew = A(xtemp,ytemp);
    plot3(x0,y0,Anew,'rx')
    reltol = abs((Aold-Anew)/Aold);
end
