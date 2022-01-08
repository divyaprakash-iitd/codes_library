clear; clc; close all;

h = 0.02; k = 0.002;

x0 = 0; xN = 1;
t0 = 0; tN = 0.004;

x = x0:h:xN;
t = t0:k:tN;

nx = numel(x);
nt = numel(t);

u = zeros(nx,nt);

u(:,1)      = 1 - x.^2;     % Initial condition
u(end,:)    = 0;            % Boundary condition

for it = 1:nt-1
    for ix = 1:nx-1
        if (ix == 1)
            u(ix,it+1) = u(ix,it) + k/h^2*(2*u(ix+1,it) - 2*u(ix,it));
        else
            u(ix,it+1) = u(ix,it) + k/h^2*(u(ix-1,it) - 2*u(ix,it) + u(ix+1,it)) + k/x(ix)/h*(u(ix+1,it) - u(ix-1,it));
        end
    end
end


% if (ix == 1)
%         u(ix,it+1) = u(ix+1,it)   *   (2*k/h^2)   + ...
%                      u(ix,it)     *   (1 - 2*k/h^2);
%     else
%         u(ix,it+1) = u(ix+1,it)   *   (k/h^2 + k/x(ix)/h)   + ...
%                      u(ix,it)     *   (1 - 2*k/h^2)         + ...
%                      u(ix-1,it)   *   (k/h^2 - k/x(ix)/h);
% end