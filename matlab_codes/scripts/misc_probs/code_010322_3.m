clear; clc; close all;

% Description: Plots the velocity and pressure distribution around a
% cylinder

% Parameters
U   = 1;
a   = 1;
rho = 1;

N = 50;
x = linspace(-2,2,N);
y = linspace(-2,2,N);
[x,y] = meshgrid(x,y);

r = sqrt(x.^2+y.^2);
theta = atan2(y,x);

u = U*(1-a^2*cos(2*theta)./r.^2);
v = -U*a^2*sin(2*theta)./r.^2;

% Plot the cylinder
u(x.^2+y.^2 < a^2) = NaN;
v(x.^2+y.^2 < a^2) = NaN;

umag = sqrt(u.^2+v.^2);
unorm = u./umag;
vnorm = v./umag;

p = rho/2*(U^2-(u.^2+v.^2));
hold on
contourf(x,y,p,20,'edgecolor','none')
colormap(jet)
colorbar
quiver(x,y,unorm,vnorm,0.5)
axis equal