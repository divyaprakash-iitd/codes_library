clear; clc; close all;

% Description: cartesian coordinates from polar coordinates

theta = linspace(0,360,50);
rho = 0.005*theta/10;

theta_radians = deg2rad(theta);
s = polarplot(theta_radians,rho);

showxy(s)
datatip(s,'DataIndex',16) % You can also select the point on the plot

function [] = showxy(s)
    [x,y] = pol2cart(s.ThetaData,s.RData);
    s.DataTipTemplate.DataTipRows(1).Label = "x";
    s.DataTipTemplate.DataTipRows(2).Label = "y";
    dtRows = [dataTipTextRow("x",x),dataTipTextRow("y",y)];
    s.DataTipTemplate.DataTipRows = dtRows;
end
