clear; clc; close all;

% Description: Solves a spring mass damper system

% when t<t0
t0 = 1;
xx0_a = [0.1,1];

[t1,x1] = ode45(@sdof_impulse,[0,t0],xx0_a);

% when t>t0
xx0_b = [x1(end,1),x1(end,2)];

[t2,x2] = ode45(@sdof_impulse,[t0,3*t0],xx0_b);

function odefun = sdof_impulse(t,x)
    m   = 10;   % [kg]
    c   = 2;    % [Ns/m]
    k   = 100;  % [N/m]
    F0  = -3;   % [N]
    t0  = 1;    % [s]

    impulse = @(t,t0) t==t0;
    odefun = [x(2);
              1/m*(F0*impulse(t,t0) - c*x(2) - k*x(1))];
end