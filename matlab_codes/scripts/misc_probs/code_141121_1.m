clear; clc; close all;

% Description: Polynomial appoximation
a = 0;
b = 14;
S = zeros(1,10);
for i = 1:10
    S(i) = i^4 + (b-a)*rand(1,1) + a;
end

T = 11:20;

p = polyfit(T,S,3);

hold on
plot(T,S,'o','DisplayName','Experimental')

Nq = 100;
Tq = linspace(T(1),T(end),Nq);
plot(Tq,polyval(p,Tq),'DisplayName','Approximation')
xlabel('T')clear; clc; close all;

% Description: Polynomial appoximation
a = 0;
b = 14;
S = zeros(1,10);
for i = 1:10
    S(i) = i^4 + (b-a)*rand(1,1) + a;
end

T = 11:20;

p = polyfit(T,S,3);

hold on
plot(T,S,'o','DisplayName','Experimental')

Nq = 100;
Tq = linspace(T(1),T(end),Nq);
plot(Tq,polyval(p,Tq),'DisplayName','Approximation')
xlabel('T')
ylabel('S')
grid on
legend('location','northwest')
ylabel('S')
grid on
legend('location','northwest')