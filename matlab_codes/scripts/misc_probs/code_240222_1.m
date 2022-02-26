clear; clc; close all;

% Description: Plot a polynomial and its derivative

%p = @(x) x.^4 - 3*x.^3 - 5*x.^2 + 2*x + 20;

p = [1 -3 -5 2 20];

x = -2:3;
hold on
plot(x,polyval(p,x),'*')

fplot(@(x)polyval(p,x),[-2 3],'DisplayName',"p(x)")

set(gca,'XAxisLocation','origin')
set(gca,'YAxisLocation','origin')

dp = polyder(p);

fplot(@(x)polyval(dp,x),[-2 3],'--','DisplayName',"p'(x)")

proots = roots(dp);
plot(proots,polyval(dp,proots),'x')
disp('p is maximum at')
disp(proots(3))

disp('p is minimum at')
disp(proots(2))

disp('p is minimum at')
disp(proots(1))

ddp = polyder(dp);
fplot(@(x)polyval(ddp,x),[-2 3],'-.','DisplayName',"p''(x)")
xlabel('x')