clear; clc; close all;

% Description: Plots streamlines for Potential Flow cases.

x0 = -2; xN = 2;
y0 = -2; yN = 2;
N = 100;
x = linspace(x0,xN,N);
y = linspace(y0,yN,N);

[xmesh,ymesh] = meshgrid(x,y);
x_c = 0; y_c = 0;
q = 1;

[u1,v1,psi1,phi1] = addpotential(xmesh,ymesh,x_c,y_c,q,'source');
%[u2,v2,psi2,phi2] = addpotential(xmesh,ymesh,x_c,y_c,q,'vortex');
u2 = 1; v2 = 0;
u = u1 + u2;
v = v1 + v2;

hold on
%xstart = x; ystart = y0*ones(size(xstart));
%streamline(xmesh,ymesh,u,v,xstart,ystart);
 ystart = y; xstart = x0*ones(size(ystart));
 streamline(xmesh,ymesh,u,v,xstart,ystart);
 ystart = y; xstart = -0*ones(size(ystart));
 streamline(xmesh,ymesh,u,v,xstart,ystart);
% xstart = x; ystart = yN*ones(size(xstart));
% streamline(xmesh,ymesh,u,v,xstart,ystart);
% ystart = y; xstart = xN*ones(size(ystart));
% streamline(xmesh,ymesh,u,v,xstart,ystart);
axis equal