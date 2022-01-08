xleft = 1;
xright=9*pi/4;
N=20;
x=linspace(xleft,xright,N);
x=x';
dx=(xright-xleft)/(N-1);
yleft=2;


M = (diag(-2*ones(N,1),0) + diag(ones(N-1,1),-1) + diag(ones(N-1,1),1))/dx^2;

M(1,:) = [1, zeros(1,N-1)];
M(end,:) = [zeros(1,N-2),2/dx^2,-2/dx^2];

b = sin(x)./(cos(x)+2);
b(1) = yleft;
b(end) = b(end)+0.1*2/dx;
y=M\b;

plot(y)
fprintf('Maximum y: %.3f\n',max(y))
