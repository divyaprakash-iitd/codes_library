clear; clc; close all;

% Description: Solves the spring-mass-damper system using ode45.

m       = 4;    % [kg]
k       = 12;   % [N/m]
c       = 2;    % [N-s/m]
omega   = 2;    % [rad/s]
F       = 2;    % [N]
Ft      = @(t) F*sin(omega*t);

odefun = @(c,t,x) [x(2); 1/m*(Ft(t) - c*x(2) - k*x(1))];

% Initial conditions
x0      = 10e-2;    % [m]
v0      = 3;        % [m/s]clear; clc; close all;

% Description: Solves the spring-mass-damper system using ode45.

m       = 4;    % [kg]
k       = 12;   % [N/m]
c       = 2;    % [N-s/m]
omega   = 2;    % [rad/s]
F       = 2;    % [N]
Ft      = @(t) F*sin(omega*t);

odefun = @(c,t,x) [x(2); 1/m*(Ft(t) - c*x(2) - k*x(1))];

% Initial conditions
x0      = 10e-2;    % [m]
v0      = 3;        % [m/s]

figure(1)
hold on
xlabel('Time [s]')
ylabel('Displacement [m]')
for c = [1 5]
    [t,x] = ode45(@(t,x) odefun(c,t,x),[0 10],[x0 v0]);
    plot(t,x(:,1),'DisplayName',sprintf('c=%4.2f',c))
end
legend show


figure(1)
hold on
xlabel('Time [s]')
ylabel('Displacement [m]')
for c = [1 5]
    [t,x] = ode45(@(t,x) odefun(c,t,x),[0 10],[x0 v0]);
    plot(t,x(:,1),'DisplayName',sprintf('c=%4.2f',c))
end
legend show
