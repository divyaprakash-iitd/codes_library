clear; clc; close all;

% Description: Solves a second order ode describing the motion of mass
% attched to a spring using the Runge-Kutta 4th order method. 

% Input parameters
ti = 0; tf = 0.1; h = 0.0001;

Li = 0.5; Lf = 0.7;
m = 2; F = 25.6; 
c = F/(Lf-Li);

% ode45
odefun = @(t,x) [x(2); -c*x(1)/m];

[t,y] = ode45(odefun,[ti tf],[0.7 0]);
figure(1)
hold on
plot(t,y(:,1),'linewidth',2,'DisplayName','ode45')
figure(2)
hold on
plot(t,y(:,2),'linewidth',2,'DisplayName','ode45')

% RK4
t    = ti:h:tf;
nt   = numel(t);
x1    = zeros(1,nt);
x2    = zeros(1,nt);
x1(1) = Lf;
x2(1) = 0;
    
fun1 = @(t,x) x;
fun2 = @(t,x) -c*x/m;

for i = 1:nt-1
    k1 = fun1(t(i),x2(i));
    k2 = fun1(t(i)+h/2, x2(i)+h*k1/2);
    k3 = fun1(t(i)+h/2, x2(i)+h*k2/2);
    k4 = fun1(t(i)+h,x2(i)+h*k3);

    x1(i+1) = x1(i) + 1/6*h*(k1 + 2*k2 + 2*k3 + k4);
    
    k1 = fun2(t(i),x1(i));
    k2 = fun2(t(i)+h/2, x1(i)+h*k1/2);
    k3 = fun2(t(i)+h/2, x1(i)+h*k2/2);
    k4 = fun2(t(i)+h,x1(i)+h*k3);

    x2(i+1) = x2(i) + 1/6*h*(k1 + 2*k2 + 2*k3 + k4);
end

figure(1)
plot(t,x1,'--','linewidth',2,'DisplayName','RK4')
xlabel('t')
ylabel('x_1')
legend('location','north')

figure(2)
plot(t,x2,'--','linewidth',2,'DisplayName','RK4')
xlabel('t')
ylabel('x_2')
legend('location','north')

fprintf('Displacement at t = %.2f s: %.4f m\n',t(end),x1(end))
fprintf('Velocity at t = %.2f s: %.4f m/s\n',t(end),x2(end))