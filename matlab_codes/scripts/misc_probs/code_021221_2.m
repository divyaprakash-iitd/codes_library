clear; clc; close all;

% Description: Fit a curve to the given data

Y = 1790:10:2010;
P = [3.929 5.308 7.240 9.638 12.866 17.069 23.192 31.443 39.818 50.189 62.980 76.212 92.228 106.022 123.203 132.165 151.326 179.323 203.302 226.542 248.718 281.425 308.746];
pfun = @(t) 0.00676*t.^2 - 0.1280*t;

t = 0:220;
clear; clc; close all;

% Description: Fit a curve to the given data

Y = 1790:10:2010;
P = [3.929 5.308 7.240 9.638 12.866 17.069 23.192 31.443 39.818 50.189 62.980 76.212 92.228 106.022 123.203 132.165 151.326 179.323 203.302 226.542 248.718 281.425 308.746];
pfun = @(t) 0.00676*t.^2 - 0.1280*t;

t = 0:220;

plot(t+1790,pfun(t),'DisplayName','Data')
hold on
plot(Y,P,'o','DisplayName','Model')

xlabel('Year')
ylabel('Population/mi^2')

legend('location','northwest')
grid on


fprintf('Population: 50 Million: %4.0f\n',1790+fzero(@(t) pfun(t)-50,100))
fprintf('Population: 100 Million: %4.0f\n',1790+fzero(@(t) pfun(t)-100,100))
fprintf('Population: 200 Million: %4.0f\n',1790+fzero(@(t) pfun(t)-200,100))

fprintf('The population will exceed 300 Million by %4.0f\n',1790+fzero(@(t) pfun(t)-330,100))
plot(t+1790,pfun(t),'DisplayName','Data')
hold on
plot(Y,P,'o','DisplayName','Model')

xlabel('Year')
ylabel('Population/mi^2')

legend('location','northwest')
grid on


fprintf('Population: 50 Million: %4.0f\n',1790+fzero(@(t) pfun(t)-50,100))
fprintf('Population: 100 Million: %4.0f\n',1790+fzero(@(t) pfun(t)-100,100))
fprintf('Population: 200 Million: %4.0f\n',1790+fzero(@(t) pfun(t)-200,100))

fprintf('The population will exceed 300 Million by %4.0f\n',1790+fzero(@(t) pfun(t)-330,100))