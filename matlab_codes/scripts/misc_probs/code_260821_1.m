clear; clc; close all;

% Description: Plots a surface and its tangent plane at the specified
% point.
% https://in.mathworks.com/help/matlab/math/calculate-tangent-plane-to-surface.html
f = @(x,y) x.^3 -x.*y.^2 + x.*y + y.^4;
[xx,yy] = meshgrid(-4:0.25:4);
[fx,fy] = gradient(f(xx,yy),0.25);

x0 = -1;
y0 = 0;
t = (xx == x0) & (yy == y0);
indt = find(t);
fx0 = fx(indt);
fy0 = fy(indt);

z = @(x,y) f(x0,y0) + fx0*(x-x0) + fy0*(y-y0);

surf(xx,yy,f(xx,yy),'EdgeAlpha',0.7,'FaceAlpha',0.9)
hold on
surf(xx,yy,z(xx,yy))
plot3(1,2,f(1,2),'r*')

view(-135,9)