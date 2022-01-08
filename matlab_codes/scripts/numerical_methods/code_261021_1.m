clear; clc; close all;

% Description: Numerical integration

s = @(t) 110*(t./(5+t)).*exp(-0.8*t/8);

t0 = 0; tn = 30; 
nt = 100;
t = linspace(t0,tn,nt);

plot(t,s(t))
xlabel('time (s)')
ylabel('Speed(mph)')

title('Offroad Bike - Speed(mph) vs. Time(s)')
grid on

nt = 10;
err = 1;
tol = 0.0000002;
Iold = 0;
i = 1;

I = simpson13(s,t0,tn,nt);


% Simpson's rule
function I = simpson13(f,a,b,n)
	h = (b-a)/n;
	x = a:h:b;
	I = h/3*(f(x(1)) + 2*sum(f(x(3:2:n-1))) + 4*sum(f(x(2:2:n))) + f(x(n+1)));
end

