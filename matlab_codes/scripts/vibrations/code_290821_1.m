clear; clc; close all;

% Description: Solves a forced vibrations (spring-mass-damper) problem
% analytically using Matlab symbolic toolbox.

% Data
m   = 4;          % [kg]
k   = 12;         % [N/m]
c   = 8*sqrt(3);  % [N-s/m]

% Forcing function (Symbolic)
syms t
f = sin(t)+cos(t);

% Initial Conditions
x0 = 10e-2;     % [m]
v0 = 3;         % [m/s]
ic = [x0 v0];

[x, v] = smdanalytical(m,c,k,f,ic);

t = 0:0.1:4;
yyaxis left
plot(t,subs(x,t),'DisplayName','Analytical')
ylabel('Position')

yyaxis right
plot(t,subs(v,t),'DisplayName','Analytical')
ylabel('Velocity')
xlabel('Time')

% Forcing function (Anonymous)
f = @(t) sin(t)+cos(t);
[x, v] = smdnumerical(m,c,k,f,ic,t);
yyaxis left
hold on
plot(t,x,'o','DisplayName','Numerical')

yyaxis right
hold on
plot(t,v,'o','DisplayName','Numerical')