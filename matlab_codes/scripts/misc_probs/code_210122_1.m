clear; clc; close all;

% Description: Solves for the trajectory of a bouncing ball subjected to
% drag force

% Constants
g   = 9.81;
dt  = 0.001;
b   = 0.4;
H   = 0.305;
COR = 0.935;

t = [];
h = [];
v = [];
t(1) = 0;
h(1) = H;
v(1) = 0;
a(1) = -g-b*v(1);

i = 1;
for nbounce = 1:3
    while h(i) >= 0
        t(i+1) = t(i)+dt;
        a(i+1) = -g-b*v(i);
        v(i+1) = v(i)+a(i)*dt;
        h(i+1) = h(i)+v(i)*dt;
        i = i+1;
    end

    t(i) = []; v(i) = []; h(i) = [];
    i = i-1;
    v(i) = -COR*v(i);
end

plot(t,h)
xlabel('Time')
ylabel('Height')
grid on