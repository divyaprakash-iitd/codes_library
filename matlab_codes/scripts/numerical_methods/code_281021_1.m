clear; clc; close all;

% Description: Solves an IVP using Heun's method

g = 9.80665;
k = 40;
L = 0.5;
m = 0.25;

odefun = @(t,x) [ x(2);
                  x(1)*x(4)^2 + g*cos(x(3))-k/m*(x(1)-L);
                  x(3);
                  (-2*x(2)*x(4)-g*sin(x(3)))/x(1)];
t0 = 0; tN = 10;
tspan = [t0 tN];
dt = 0.0001;
x0 = [L 0 deg2rad(60) 0]';


X = heun(odefun,tspan,x0,dt);
t = t0:dt:tN;

x = X(:,1).*cos(X(:,3));
y = X(:,1).*sin(X(:,3));

comet(x,y)
              
rs = interp1(X(:,3),x(:,1),2*pi);

fprintf('The chord length when theta is zero for the first time is: %.4f m\n',rs)
              
function y = heun(fun,tspan,y0,dt)
    t           = tspan(1):dt:tspan(2);
    nt          = numel(t);
    y           = zeros(nt, numel(y0));
    y(1,:)      = y0;
    
    % Heun's Method
    for i = 1:nt-1
        y0 = y(i,:) + fun(t(i),y(i,:))'*dt;
        y(i+1,:) = y(i,:) + (fun(t(i),y(i,:))+fun(t(i+1),y0))'/2*dt;
    end
end
