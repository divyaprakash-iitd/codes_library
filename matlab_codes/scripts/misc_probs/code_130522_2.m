clear; clc; close all;

% Description: Solves a triple integration problem

z1 = @(x,y) 2*x + 5*y - 2;
z2 = @(x,y) 3 + 0*x*y;

xrange = [0,10];
yrange = [0,10];
N = 10;
x = linspace(xrange(1),xrange(2),N);
y = linspace(yrange(1),yrange(2),N);
[x,y] = meshgrid(x,y);

hold on
xlabel('x')
ylabel('y')
zlabel('z')
surf(x,y,z1(x,y))
surf(x,y,z2(x,y))
set(gca,'xaxislocation','origin')
set(gca,'yaxislocation','origin')
% set(gca,'zaxislocation','origin')
view(3)
