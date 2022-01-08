clear; clc; close all;

% Description: Solves an IVP using ode45 and draws the phase portraits with
% solutions

f = @(t,x,m,c,k) [x(2); 1/m*(-c*x(2) - k*x(1))];

tStart = 0; tEnd = 1;
x0 = 0; dx0 = 1;

P = [ 1   3   2;
     -1  -2  -2;
      1   0   2;
      1  -2   2;
      1  -3   2];

% Solve ODE
figure(1)
xlabel('t')
ylabel('x')
for i = 1:size(P,1)
    m = P(i,1); c = P(i,2); k = P(i,3);
    hold on
    fun = @(t,x) f(t,x,m,c,k);
    [t,x] = ode45(fun,[tStart tEnd],[x0 dx0]);
    plot(t,x(:,1),'-','DisplayName',sprintf('m=%2d,c=%2d,k=%2d',m,c,k))
end    
legend('location','northwest') 

% Draw Phase-Portraits
tStart = 0; tEnd = 5;
x0 = 0; dx0 = 1;
for i = 1:size(P,1)
    m = P(i,1); c = P(i,2); k = P(i,3);
    fig = figure(i+1);
    fig.CurrentAxes = odephaseportrait(f,m,c,k,tStart,tEnd,x0,dx0); 
    title(sprintf('m=%2d,c=%2d,k=%2d',m,c,k))
end  
  
  function axesF = odephaseportrait(f,m,c,k,tStart,tEnd,x0,dx0) 
    
    fun = @(t,x) f(t,x,m,c,k);
    
    % Solve ODE
    [t,x] = ode45(fun,[tStart tEnd],[x0 dx0]);
    
    % Phase Portrait
    x1 = linspace(min(x(:,1)),max(x(:,1)),20);
    x2 = linspace(min(x(:,2)),max(x(:,2)),20);

    [x1,x2] = meshgrid(x1,x2);

    u = zeros(size(x1));
    v = zeros(size(x1));

    for i = 1:numel(x1)
        Xprime = fun(t,[x1(i); x2(i)]);
        u(i) = Xprime(1);
        v(i) = Xprime(2);
    end
    
    un = u./sqrt(u.^2+v.^2);
    vn = v./sqrt(u.^2+v.^2);
    quiver(x1,x2,un,vn,'AutoScaleFactor',0.5,'showArrowHead','off'); figure(gcf)
    xlabel('x_1')
    ylabel('x_2')
    axis tight equal;
    
    % Plotting solutions on the vector field
    hold on
    [~,ys] = ode45(fun,[tStart tEnd],[x0 dx0]);
    plot(ys(:,1),ys(:,2))
    plot(ys(1,1),ys(1,2),'bo') % starting point
    plot(ys(end,1),ys(end,2),'ks') % ending point
    hold off
    axesF = gca;
  end