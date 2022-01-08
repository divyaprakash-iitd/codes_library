clear; clc; close all;

% Description: Solves a spring mass damper system with finite difference
% method and using the built-in ode45 function.

m = 50;
k = 100;
c = 12;

dt = 0.0001;
t = 0:dt:15;
nt = numel(t);

x1 = zeros(1,nt);
x2 = zeros(1,nt);

x1(1) = 1;
x2(1) = 0;

for n = 1:nt-1
    x1(n+1) = x1(n) + x2(n)*dt;
    x2(n+1) = x2(n) - dt/m*(k*x1(n)+c*x2(n));
end

yyaxis left
plot(t,x1,'DisplayName','Finite Difference Method')
xlabel('t')
ylabel('x_1')

yyaxis right
plot(t,x2,'DisplayName','Finite Difference Method')
ylabel('x_2')

odefun = @(t,x) [x(2);
                 1/m*(- c*x(2) - k*x(1))];
[t,y] = ode45(odefun,[0 15],[1 0]);

yyaxis left
hold on
plot(t,y(:,1),'o','DisplayName','ode45')

yyaxis right
hold on
plot(t,y(:,2),'o','DisplayName','ode45')
legend('location','southeast')
grid on
ylabel('x_1')

yyaxis right
plot(t,x2,'DisplayName','Finite Difference Method')
ylabel('x_2')

odefun = @(t,x) [x(2);
                 1/m*(- c*x(2) - k*x(1))];
[t,y] = ode45(odefun,[0 15],[1 0]);

yyaxis left
hold on
plot(t,y(:,1),'o','DisplayName','ode45')

yyaxis right
hold on
plot(t,y(:,2),'o','DisplayName','ode45')
legend('location','southeast')
grid on