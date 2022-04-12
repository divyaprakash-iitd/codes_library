clear; clc; close all;

% Description: Plots the mode shapes

l = 1;
x = linspace(0,l,100);

mfun = @(lamdan,z) sinh(lamdan.*z) - sin(lamdan.*z) - ...
             (sinh(lamdan)+sin(lamdan))./(cosh(lamdan)+cos(lamdan)) .* ...
             (cosh(lamdan.*z)-cos(lamdan.*z));
z = x/l;


fun = @(x) cos(x) + 1./cosh(x);
figure(1)
fplot(fun,[0,10])
set(gca,'xaxislocation','origin')
set(gca,'yaxislocation','origin')
title("First three roots")

figure(2)
hold on
for g = [2,4,8]
    lamdan = fzero(fun,g);   
    plot(z,mfun(lamdan,z),'DisplayName',sprintf('%c_n = %.4f',955,lamdan))
    set(gca,'xaxislocation','origin')
    set(gca,'yaxislocation','origin')
    title("Mode shapes")
end
legend('Location','northwest')