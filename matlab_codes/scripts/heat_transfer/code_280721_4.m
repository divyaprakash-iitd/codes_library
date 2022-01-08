clear; clc; close all;

% Description: Solves a radial heat transfer problem.

ro      = 0.5;      % [m]
rho     = 8933;     % [kg/m^3]
c       = 385;      % [J/kg/K]
k       = 401;      % [W/m/K]
qdot    = 400e3;    % [W/m^3]
Ti      = 330;      % [K]
Tinf    = 300;      % [K]
h       = 20;       % [W/m/K]

alpha = k/rho/c;

dr = 0.001;
dt = 0.00001;

rStart  = 0;
rEnd    = ro;
r       = rStart:dr:rEnd;
nr      = numel(r);

tStart  = 0;
tEnd    = 0.00002;
t       = tStart:dt:tEnd;
nt      = numel(t);

T = zeros(nt,nr);

% Initial Condition
T(1,:) = Ti;

for it = 1:nt-1
    for ir = 1:nr
        if ir == 1    
            T(it+1,ir) = T(it,ir) + alpha*dt*(-2*T(it,ir)/dr^2) + alpha*dt/k*qdot;
        elseif ir == nr
            TNplus2 = T(it,ir-1) - 2*h*dr/k*(T(it,ir) - Tinf);
            T(it+1,ir) = T(it,ir) + ... 
                        alpha*dt/r(ir) * ( (TNplus2 - T(it,ir-1))/2/dr + r(ir)*(TNplus2-2*T(it,ir)+T(it,ir-1))/dr^2 ) ...
                        + alpha*dt/k*qdot;
        else
            T(it+1,ir) = T(it,ir) + ... 
                        alpha*dt/r(ir) * ( (T(it,ir+1) - T(it,ir-1))/2/dr + r(ir)*(T(it,ir+1)-2*T(it,ir)+T(it,ir-1))/dr^2 ) ...
                        + alpha*dt/k*qdot;
        end
    end
end


