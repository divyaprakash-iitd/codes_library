clear; clc; close all;

% Description: Solves a Radiation Heat Transfer Problem using
% False-Position Method

sigma   = 5.6703e-8;    % [W/m^2/K^4]
Ah      = 2;            % [m^2]
Tc      = 273;          % [K]
e       = 0.64;

q = @(Th) e*sigma.*(Th.^4 - Tc.^4).*Ah; % [W]

Th = 273:1:400;
plot(Th,q(Th))  