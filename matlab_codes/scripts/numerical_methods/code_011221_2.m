clear; clc; close all;

% Description: Plots the slope field

dydx = @(x,y) -y./x; 

fig = slope_field(dydx,[-10 10],[-10 10]);

y0 = 7;
xspan = [1.5 10];
[t,y] = ode45(dydx,xspan,y0);

hold on
plot(t,y(:,1),'Displayname','y_0=7')

legend('location','eastoutside')

function fig = slope_field(f,x_domain,y_domain)
    
    density = 20;
    color = 'k';
    width = 1.25;
    
    xmin = floor(x_domain(1));
    xmax = ceil(x_domain(2));
    ymin = floor(y_domain(1));
    ymax = ceil(y_domain(2));
    
    % creates mesh
    x = xmin:((xmax-xmin)/density):xmax;
    y = ymin:((xmax-xmin)/density):ymax;
    
    % length of lines
    L = 0.75*(xmax-xmin)/density;
    
    % initializes figure and sets axes limits
    fig = figure;
    axis equal;
    xlim([xmin-L/2,xmax+L/2]);
    ylim([ymin-L/2,ymax+L/2]);
    
    % plots lines (slopes)
    hold on;
    for i = 1:length(x)
        for j = 1:length(y)
            
            % initially assumes the slope will not be indeterminate
            indeterminate = false;
            % calculates slope and avoids division by 0 errors
            try
                slope = f(x(i),y(j));
            catch
                indeterminate = true;
            end
            % angle formed by slope
            if indeterminate
                angle = pi/2;
            else
                angle = atan(slope);
            end
            % calculates components of line
            dx = L*cos(angle)/2;
            dy = L*sin(angle)/2;
            % plots line (but only if slope is real)
            if isreal(slope)
                plot([x(i)-dx,x(i)+dx],[y(j)-dy,y(j)+dy],'color',color,...
                'linewidth',width,'Handlevisibility','off');
            end
            
        end
    end
    hold off;
end
