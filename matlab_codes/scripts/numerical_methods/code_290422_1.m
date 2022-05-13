clear; clc; close all;

% Description: Solves for the range and time of flight of a projectile

m = 0.25;
cd = 0.03;
g = 9.80665;

v0 = 50;
theta = deg2rad(30);

odefun = @(t,x) [   x(2);
                    -cd/m*x(2)*(sqrt(x(2)^2 + x(4)^2))^0.5;
                    x(4);
                    -cd/m*x(4)*(sqrt(x(2)^2 + x(4)^2))^0.5 - g  ];

x0 = [0,v0*cos(theta),0,v0*sin(theta)];

tsim = fzero(@(t) residual(odefun,x0,t), 10);

[t,x] = ode45(odefun,[0,tsim],x0);

plot(x(:,1),x(:,3))
xlabel('x')
ylabel('y')
title('Trajectory')
set(gca,'xaxislocation','origin')

fprintf('Range: %.4f\n',x(end,1))
fprintf('Time of flight: %.4f\n',t(end))

function r = residual(odefun,x0,t)
    [~,x] = ode45(odefun,[0,t],x0);
    r = x(end,3);
end