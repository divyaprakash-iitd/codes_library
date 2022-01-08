clear; clc; close all;

% Description: Plots streamlines in a 2D flow field.

syms x y u v
u = -y./(x.^2+y.^2);
v = x./(x.^2+y.^2);

dudx = diff(u,x);
dvdy = diff(v,y);

u = matlabFunction(u);
v = matlabFunction(v);

x = -1:0.1:1;
y = -1:0.1:1;

[x,y] = meshgrid(x,y);

xStart = -1:0.25:1;
yStart = zeros(size(xStart));
streamline(x,y,u(x,y),v(x,y),xStart,yStart);
axis equal
xlabel('x')
ylabel('y')