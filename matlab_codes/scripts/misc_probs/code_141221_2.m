clear; clc; close all;

% Description: Plots an ellipse with equal segments

r1 = 20;
r2 = 10;

dp = @(t) sqrt((r1*sin(t)).^2+(r2*cos(t)).^2);

t = 0:0.0001:2*pi;
circ = sum(dp(t));
n = 20;
nextpoint = 0;
run = 0;

hold on
XX = zeros(1,n);
YY = zeros(1,n);
nc = 1;
for i = 1:numel(t)
    if ceil(n*run/circ) >= nextpoint
        XX(nc) = r1*cos(t(i));
        YY(nc) = r2*sin(t(i));
        plot(XX(nc),YY(nc),'o')
        nextpoint = nextpoint + 1;
        nc = nc + 1;
    end
    run = run + dp(t(i));
end
axis equal

R = zeros(1,n-1);
for i = 1:n-1
    R(i) = sqrt((XX(i+1)-XX(i))^2+(YY(i+1)-YY(i))^2)
end