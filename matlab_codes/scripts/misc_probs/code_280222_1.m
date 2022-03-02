clear; clc; close all;

% Description: Calculates PDEs

syms f(x,y)

f = x^2*sin(y) + y^2*cos(x)
fx = diff(f,x)
fy = diff(f,y)
fxx = diff(fx,x)
fyy = diff(fy,y)
fxy = diff(fx,y)
fyx = diff(fy,x)

f = (y/x)*log(x)
fx = diff(f,x)
fy = diff(f,y)
fxx = diff(fx,x)
fyy = diff(fy,y)
fxy = diff(fx,y)
fyx = diff(fy,x)