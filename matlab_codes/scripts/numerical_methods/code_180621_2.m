clear; clc; close all;

% Description: Finds the maximum of a function using the Golden-Section Search Algorithm

fun = @(x) (4*x-1.8*x.^2+1.2*x.^3-0.3*x.^4);

f = @(x) -fun(x);
xl = -2;
xu = 4;
xq = linspace(xl,xu,100);
es = 0.1/100;

maxit = 50;
phi = (1+sqrt(5))/2; iter = 0;
d = (phi-1)*(xu - xl);
x1 = xl + d; x2 = xu - d;
f1 = f(x1); f2 = f(x2);
fprintf('\n  Iteration No.    x_opt        f(x_opt)        eps_a\n')
fprintf('---------------------------------------------------------\n')
while(1)
    xint = xu - xl;
    if f1 < f2
        xopt = x1; xl = x2; x2 = x1; f2 = f1;
        x1 = xl + (phi - 1)*(xu - xl); f1 = f(x1);
    else
    xopt = x2; xu = x1; x1 = x2; f1 = f2;
    x2 = xu - (phi-1)*(xu-xl); f2 = f(x2);
    end
    iter = iter + 1;
    if xopt~= 0, ea = (2 - phi) * abs(xint / xopt) * 100;end
    if ea <= es || iter >= maxit,break,end
    fprintf('\t %d \t %.4f \t %.4f \t %.4f\n',iter, xopt,fun(xopt),ea)
end
x = xopt; fx = fun(xopt);


hold on
plot(xq,fun(xq),'HandleVisibility','off')
plot(x,fx,'x','DisplayName','Maximum Value')
xlabel('x')
ylabel('f(x)')
legend('location','northwest')
