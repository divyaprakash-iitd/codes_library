clear; clc; close all;

x = [0 0.15 0.31 0.5 0.6 0.75];
y = [1.0 1.004 1.031 1.117 1.223 1.422];

hold on
plot(x,y,'x','DisplayName','Data')

n   = 1000;
xq  = linspace(x(1),x(end),n);

% Degrees: 1
for n = 1:3
   fprintf('Polynomial Degree: %d\n',n)
   p   = polyfit(x,y,n);
   plot(xq,polyval(p,xq),'DisplayName',sprintf('N=%d',n));
   fprintf('Error\n')
   disp(y-polyval(p,x))
end

xlabel('x')
ylabel('y')
legend('Location','NorthWest')
