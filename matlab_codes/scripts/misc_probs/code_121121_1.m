clear; clc; close all;

% Description: Solves an interpolation problem

Time = [2 1 6 4 5 3 9 8 7 0];
Deflection = [2.7 7.6 3.6 4.7 8.4 1.8 6.9 6 2.2 8.6];

% Sort the values
[T,I] = sort(Time);
D = Deflection(I);

% Use linear interpolation to find the values

figure(1)
plot(T,D,'o','DisplayName','Experimental')
Nq = 1000; % No. of query points
Tq = linspace(T(1),T(end),Nq);
hold on
plot(Tq,interp1(T,D,Tq,'linear'),'DisplayName','Approximation: Linear')
plot(Tq,interp1(T,D,Tq,'cubic'),'DisplayName','Approximation: Cubic')
xlabel('Time')
ylabel('Deflection')
grid on
legend show

Tq = 4.4;
fprintf('Deflection at %.1f (Linear interpolation): %.4f\n',Tq,interp1(T,D,Tq,'linear'))
fprintf('Deflection at %.1f (Cubic interpolation): %.4f\n',Tq,interp1(T,D,Tq,'cubic'))

