clear; clc; close all;

% Description: Solves for rocket trajectory using numerical integration

g   = 9.81;      % [m/s^2]
u   = 1800;      % [m/s]
m0  = 160000;    % [kg]
q   = 2500;      % [kg/s]


v = @(t) u*log(m0./(m0-q*t)) -g*t;

a = 0;
b = 30;
fprintf('My Trapezoidal rule\n')
for n = 1:2:20
    I = my_trapz(v,a,b,n);
    fprintf('Height of rocket at t = %d seconds (n = %d):%f\n',b,n,I)
end

% Truncation error
figure(1)
xlabel('N')
ylabel('Truncation Error')
hold on
Ia = integral(v,a,b);
for n = 1:2:20
    I = my_trapz(v,a,b,n);
    te = abs(I-Ia);
    plot(n,te,'r*')
end
set(gca,'YScale', 'log')
grid on

fprintf('\nTrapz function\n')
for n = 2:2:20
    x = linspace(a,b,n);
    y = v(x);
    I = trapz(x,y);
    fprintf('Height of rocket at t = %d seconds (n = %d):%f\n',b,n,I)
end

fprintf("\nSimpson's rule\n")
for n = 2:2:20
    I = simpson13(v,a,b,n);
    fprintf('Height of rocket at t = %d seconds (n = %d):%f\n',b,n,I)
end

fprintf("\nSimpson's rule\n")
for n = [3 5 7]
    I = simpson13(v,a,b,n);
    fprintf('Height of rocket at t = %d seconds (n = %d):%f\n',b,n,I)
end

%% Helper functions

% My trapezoidal rule
function I = my_trapz(f,a,b,N)
  dx = (b-a)/N;
  x = a:dx:b;
  I = dx/2*(f(x(1)) + 2*sum(f(x(2:end-1))) + f(x(end)));
end


% Simpson's rule
function I = simpson13(f,a,b,n)
	h = (b-a)/n;
	x = a:h:b;
	I = h/3*(f(x(1)) + 2*sum(f(x(3:2:n-1))) + 4*sum(f(x(2:2:n))) + f(x(n+1)));
end


