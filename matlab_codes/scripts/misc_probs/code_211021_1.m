clear; clc; close all;

% Description: Plots a 3D figure

z = @(x,y) sinc(sqrt((x/pi).^2+(y/pi).^2));

N = 100;
X = linspace(-10,10,N);
Y = linspace(-10,10,N);

[x,y] = meshgrid(X,Y);

mesh(x,y,z(x,y))
xlabel('x')
ylabel('y')
zlabel(func2str(z))
colormap(jet)