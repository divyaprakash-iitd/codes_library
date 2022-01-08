clear; clc; close all;

% Simulates the vertical motion of a rain drop

g = 9.8;
rho = 1.2250;
m = 3.14159e-6;
S = 1.2250e-6;
H0 = 500;
tSim = 20;

dt = 0.01;
tspan = [0 tSim];

odefun = @(t,z,Cd) [z(2);
                 1/m*(-m*g + Cd*1/2*rho*z(2)^2*S)];
z0 = [H0,0];             
for Cd = 0.2:0.2:0.8
    [t,z] = RK4(@(t,z) odefun(t,z,Cd),tspan,z0,dt);
    
    hold on
    yyaxis left
    plot(t,z(:,1),'HandleVisibility','Off')
    xlabel('time')
    ylabel('Vertical Position')
    
    
    yyaxis right
    plot(t,z(:,2),'DisplayName',sprintf('Cd=%.1f',Cd))
    ylabel('Velocity')
    
end

legend show

function [t,y] = RK4(fun,tspan,y0,dt)
    t           = tspan(1):dt:tspan(2);
    nt          = numel(t);
    y           = zeros(nt, numel(y0));
    y(1,:)      = y0;
    
    
    for i = 1:nt-1
        k1 = fun(t(i),y(i,:))';
        k2 = fun(t(i)+dt/2, y(i,:)+dt*k1/2)';
        k3 = fun(t(i)+dt/2, y(i,:)+dt*k2/2)';
        k4 = fun(t(i)+dt,y(i,:)+dt*k3)';
        
        y(i+1,:) = y(i,:) + 1/6*dt*(k1 + 2*k2 + 2*k3 + k4);
    end
end