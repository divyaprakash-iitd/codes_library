clear; clc; close all;

% Description: Fits a curve to the given data

f = @(x) 2.5*sin(2*pi/12.*(x-3.5)) + 12.5;

fplot(f,[1,12])

month = 1:12;
dayhours = [10,10.8,12.1,13.2,14.5,15,15,14,13.2,12.3,11.5,10.8];

hold on
scatter(month,dayhours,'DisplayName','Hillsborough California Data')
xlabel('Month')
ylabel('Daylight Hours')
legend('Location','south')
grid on

m = 3;
fprintf('Using the function, the daylight hour in the month no. %d is: %.1f\n',m,f(m))