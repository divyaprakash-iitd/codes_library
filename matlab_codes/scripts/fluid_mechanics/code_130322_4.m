clear; clc; close all;

% Description: Calculates the friction factor using the Colebrook equation
% and the Newton-Rhapson method

fun = @(f,Re,D,epsilon) 1/sqrt(f) + 2*log10(epsilon/3.7/D + 2.51/Re/sqrt(f));

epsilon = 0.0015/1000; % [m]
g = 9.81; % [m/s^2]
rho = 1e3; % [kg/m^3]
mu = 1e-3; % [Ns/m^2]

N = 100;
Re = linspace(10e4,10e6,N);
D = linspace(10e-1,10,N);
fcol = zeros(size(Re));

x0 = 0.008;
tol = 1e-8;
for i = 1:N
    colefun = @(f) fun(f,Re(i),D(i),epsilon);
    [x,~] = newtons_diff(colefun,x0,tol);
    fcol(i) = x;
end

figure(1)
hold on
plot(Re,fcol,'--','DisplayName','Colebrook','LineWidth',4)
xlabel('Reynolds Number')
ylabel('Friction factor')

swameefun = @(Re,D,epsilon) 1.325./(log(epsilon./3.7./D + 5.74./Re.^0.9)).^2;

fswamee = swameefun(Re,D,epsilon);

plot(Re,fswamee','DisplayName','Swamee-Jain')
grid on
legend show


figure(2)
hold on
xlabel('Q [m^3/s]')
ylabel('\Delta{P}/L')

D = 2; % [m]
epsilon = 0.0015; %[m]

N = 100;
Q = linspace(0,10,N);
A = pi/4*D^2;
V = Q./A;
for i = 1:N
    Re = rho*V(i)*D/mu;
    f = swameefun(Re,D,epsilon);
    dpl = f*2*rho*Q(i)^2/pi^2/D^3;
    plot(Q(i),dpl,'r*')
end
grid on



function [x,CNT] = newtons_diff(y,x,tol)
	CNT = 0;
    h = 0.001;
	while abs(y(x)) > tol
        df = (y(x+h) - y(x-h))/2/h;
		x = x - y(x)./df;
		CNT = CNT + 1;
	end
end
