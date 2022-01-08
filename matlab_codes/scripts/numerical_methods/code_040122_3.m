clear; clc; close all;

% Description: Solve a system of IVPs using ode45

% Parameters
k1  = 1;
k2  = 2; 
k12 = 1;
m1  = 1;
m2  = 2;
c1  = 2;
c2  = 1;
l1  = 1;
l2  = 2;

% x(1) = x1, x(2) = dx1/dt, x(3) = x2, x(4) = dx2/dt
odefun = @(t,x) [x(2);
                 -k1/m1*x(1) + 2*pi*c1/m1/l1*sin(2*pi*x(1)/l1) - k12/m1*(x(1)-x(3));
                 x(4);
                 -k2/m2*x(3) + 2*pi*c2/m2/l2*sin(2*pi*x(3)/l2) + k12/m2*(x(1)-x(3))];
             
tspan = [0, 10];
x0 = [1 1 1 1];

[t,x] = ode45(odefun,tspan,x0);

figure(1)
yyaxis left
plot(t,x(:,1))
xlabel('Time')
ylabel('x_1')

yyaxis right
plot(t,x(:,3))
ylabel('x_2')
grid on

figure(2)
yyaxis left
plot(t,x(:,2))
xlabel('Time')
ylabel('$\dot{x_1}$','Interpreter','latex')

yyaxis right
plot(t,x(:,4))
ylabel('$\dot{x_2}$','Interpreter','latex')
grid on

figure(3)
yyaxis left
plot(t(1:end-1),diff(x(:,2))./diff(t))
xlabel('Time')
ylabel('$\ddot{x_1}$','Interpreter','latex')

yyaxis right
plot(t(1:end-1),diff(x(:,4))./diff(t))
ylabel('$\ddot{x_2}$','Interpreter','latex')
grid on

T = 1/2*m1*x(:,2).^2 + 1/2*m2*x(:,4).^2;
figure(4)
yyaxis left
plot(t,T)
xlabel('Time')
ylabel('Kinetic Energy')

U = 1/2*k12*(x(:,1)-x(:,3)).^2 + 1/2*k1*x(:,1).^2 + ...
    c1*cos(2*pi*x(:,1)/l1) + 1/2*k2*x(:,3).^2 + ...
    c2*cos(2*pi*x(:,3)/l2);

yyaxis right
plot(t,U)
ylabel('Potential Energy')
grid on

figure(5)
plot(t,T+U)
xlabel('Time')
ylabel('Total Energy')
grid on
