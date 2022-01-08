clear; clc; close all;

% Description: Ball throwing function

v = 60;          % Initial Velocity [m/s]
theta = 0:60;   % Angle [degrees]

nTheta = numel(theta);
R = zeros(1,nTheta);

for iTheta = 1:nTheta
    R(iTheta) = DTask1_f(v,theta(iTheta));
end

plot(theta,R)
xlabel('Initial angle (deg)')
ylabel('Distance thrown (m)')
legend(sprintf('v = %d m/s',v))

function distance = DTask1_f(v,theta)
    h = 1.2;                        % Initial height
    g = 9.81;                       % Acceleration due to gravity [m/s^2]
    vx = v*cosd(theta);             % Horizontal Velocity
    t = (v * sind(theta) + ...
        sqrt(((v * sind(theta))^2 ...
        + 2 * g * h))) / g;         % Time taken to hit ground
    
    tlim = 10;                      % Time limit
    if t > tlim
        fprintf('The ball does not hit the ground in %d seconds.\n',tlim)
        distance = NaN;
    else
        distance = vx * t;
    end
end