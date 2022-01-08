clear; clc; close all;

% Description: Simulates the throwing of darts in a circle

r = 1;
theta = linspace(0,2*pi,1000);
x = r*cos(theta);
y = r*sin(theta);

% Plot circle
hold on
axis equal
plot(x,y,'k-')
plot([0 0],[-1 1],'k-')
plot([-1 1],[0 0],'k-')

% Generate random darts
a = -1.5; b = 1.5;
N = 100;
xd = (b-a)*rand(1,N) + a;
yd = (b-a)*rand(1,N) + a;

n = numel(xd);

Q1 = 0; Q2 = 0; Q3 = 0; Q4 = 0;
for i = 1:n
    % Q1 check
    if xd(i) > 0
        if yd(i) > 0
            if sqrt(xd(i)^2+yd(i)^2) <= r
                Q1 = Q1 + 1;
                plot(xd(i),yd(i),'*')
            end
        end
    end
    % Q2 check
    if xd(i) < 0
        if yd(i) < 0
            if sqrt(xd(i)^2+yd(i)^2) <= r
                Q3 = Q3 + 1;
                plot(xd(i),yd(i),'d')
            end
        end
    end
    % Q2 check
    if xd(i) < 0
        if yd(i) > 0
            if sqrt(xd(i)^2+yd(i)^2) > r
                Q2 = Q2 + 1;
                plot(xd(i),yd(i),'s')
            end
        end
    end
    % Q4 check
    if xd(i) > 0
        if yd(i) < 0
            if sqrt(xd(i)^2+yd(i)^2) > r
                Q4 = Q4 + 1;
                plot(xd(i),yd(i),'o')
            end
        end
    end
end

fprintf('Total number of darts: %d\n',N)
fprintf('Number of darts in quadrant 1: %d\n',Q1)
fprintf('Number of darts in quadrant 2: %d\n',Q2)
fprintf('Number of darts in quadrant 3: %d\n',Q3)
fprintf('Number of darts in quadrant 4: %d\n',Q4)
