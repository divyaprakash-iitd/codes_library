clear; clc; close all;

% Description: Calculates Velocity and acceleration from the input file.
data = load('A1_input.txt');

t = data(:,1);
p1x = data(:,2);
p1y = data(:,3);
p2x = data(:,4);
p2y = data(:,5);
p3x = data(:,6);
p3y = data(:,7);

% Particle # 1
[v1x,v1y,a1x,a1y] = velocityandacceleration(t,p1x,p1y);

% Particle # 2
[v2x,v2y,a2x,a2y] = velocityandacceleration(t,p2x,p2y);

% Particle # 3
[v3x,v3y,a3x,a3y] = velocityandacceleration(t,p3x,p3y);

function [vx,vy,ax,ay] = velocityandacceleration(t,px,py)
    vx = zeros(size(t));
    vy = zeros(size(t));
    ax = zeros(size(t));
    ay = zeros(size(t));


    vx(1) = (px(1)-px(end-1))./(t(end)-t(end-1));
    vy(1) = (py(1)-py(end-1))./(t(end)-t(end-1));

    vx(2:end) = (px(2:end)-px(1:end-1))./(t(2:end)-t(1:end-1));
    vy(2:end) = (py(2:end)-py(1:end-1))./(t(2:end)-t(1:end-1));

    ax(1) = (vx(1)-vx(end-1))./(t(end)-t(end-1));
    ay(1) = (vy(1)-vy(end-1))./(t(end)-t(end-1));

    ax(2:end) = (vx(2:end)-vx(1:end-1))./(t(2:end)-t(1:end-1));
    ay(2:end) = (vy(2:end)-vy(1:end-1))./(t(2:end)-t(1:end-1));
end