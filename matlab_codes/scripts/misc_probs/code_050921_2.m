clear; clc; close all;

% Description: Plots equations for an Einstein solid.

cvByNk = @(x) x.^2.*exp(x)./(exp(x)-1).^2;

x = linspace(0,4,1000);

plot(x,cvByNk(1./x),'DisplayName','C_v')

cvByNk = @(x) x.^2.*exp(-x);

hold on
plot(x,cvByNk(1./x),'DisplayName','C_v low temp limit')

cvByNk = @(x) x*0+1;

plot(x,cvByNk(1./x),'DisplayName','C_v high temp limit')

xlabel('kT/\epsilon')
ylabel('C_v/Nk')
grid on
legend show