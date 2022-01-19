function d = projectile_distance(h0,v0,theta)
% projectile_distance: Calculates the horizontal distance traveled by 
% projectile
% d = projectile_distance(h0,v0,theta):
%   Calculates the horizontal distance traveled by a projectile before
%   hitting the ground
% Example:
%   theta       = 0:60;
%   h0          = 1.2;
%   v0          = 60;
%   hold on
%   for i = 1:numel(theta)
%        plot(theta(i),projectile_distance(h0,v0,theta(i)),'rx')
%   end
%   xlabel('\theta [^o]'); ylabel('Distance [m]')
% input: 
%   h0       = Initial height of the projectile
%   v0       = Initial velocity of the projectile
%   theta    = A vector containing the step sizes
% output:
%   d        = Horizontal distance travelled before hitting ground
%
% Author: Divyaprakash
%         Mechanical Engineer
% e-mail: divyaprakash.poddar@gmail.com
% Date  : 19 January 2022

    g   = 9.81;                        % Acceleration due to gravity [m/s^2]
    vx  = v0*cosd(theta);              % Horizontal Velocity
    t   = (v0 * sind(theta) + ...      % Time taken to hit ground
            sqrt(((v0 * sind(theta))^2 ...
            + 2 * g * h0))) / g;       

    d = vx * t;
end