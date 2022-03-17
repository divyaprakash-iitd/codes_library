clear; clc; close all;

% Description: Solves an ODE using Euler's method using adaptive 
% time-stepping 

U0 = 265.7*1e3/3600; % [m/s]
g = 9.81; % [m/s]
theta = deg2rad(30);

dzdt = @(t,z) [z(2); 0; z(4); -g];

z0 = [0; U0*cos(theta); 0; U0*sin(theta)];

h = 0.1;
E = 1;
while abs(E) > 1e-5
    [~,z] = euler_ivp(dzdt,z0,h);
    Lh = z(end,1);

    [~,z] = euler_ivp(dzdt,z0,h/2);
    Lhby2 = z(end,1);

    E = (Lhby2 - Lh)/Lhby2;
    h = h/2;
end

plot(z(:,1),z(:,3))
fprintf('L = %.4f m\n', Lhby2)
fprintf('Required time-step, h = %.e\n',h)

function [t,y] = euler_ivp(fun,y0,dt)
    y(1,:)      = y0;
    
    t = 0;
    i = 1;
    while 1
        temp(1,:) = y(i,:) + fun(t,y(i,:))'*dt;
        if (temp(1,3) < 0)
            break;
        end
        y(i+1,:) = temp;
        i = i + 1;
    end

end