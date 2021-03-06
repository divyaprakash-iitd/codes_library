clear; clc; close all;

global M m r k phi

% Take user input
M = input('Mass of cart(kg): ');
m = input('Mass of bob (kg): ');
r = input('Length of pendulum (m): ');
k = input('Stiffness of spring (N/m): ');
phi = deg2rad(input('Angle of ramp from horizontal (degrees): '));
s0 = input('Initial condition, s (m): ');
sdot0 = input('Initial condition, s_dot (m): ');
theta0 = input('Initial condition theta (degrees): ');
thetadot0 = input('Initial condition theta_dot (degrees): ');
tanimation = input('Animation time (sec): ');

tspan = [0 10];
y0 = [s0 ; sdot0; deg2rad(theta0); deg2rad(thetadot0)];
[t, y] = ode45(@ProjODEs,tspan,y0);

yyaxis left
plot(t,y(:,1))
xlabel('t (s)')
ylabel('s (m)')

yyaxis right
plot(t,rad2deg(y(:,3)))
ylabel('\theta (^o)')

title(sprintf('M = %d kg, m = %d kg, r = %d m, k = %d N/m, %c = %d ^o, s_0 = %d m, %c_0 = %d ^o\n',M,m,r,k,981,rad2deg(phi),s0,952,theta0))
grid on

function dydt = ProjODEs(t,y) 
% y(1) is s, y(2) is s dot, y(3) is theta, y(4) is theta dot 
g = 9.8; % g is gravity 
global M m r k phi 
% M is mass of cart, m is mass of bob, r is length of pendulum, 
% k is stiffness of spring, phi is angle of ramp from horizontal. 
% These variables should be set as global variables and used in the 
% following equations. 
% The reason is their values should be defined from the main script and 
% entered from the command window, but not be assigned the values in this 
% function script. 
% So, in the main script, these variables should be also set as 
% global variables. 

dydt(1) = y(2); 
dydt(2) = -(m*r*sin(phi-y(3)).*y(4).^2+k*y(1)+(g*m*sin(phi))/2+... 
    (g*m*sin(phi-2*y(3)))/2+M*g*sin(phi))./(M+m-m*cos(phi-y(3)).^2); 
dydt(3) = y(4); dydt(4) = (m*r*sin(2*phi-2*y(3)).*y(4).^2-g*m*sin(y(3))+2*k*y(1).*... 
    cos(phi-y(3))+M*g*sin(2*phi-y(3))+g*m*sin(2*phi-y(3))-M*9*... 
    sin(y(3)))./(r*(2*M+m-m*cos(2*phi-2*y(3)))); 
dydt=dydt'; 
end 