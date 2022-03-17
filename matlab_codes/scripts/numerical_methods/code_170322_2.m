clear; clc; close all;

% Description: Solves for the trajectory of a golf ball using Euler's
% method

Cd = 0.056;
g = 9.81;
U0 = 10; % [m/s]
theta = deg2rad(30);
y0 = [0; U0*cos(theta); 0; U0*sin(theta)];

dydt = @(t,y) [ y(2);
                -Cd*(y(1)*sqrt(y(1)^2+y(3)^2));
                y(4);
                -Cd*(y(3)*sqrt(y(1)^2+y(3)^2)) - g];

h = 0.1;
E = 1;
while abs(E) > 1e-5
    [~,y] = euler_ivp(dydt,y0,h);
    Lh = y(end,1);

    [~,y] = euler_ivp(dydt,y0,h/2);
    Lhby2 = y(end,1);

    E = (Lhby2 - Lh)/Lhby2;
    h = h/2;
end

plot(y(:,1),y(:,3))
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