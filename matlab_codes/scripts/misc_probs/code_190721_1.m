clear; clc; close all;

%% Description: Plot a parametric surface and Calculates are using symbolic double integration.

%% Plot surface

x = @(u,v) (4+4*cos(v))*cos(u);
y = @(u,v) (4+4*cos(v))*sin(u);
z = @(u,v) 5*sin(v);

u0 = 0; uN = 2*pi;
v0 = 0; vN = 2*pi;
N = 40;
uq = linspace(u0,uN,N);
vq = linspace(v0,vN,N);

[u,v] = meshgrid(uq,vq);

surf(x(u,v),y(u,v),z(u,v))
xlabel('x(u,v)')
ylabel('y(u,v)')
zlabel('z(u,v)')

firstName      = 'Johnny';
lastName       = 'Good';
studentNumber  = '1234567';
plotTitle      = [firstName,' ',lastName,' ',studentNumber];

title(plotTitle)
saveas(gca,'surface_plot.png')

%% Calculate area
clear;
syms ru rv x y z u v

x = (4+4*cos(v))*cos(u);
y = (4+4*cos(v))*sin(u);
z = 5*sin(v);

ru = [diff(x,u) diff(y,u) diff(z,u)];
rv = [diff(x,v) diff(y,v) diff(z,v)];

ds = matlabFunction(norm(cross(ru,rv))); 
S = integral2(ds,0,2*pi,0,2*pi);

fprintf('The surface area is: %.4f\n',S)
