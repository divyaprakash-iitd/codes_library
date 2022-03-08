clear; clc; close all;

% Description: Create tables and plots of wind chill data

wc = @(T,V) 0.4275*T.*V.^(0.16) + 35.74 - 35.74*V.^(0.16) + 0.6215*T;

V = 5:5:100;
T = 5:-5:-40;

% Print table
fprintf('T deg C');
for i = 1:numel(T)
    fprintf('%6d',T(i));
end
fprintf('\nV(kmph)\n');
for j = 1:numel(V)
    fprintf('%7d',V(j))
    for i = 1:numel(T)
        fprintf('%6.0f',wc(T(i),V(j)))
    end
fprintf('\n');
end

% Plot graph
V = 5:5:100;
T = [5 -5 -20 -30 -40];
figure(1)
xlabel('Velocity (kmph)')
ylabel('Wind Chill (deg C)')
hold on
for i = 1:numel(T)
    plot(V,wc(T(i),V),'-o','DisplayName',sprintf('T = %d deg C',T(i)))
end
title('Wind Chill Variation with Velocity')
legend show
grid on