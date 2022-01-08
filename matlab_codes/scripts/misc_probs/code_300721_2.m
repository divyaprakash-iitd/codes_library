clear; clc; close all;

% Description: Solves a IVP problem using ode23.

[t,z]=ode23(@statedot,[0.0:0.01:10.0]',[1.0,0.5]');

plot(z(:,1),z(:,2))

axis square

function sdot = statedot(t,z)
    % Computes time derivative of state vector
    x1 = z(1); x2 = z(2);
    sdot = [-2 * x2;
            x1];
end