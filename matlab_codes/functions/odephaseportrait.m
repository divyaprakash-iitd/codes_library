function axesF = odephaseportrait(fun,tStart,tEnd,x0,dx0)
% odephaseportrait: Draws a 2D phase portrait of a given system of 2 ODEs
% axesF = odephaseportrait(f,m,c,k,tStart,tEnd,x0,dx0):
%   Solves the given IVP ODE45 and draws the two-dimensional phase portrait 
%   along with the solution for a given set of initial conditions.
%   
% input: 
%   fun     = fun is a function handle. For a scalar t and a vector y, 
%             fun(t,y) must return a column vector corresponding to f(t,y).
%   tStart  = Start time
%   tEnd    = End time
%
%   x0      = Intial value of x at t0
%   dx0     = Intial value of dx/dt at t0
% output:
%   axesF   = Axes containing the phase portrait
%
% Author: Divyaprakash
%         Mechanical Engineer
% e-mail: divyaprakash.poddar@gmail.com
% Date  : 25 July 2021
    
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
    quiver(x1,x2,un,vn,'AutoScaleFactor',0.5,'showArrowHead','off','handleVisibility','off'); 
    xlabel('x_1')
    ylabel('x_2')
    axis tight;
    axis equal;
    
    % Plotting solutions on the vector field
    hold on
    [~,yq] = ode45(fun,[tStart tEnd],[x0 dx0]);
    plot(yq(:,1),yq(:,2),'handleVisibility','off')
    plot(yq(1,1),yq(1,2),'bo','DisplayName','Start')      % starting point
    plot(yq(end,1),yq(end,2),'ks','DisplayName','End')  % ending point
    hold off
    axesF = gca;
  end