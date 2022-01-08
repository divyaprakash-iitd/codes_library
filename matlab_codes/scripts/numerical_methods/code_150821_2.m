clear; clc; close all;

% Description: Integrates using the trapezoidal method.
clear; clc; close all;

% Description: Integrates using the trapezoidal method.

y1 = @(x) x;
y2 = @(x) (x-2).^2;
fun = @(x,y) 0*x + 1;
a = 1; b = 4;

hold on
fplot(y1)
fplot(y2)
legend show

Iexact = integral2(fun,a,b,y2,y1);

M = 80;
dx = (b-a)/M;
x = a:dx:b;
I = trapz(x,y1(x)) - trapz(x,y2(x));

err = abs(I-Iexact);

fprintf('The value for M=%d is: %.4f for which the error is %.5f using Trapezoidal Method\n',M,I,err)




y1 = @(x) x;
y2 = @(x) (x-2).^2;
fun = @(x,y) 0*x + 1;
a = 1; b = 4;

hold on
fplot(y1)
fplot(y2)
legend show

Iexact = integral2(fun,a,b,y2,y1);

M = 80;
dx = (b-a)/M;
x = a:dx:b;
I = trapz(x,y1(x)) - trapz(x,y2(x));

err = abs(I-Iexact);

fprintf('The value for M=%d is: %.4f for which the error is %.5f using Trapezoidal Method\n',M,I,err)



