clear; clc; close all;

% Description: Solves a rocket sled problem with varying fuel mass

% Initial condition
s0 = 0; % [m/s]
v0 = 0; % [m/s]

tspan = [0, 50]; % [s]

[t,x] = ode45(@odefun,tspan,[s0,v0]);

% Plot displacement and velocity
yyaxis left
plot(t,x(:,1))
xlabel('t')
ylabel('s(t)')

yyaxis right
plot(t,x(:,2))
ylabel('v(t)')
grid on


function ode = odefun(t,x)
    mr = 450;   % [kg]
    mf = 22.5;  % [kg]
    mp = 100;   % [kg]
    
    M = @(t) mr + mp + mf - 1.5*t;
    
    T = @(t) 15.20e3*(t<=15); % Thrust only till fuel lasts (15 seconds)
    
    ode =  [    x(2);
                1/M(t) * (T(t) - 1.25*x(2)^2)   ];
end