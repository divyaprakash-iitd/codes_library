clear; clc; close all;

% Description: Plots the Shamrock curve

x = @(t) 7*sin(3*t).*cos(t);
y = @(t) 7*sin(3*t).*sin(t);

N = 1000;
t = linspace(0,pi,N);

figure(1)
plot(x(t),y(t),'b-')
axis([-8,8,-8,8])
axis equal off

hold on
tstar = pi/6;
plot(x(tstar),y(tstar),'r*')

theta = pi/3;
Rz = [cos(theta) -sin(theta); sin(theta) cos(theta)];
figure(2)
rot = Rz*[x(t);y(t)];
plot(rot(1,:),rot(2,:),'b-')
axis([-8,8,-8,8])
axis equal off
hold on

rotp = Rz*[x(tstar);y(tstar)];
plot(rotp(1),rotp(2),'r*')

