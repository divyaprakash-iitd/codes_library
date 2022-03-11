clear; clc; close all;

% Description: Solves a temperature distribution problem

syms T(x,y)
Ts = 80*exp(-(x-1)^2)*exp(-3*(y-1)^2);
dtdx = diff(Ts,x);  
dtdy = diff(Ts,y);

fprintf('Partial Derivatives\n')
fprintf('dTdx: \n')
disp(dtdx)
fprintf('dTdxy \n')
disp(dtdy)

T = matlabFunction(Ts);

N = 100;
xmin = 0; xmax = 1;
ymin = 0; ymax = 1;
X = linspace(xmin,xmax,N);
Y = linspace(ymin,ymax,N);

[x,y] = meshgrid(X,Y);

Treq = 27;
Tlevels = [70:-10:10,Treq,5];
Tlevels = sort(Tlevels,'descend');

figure(1)
hold on
contour(x,y,T(x,y),Tlevels)
contour(x,y,T(x,y),[Treq, Treq],'ShowText','on')
xlabel('x')
ylabel('y')
axis equal
ax1 = gca;

f = @(y) T(0,y) - Treq;
figure(2)
fplot(f,[ymin,ymax])
set(gca,'xaxislocation','origin')
xlabel('y')
ylabel('f(y)')

tol = 1e-6;
yguess = 0.8;
[y,~] = newtons(f,yguess,tol);

% Walk along the line where T = 27
fig = figure(3);
ax2 = copyobj(ax1,fig);

hold on
for i = 1:numel(X)
    f = @(y) T(X(i),y) - Treq;
    [y,~] = newtons(f,yguess,tol);
    yguess = y;
    if (mod(i,4)==0) % Plot every 4th point
        plot(X(i),y,'rx')
    end
end

function [x,CNT] = newtons(y,x,tol)
	CNT = 0;
    h = 0.001;
	while abs(y(x)) > tol
        df = (y(x+h) - y(x-h))/2/h;
		x = x - y(x)./df;
		CNT = CNT + 1;
	end
end