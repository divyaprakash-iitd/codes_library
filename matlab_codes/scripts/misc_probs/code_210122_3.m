clear; clc; close all;

% Description: Solves a linear regression problem

F = 0:20:80;
L = [20 95 170 270 360];

figure(1)
scatter(F,L)
xlabel('Force [N]')
ylabel('Length [mm]')
grid on

% Regression line
p = polyfit(F,L,1);

figure(2)
scatter(F,L)
hold on
plot(F,polyval(p,F))
xlabel('Force [N]')
ylabel('Length [mm]')
grid on