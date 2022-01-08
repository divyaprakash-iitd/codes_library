clear; clc; close all;

% Description: Minimizes area

syms x y
A = 2*x*y + 2000/y + 2000/x;
dAx = matlabFunction(diff(A,x));
dAy = matlabFunction(diff(A,y));
A = matlabFunction(A);

N = 50;
x = linspace(2,15,N);
y = linspace(2,15,N);

[x,y] = meshgrid(x,y);

surf(x,y,A(x,y));
hold on

% Initial guess
x0 = 1;
y0 = 1;

% Step size
dx = 0.001;
dy = 0.001;

reltol = 1;
tol = 1e-10;
it = 0;

while reltol > tol
    it = it + 1;
    xtemp = x0 - dx*dAx(x0,y0);
    ytemp = y0 - dy*dAy(x0,y0);

    Aold = A(x0,y0);
    
    x0 = xtemp;
    y0 = ytemp;

    Anew = A(xtemp,ytemp);
    plot3(x0,y0,Anew,'rx')
    reltol = abs((Aold-Anew)/Aold);
end

fprintf('The dimension of the box is, x =  %.1f, y = %.1f and z = %.1f\n',x0,y0,1000/x0/y0)
