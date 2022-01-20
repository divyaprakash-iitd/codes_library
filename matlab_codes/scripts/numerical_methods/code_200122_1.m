clear; clc; close all;

% Description: Calculates integral using Simpson, Trapezoidal and Mid-point
% rule

f = @(x) sqrt(2*x);
a = 0;
b = 10;

n = 5;
fprintf('\n n = %d \n',n)
I = simpson13(f,a,b,n);
fprintf("Simpson's 1/3: %.f\n",I)

I = my_trapz(f,a,b,n);
fprintf("Trapezoidal: %.f\n",I)

I = mid_point(f,a,b,n);
fprintf("Mid-point: %.f\n",I)



Itrue   = integral(f,a,b);
n       = 1:20;
abserr  = zeros(numel(n),3);

for i = 1:numel(n)
    abserr(i,1) = abs(Itrue-simpson13(f,a,b,n(i)));
    abserr(i,2) = abs(Itrue-my_trapz(f,a,b,n(i)));
    abserr(i,3) = abs(Itrue-mid_point(f,a,b,n(i)));
end

figure(1)
hold on
plot(n,abserr(:,1),'DisplayName',"Simpson's 1/3")
plot(n,abserr(:,2),'DisplayName',"Trapezoidal")
plot(n,abserr(:,3),'DisplayName',"Mid-point")
grid on
legend show

n = 20;
fprintf('\n n = %d \n',n)
tic
I = simpson13(f,a,b,n);
fprintf("Simpson's 1/3: %.f\n",I)
toc

tic
I = my_trapz(f,a,b,n);
fprintf("Trapezoidal: %.f\n",I)
toc

tic
I = mid_point(f,a,b,n);
fprintf("Mid-point: %.f\n",I)
toc


%% Functions
% Simpson's rule
function I = simpson13(f,a,b,n)
	h = (b-a)/n;
	x = a:h:b;
	I = h/3*(f(x(1)) + 2*sum(f(x(3:2:n-1))) + 4*sum(f(x(2:2:n))) + f(x(n+1)));
end

% Trapezoidal rule
function I = my_trapz(f,a,b,N)
  dx = (b-a)/N;
  x = a:dx:b;
  I = dx/2*(f(x(1)) + 2*sum(f(x(2:end-1))) + f(x(end)));
end

% Mid-point rule
function I = mid_point(f,a,b,n)
    dx = (b-a)/n;
    c = (a+dx/2):dx:(b-dx/2);
    I = sum(dx*f(c));
end