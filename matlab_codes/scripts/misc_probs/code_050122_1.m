clear; clc; close all;

% Description: Plots the tension in a cable

W   = 250; % [lb]
L   = 108; % [in]
Lc  = 68; % [in]

syms T(d)
T = W*L*Lc/d/sqrt(Lc^2-d.^2);
dT = diff(T);

T = matlabFunction(T);
dT = matlabFunction(dT);

figure(1)
hold on
fplot(T,[0.1*L 0.8*L],'HandleVisibility','off')
xlabel('d [in]')
ylabel('T [lb-f/in^2]')

dmin = fzero(dT,10);
Tmin = T(dmin);
plot(dmin,Tmin,'rx','DisplayName',sprintf('d = %.2f',dmin))
legend('location','north')

fprintf('The minimum value of T is %.4f at %.4f from A.\n',Tmin,dmin)