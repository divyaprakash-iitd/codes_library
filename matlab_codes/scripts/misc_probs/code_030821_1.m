clear; clc; close all;

% Description: Plots streamlines of flow and stagnation point.

u = @(x,y) 0.5 + 0.8*x;
v = @(x,y) 1.5 - 0.8*y;

x = -3:0.1:3;
y = -1:0.1:6;

[X,Y] = meshgrid(x,y);

U = u(X,Y); V = v(X,Y);

xStart = x; yStart = -1*ones(size(xStart));
hold on
streamline(X,Y,U,V,xStart,yStart)

xStart = x; yStart = 6*ones(size(xStart));
streamline(X,Y,U,V,xStart,yStart)

quiver(X,Y,U,V,'color','red')
plot(-0.625,1.875,'k*','linewidth',2)