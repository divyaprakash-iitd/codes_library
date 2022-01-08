clear; clc; close all;

% Description: Fits a line

A = [5628 7043 8912 9117 9741];
n = [13581 15902 19873 21683 22705];

scatter(A,n)

p = polyfit(A,n,1);
fprintf('The equation of the line is: n = %.4fA + %.4f\n',p(1),p(2))

Aq = linspace(A(1),A(end),1000clear; clc; close all;

% Description: Fits a line

A = [5628 7043 8912 9117 9741];
n = [13581 15902 19873 21683 22705];

scatter(A,n)

p = polyfit(A,n,1);
fprintf('The equation of the line is: n = %.4fA + %.4f\n',p(1),p(2))

Aq = linspace(A(1),A(end),1000);
hold on
plot(Aq,polyval(p,Aq))
grid on
xlabel('A')
ylabel('n')

);
hold on
plot(Aq,polyval(p,Aq))
grid on
xlabel('A')
ylabel('n')

