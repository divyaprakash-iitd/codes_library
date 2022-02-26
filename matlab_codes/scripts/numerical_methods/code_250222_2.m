
%% Load data into arrays

F = [0.392 0.589 0.785 0.981 1.177 1.373 1.570 1.766 1.962 2.158];
x = [0.009 0.015 0.022 0.029 0.04 0.046 0.052 0.059 0.062 0.069];

%% Calculate the slope and intercept
p = polyfit(F,x,1);

scatter(x,F,'ro','LineWidth',1.5)
hold on
plot(polyval(p,F),F,'b--','LineWidth',1)
xlabel('x [m]')
ylabel('F [N]')
grid on
yticks(0:0.5:2.5)
title('Spring Constant')
    




