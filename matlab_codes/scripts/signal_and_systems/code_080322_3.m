clear; clc; close all;

% Description: Plots the step, impulse response as well as a time response
% of an input square wave of a transfer function

sys = tf(16,[1 3 16]);

% Step response
figure(1)
subplot(3,1,1)
step(sys)

% Impulse response
subplot(3,1,2)
impulse(sys)

% Input square wave
t = 0:0.001:10;
f = square(pi/4*t); % Period of 8 seconds
figure(2)
plot(t,f)

% Square wave response
figure(1)
subplot(3,1,3)
lsim(sys,f,t)
