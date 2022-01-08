clear; clc; close all;

% Description: Solves a integral using Gaussian Quadrature

fun = @(x) (x+1)./(x.^3-x.^2+2*x-2clear; clc; close all;

% Description: Solves a integral using Gaussian Quadrature

fun = @(x) (x+1)./(x.^3-x.^2+2*x-2);

% Two-points
x = [-1/sqrt(3), 1/sqrt(3)];
c = [1, 1];
a = 1;
b = 6;
tildec = (b-a)/2*c;
tildex = (b-a)/2*x + (b+a)/2;
f = fun(tildex);
value = sum(tildec.*f)

% Four-points
x = [-sqrt(3/7+2/7*sqrt(6/5)), -sqrt(3/7-2/7*sqrt(6/5)), sqrt(3/7-2/7*sqrt(6/5)), sqrt(3/7+2/7*sqrt(6/5))];
c = [(18-sqrt(30))/36,(18+sqrt(30))/36,(18+sqrt(30))/36, (18-sqrt(30))/36];
a = 1;
b = 6;
tildec = (b-a)/2*c;
tildex = (b-a)/2*x + (b+a)/2;
f = fun(tildex);
value = sum(tildec.*f)
);

% Two-points
x = [-1/sqrt(3), 1/sqrt(3)];
c = [1, 1];
a = 1;
b = 6;
tildec = (b-a)/2*c;
tildex = (b-a)/2*x + (b+a)/2;
f = fun(tildex);
value = sum(tildec.*f)

% Four-points
x = [-sqrt(3/7+2/7*sqrt(6/5)), -sqrt(3/7-2/7*sqrt(6/5)), sqrt(3/7-2/7*sqrt(6/5)), sqrt(3/7+2/7*sqrt(6/5))];
c = [(18-sqrt(30))/36,(18+sqrt(30))/36,(18+sqrt(30))/36, (18-sqrt(30))/36];
a = 1;
b = 6;
tildec = (b-a)/2*c;
tildex = (b-a)/2*x + (b+a)/2;
f = fun(tildex);
value = sum(tildec.*f)
