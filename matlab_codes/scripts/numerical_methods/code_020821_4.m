clear; clc; close all;

% Description: Solve a BVP using shooting method, bisection method and RK4

% Let w=y(1) and z=y(2)

l = 94; % [cm]
T = 700; % [kg]
p = 110; % [kg/cm]
R = 50e6; % [kg.cm^2]

odefun = @(x,y) [y(2);
                 T*y(1)/R + p*x.*(x-l)/2/R];

xStart = 0; xEnd = l;
N = 1000;
yStart = 0; 
yEnd = 0;
h = 0.01;
initialGuess = 10;

a = 0.001; b = 1; tol = 1e-8; maxIter = 10000;
shootingGuess = bisection(@(guess) residual(odefun,[xStart xEnd],[yStart guess],yEnd,h),a,b,tol,maxIter);

% Shooting Method
[x,y] = RK4(odefun,[xStart xEnd],[yStart shootingGuess],h);

w = y(:,1);
z = y(:,2);

figure(2)
xlabel('x')
ylabel('y')
hold on
plot(x,w);

fprintf('w(l/2) = %.8f cm\n',w(x==l/2))

%% Helper Functions

function r = residual(odefun,tspan,IC,TN,h)
    [~,T] = RK4(odefun,tspan,IC,h);
    r = T(end,1) - TN;
end

function [c, iter] = bisection(f,a,b,tol,maxIter)
	c = mean([a,b]);
    err = 1;
	iter = 0;
	while ((iter < maxIter) && (err > tol))
		[a,b] = rootInterval(f,a,b,c);
		cold = mean([a,b]);
        err = abs(c-cold)/cold;
        c = cold;
		iter = iter + 1;
	end
end

function [a,b] = rootInterval(f,a,b,c)
	if f(a)*f(c) < 0
		b = c;
	else
		a = c;
	end
end

function [t,y] = RK4(fun,tspan,y0,dt)
    t           = tspan(1):dt:tspan(2);
    nt          = numel(t);
    y           = zeros(nt, numel(y0));
    y(1,:)      = y0;
    
    
    for i = 1:nt-1
        k1 = fun(t(i),y(i,:))';
        k2 = fun(t(i)+dt/2, y(i,:)+dt*k1/2)';
        k3 = fun(t(i)+dt/2, y(i,:)+dt*k2/2)';
        k4 = fun(t(i)+dt,y(i,:)+dt*k3)';
        
        y(i+1,:) = y(i,:) + 1/6*dt*(k1 + 2*k2 + 2*k3 + k4);
    end
end
