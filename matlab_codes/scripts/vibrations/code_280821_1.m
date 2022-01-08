clear; clc; close all;

% Description: Solves a spring mass damper problem with user input.

u = 'placeholder';
while ~(strcmp(u,'SI') || strcmp(u,'FPS'))
    u = input('Units (SI or FPS?): ','s');
        if strcmp(u,'SI')
            g = 9.81;
        elseif strcmp(u,'FPS')
            g = 32.1740;
        end
end
m = input('Mass (M): ');
c = input('Damping Coefficient (C) [Default Value = 0]: ');
if isempty(c); c = 0; end
k = input('Spring Constant (K): ');
if isempty(k)
    L = input('Stretched Length (L): ');
    k = m*g/L;
end
x0 = input('Initial Displacement (y(0)) [Default Value = 0]: ');
if isempty(x0); x0 = 0; end
v0 = input("Initial Velocity (y'(0)) [Default Value = 0]: ");
if isempty(v0); v0 = 0; end

IC = [x0 v0];

% Question: 1
[d, wN,wD, A] = smdanalyze(m,c,k,IC);
EOM = smdanalytical(m,c,k,IC);

% Plot figures
x = matlabFunction(EOM);
v = matlabFunction(diff(EOM));

t = linspace(0,2*pi,1000);

yyaxis left
plot(t,x(t))
ylabel('Position')

yyaxis right
plot(t,v(t))
ylabel('Velocity')

xlabel('Time')

% Output
fprintf('\n----------------------------\n')
fprintf('Time period: %.4f\n',2*pi/wN)
fprintf('Frequency (Natural): %.4f\n',wN)
fprintf('Amplitude: %.4f\n',A)
fprintf('Position: x(t) = %s\n',char(EOM))
fprintf('Velocity: v(t) = %s\n',char(diff(EOM)))

function EOM = smdanalytical(m,c,k,IC)   
    % Formulate the governing equations
    syms x(t)
    Dx = diff(x,t,1);
    ode = m*diff(x,t,2) + c*diff(x,t,1) + k*x == 0;

    % Initial conditions
    cond1 = x(0)  == IC(1);
    cond2 = Dx(0) == IC(2);
    conds = [cond1 cond2];
    
    % Solve using dsolve
    xSol(t) = dsolve(ode,conds);
    digits(4)
    EOM = vpa(simplify(xSol));
end

function [d, wN,wD, A] = smdanalyze(m,c,k,IC)
    % Initial Conditions
    x0 = IC(1); dx0 = IC(2);
    % Reference: Mechanical Vibrations (Rao), Pg. No. 192
    
    zeta    = c/2/sqrt(m*k); % Damping ratio
    wN  = sqrt(k/m); % Natural frequency
    wD = sqrt(1-zeta^2)*wN; % Damped frequency
    A = sqrt(x0^2*wN^2 + dx0^2 + 2*x0*dx0*zeta*wN)/wD; % Amplitude
    
    if zeta < 1
        d = 'underdamped';
    elseif zeta > 1
        d = 'overdamped';
    else
        d = 'critically damped';
    end
end