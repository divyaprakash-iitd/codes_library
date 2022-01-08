clear; clc; close all;

% Description: Plots inequalities to determine corner points with
% annotations

y1 = @(x) 1/14*(1120 - 12*x);
y2 = @(x) 1/14*(420 - 2*x);
y3 = @(x) 0*x;
y4 = @(y) 0*y;

x = linspace(0,100,100);

plot(x,y1(x),'linewidth',2,'DisplayName','12x+14y=1120')
hold on
plot(x,y2(x),'linewidth',2,'DisplayName','2x+14y=420')
plot(x,y3(x),'linewidth',2,'DisplayName','y=0')
plot([0 0],[0 100],'linewidth',2,'DisplayName','x=0')
set(gca,'xaxislocation','origin')
legend show
plot(70,20,'k*','linewidth',2,'handlevisibility','off')
dim = [65/100 20/120 .3 .3];
str = '(70,20)';
annotation('textbox',dim,'String',str,'FitBoxToText','on','edgecolor','none','Backgroundcolor','none');

plot(93.333,0,'k*','linewidth',2,'handlevisibility','off')
dim = [70/100 0/120 .3 .3];
str = '(93.333,0)';
annotation('textbox',dim,'String',str,'FitBoxToText','on','edgecolor','none','Backgroundcolor','none');


plot(0,30,'k*','linewidth',2,'handlevisibility','off')
dim = [12/100 24/120 .3 .3];
str = '(0,30)';
annotation('textbox',dim,'String',str,'FitBoxToText','on','edgecolor','none','Backgroundcolor','none');

plot(0,0,'k*','linewidth',2,'handlevisibility','off')
dim = [12/100 0/120 .3 .3];
str = '(0,0)';
annotation('textbox',dim,'String',str,'FitBoxToText','on','edgecolor','none','Backgroundcolor','none');

