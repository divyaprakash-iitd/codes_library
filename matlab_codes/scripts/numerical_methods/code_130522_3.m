clear; clc; close all;

% Description: Fits a polynomial to the given data

% x = [0 1.5 2.4 4.2 5.1 7.5 9.6 11.9 12.2 15.3];
% y = [-25 -15.2 -4.6 1.2 5.2 6.9 8.3 9.4 10.5 13.2];
x = [-2 -1 0 1 2 3];
y = [-5.8 -5.3 0.2 3.2 15 25];

figure(1)
scatter(x,y,'DisplayName','Data')
xlabel('Height [m]')
ylabel('Temperature [^oC]')
grid on
hold on
legend('Location','northwest')

figure(2)
xlabel('Height [m]')
ylabel('Absolute Error')
hold on
grid on
legend('Location','northwest')

% Query points
Nq = 100;
xq = linspace(x(1),x(end),Nq);

norder = [1,7];
for iorder = 1:numel(norder)
    figure(1)
    p = polyfit(x,y,norder(iorder));
    plot(xq,polyval(p,xq),'DisplayName',sprintf('n = %d',norder(iorder)))
    
    % Plot error function
    figure(2)
    yerror = abs(polyval(p,x)-y);
    plot(x,yerror,'-o','DisplayName',sprintf('n = %d',norder(iorder)))

    xu = 40;
    fprintf('%d order polynomial\n',norder(iorder))
    fprintf('The temperature in degrees Celsius at a height of %.2f m is: %.4f\n',xu,polyval(p,xu))
end

