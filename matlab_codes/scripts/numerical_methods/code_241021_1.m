clear; clc; close all;

% Description: Solves an integration problem using numerical methods

syms x

f = cos(x)^2;
a = 0; b = 2*pi/3;

Ian = double(int(f,a,b));

f = matlabFunction(f);

dx = [pi/3, pi/6, pi/12, pi/24];
nx = numel(dx);

EIS = zeros(1,nx);
EIR = zeros(1,nx);
EIT = zeros(1,nx);
EIC = zeros(1,nx);

for j = 1:nx
    x = a:dx(j):b;
    
    IS = simpson13(f,a,b,dx(j));
    EIS(j) = abs(IS-Ian);

    IR = rectangularI(f,a,b,dx(j));
    EIR(j) = abs(IR-Ian);
    
    IT = my_trapz(f,a,b,dx(j));
    EIT(j) = abs(IT-Ian);
    
    y = f(x);

    n = numel(x);
    IC = 0;
    for i = 1:n-1
        pp = spline([x(i), x(i+1)],[f(x(i)), f(x(i+1))]);
        IC = IC + integral(@(x) ppval(pp,x),x(i),x(i+1));
    end
    EIC(j) = abs(IC-Ian);
end

figure(1)
hold on
xlabel('dx')
ylabel('Error')
plot(dx,EIS,'-o','DisplayName',"Simpson's(1/3)")
plot(dx,EIT,'-^','DisplayName',"Trapezoidal")
plot(dx,EIR,'-*','DisplayName',"Rectangular")
plot(dx,EIC,'-*','DisplayName',"Cubic Spline")
set(gca,'xScale','log')
set(gca,'yScale','log')
legend('Location','SouthEast')
grid on

% Rectangular rule
function I = rectangularI(f,a,b,h)
    x = a:h:b;
    n = numel(x);
    I = 0;
    for i = 1:n-1
        I = I + f(x(i))*h;
    end
end

% Trapezoidal rule
function I = my_trapz(f,a,b,h)
  x = a:h:b;
  I = h/2*(f(x(1)) + 2*sum(f(x(2:end-1))) + f(x(end)));
end

% Simpson's rule
function I = simpson13(f,a,b,h)
	%h = (b-a)/n;
	x = a:h:b;
    n = numel(x)-1;
	I = h/3*(f(x(1)) + 2*sum(f(x(3:2:n-1))) + 4*sum(f(x(2:2:n))) + f(x(n+1)));
end
