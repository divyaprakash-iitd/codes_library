clear; clc; close all;

% Description: Solves a system of ODE corresponding to the rise of a hot
% air balloon.

% Data
rhoa    = 1.2;          % [kg/m^3]
mp      = 265;          % [kg]
P       = 101300;       % [Pa]
R       = 287;          % [J/kg/K]
T       = 100+273.15;    % [K]
d       = 17.3;         % [m]
r       = d/2;          % [m]
g       = 9.81;         % [m/s^2]
cd      = 0.47;

% Ballon
A       = pi*r^2;
V       = 4/3*pi*r^3;

% Force due to gas (Fg)
rhog    = P/R/T;
mg      = rhog*V;
Fg      = mg*g;

% Buoyancy force (Fb)
Fb      = rhoa*V*g;

% Payload force (Fp)
Fp      = mp*g;

% Total mass
m = mg + mp;

odefun = @(t,z) [z(2); 
                 -1/m*(Fg + Fp - Fb + 1/2*rhoa*A*cd*z(2)^2)];

             
% Initial conditions
z0 = 0; v0 = 0; 

tspan = [0 1.6 3.2 28.8 56 60];
[t,z] = ode45(odefun,[0 60],[z0 v0]);

% Tabulate the data
fprintf('    t(s)        v(m/s)      z(m)\n');
fprintf('--------------------------------\n')
for i = 1:numel(tspan)
        fprintf('%8.4f    %8.4f     %8.4f\n',tspan(i),interp1(t,z(:,2),tspan(i)),interp1(t,z(:,1),tspan(i)));
end

figure(1)
hold on
[t,z] = ode45(odefun,[0 60],[z0 v0]);
yyaxis left
plot(t,z(:,1))
ylabel('z [m]')
yyaxis right
plot(t,z(:,2))
ylabel('v [m/s]')
xlabel('t [s]')