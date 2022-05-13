clear; clc; close all;

% Description: Solves a numerical integration problem

rc = 0:6;
vc = [5,5,4.62,4.01,3.42,1.69,0];
rnc = rc(2:end);
vnc = vc(2:end);

scatter(rc,vc)
xlabel('Radius [in]')
ylabel('Velocity [ft/s]')

order = 2;
p = polyfit(rnc,vnc,order);

hold on
rncq = linspace(rnc(1),rnc(end),100);
plot(rncq,polyval(p,rncq))

% Evaluate by integrating the polynomial
p = [p, 0];
q = polyint(p);

d = 1; % [ft]
Ac = pi*d^2/4;
vc = vc(1);

Q1 = 2*pi*diff(polyval(q,[rnc(1),rnc(end)])) + vc*Ac;

% Evaluate using simpson's method
I = simpson13(vnc.*rnc,rnc(1),rnc(end));
Q2 = 2*pi*I + vc*Ac;

fprintf('Polynomial curve (order: %d): %.4f [ft^3/s]\n',order,Q1)
fprintf("Simpson's rule: %.4f [ft^3/s]\n",Q2)

function I = simpson13(f,a,b)
	n = numel(f)-1;
    h = (b-a)/n;
	I = h/3*(f(1) + 2*sum(f(3:2:n-1)) + 4*sum(f(2:2:n)) + f(n+1));
end