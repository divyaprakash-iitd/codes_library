clear; clc; close all;

% Description: Solve a system of equations using simulink and setting the
% parameters from a m-script file.

%% Define parameters
C1 = 0.5;
C2 = 0.8;
F = 20;
m = 2;
startTime = 0;
stopTime = Inf;
stepSize = 0.001;
tolerance = 1e-14;

%% Set parameters
set_param('hydroplane/Cd1','Gain',num2str(C1))
set_param('hydroplane/Cd2','Gain',num2str(C2))
set_param('hydroplane/Force','Value',num2str(F))
set_param('hydroplane/1ByMass','Gain',num2str(1/m))
set_param('hydroplane/Tolerance','Value',num2str(tolerance))

%% Simulate and plot the results
out = sim('hydroplane','StartTime',num2str(startTime),'StopTime',num2str(stopTime),'FixedStep',num2str(stepSize));

subplot(1,2,1)
t = out.Velocity.Time;
V = out.Velocity.Data;
plot(t,V)
title('Velocity')
xlabel('Time')
ylabel('Velocity')

subplot(1,2,2)
t = out.Acceleration.Time;
A = out.Acceleration.Data;
plot(t,A)
title('Acceleration')
xlabel('Time')
ylabel('Acceleration')

sgtitle('Hydroplane Simulation')
