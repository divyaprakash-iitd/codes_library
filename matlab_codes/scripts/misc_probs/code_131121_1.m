clear; clc; close all;

% Description: Finds the trunction order.

f = @(x) x^5 + x^2 + x;
DF = @(x) 5*x^4 + 2*x + 1;
Nh = 100;
H = linspace(1e-3,1e-1,Nh);

for i = 1:Nh
    h = H(i);
    x = 5;
    
    x3 = x+3*h;
    x2 = x+2*h;
    x1 = x + h;

    df = (-f(x3) + 9*f(x1) - 8*f(x))/6/h;
    df1 = (f(x1)-f(x))/h;
    Err(i) = abs(DF(x)-df);
end

hold on
plot(H,Err,'k.','HandleVisibility','off')

for n = [1 2 3]
    p = polyfit(H,Err,n);
    plot(H,polyval(p,H),'DisplayName',sprintf('n = %d',n))
end 
set(gca,'xscale','log')
set(gca,'yscale','log')
legend('location','southeast')
grid onclear; clc; close all;

% Description: Finds the trunction order.

f = @(x) x^5 + x^2 + x;
DF = @(x) 5*x^4 + 2*x + 1;
Nh = 100;
H = linspace(1e-3,1e-1,Nh);

for i = 1:Nh
    h = H(i);
    x = 5;
    
    x3 = x+3*h;
    x2 = x+2*h;
    x1 = x + h;

    df = (-f(x3) + 9*f(x1) - 8*f(x))/6/h;
    df1 = (f(x1)-f(x))/h;
    Err(i) = abs(DF(x)-df);
end

hold on
plot(H,Err,'k.','HandleVisibility','off')

for n = [1 2 3]
    p = polyfit(H,Err,n);
    plot(H,polyval(p,H),'DisplayName',sprintf('n = %d',n))
end 
set(gca,'xscale','log')
set(gca,'yscale','log')
legend('location','southeast')
grid on





