clear; clc; close all;

% Description: Maximizes area

syms x y
A = x*y*(5-x*y)/(x+y);
dAx = matlabFunction(diff(A,x));
dAy = matlabFunction(diff(A,y));
A = matlabFunction(A);

N = 50;
x = linspace(1,100,N);
y = linspace(1,100,N);

[x,y] = meshgrid(x,y);

surf(x,y,A(x,y));
hold on

% Initial guess
x0 = 100;
y0 = 100;

% Step size
dx = 0.001;
dy = 0.001;

reltol = 1;
tol = 1e-10;
it = 0;
plot3(x0,y0,A(x0,y0),'rx')
while reltol > tol
    it = it + 1;
    xtemp = x0 + dx*dAx(x0,y0);
    ytemp = y0 + dy*dAy(x0,y0);

    Aold = A(x0,y0);
    
    x0 = xtemp;
    y0 = ytemp;

    Anew = A(xtemp,ytemp);
    plot3(x0,y0,Anew,'rx')
    reltol = abs((Aold-Anew)/Aold);
end
z0 = (5-x0*y0)/(x0+y0);
fprintf('The dimension of the box is, x =  %.1f, y = %.1f and z = %.1f\n',x0,y0,z0)
