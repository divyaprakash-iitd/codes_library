clear; clc; close all;

% Description: Plots the response of a spring-mass-damper system.

P   = 100;          % [N]
m   = 2;            % [kg]
k   = 175;          % [N/m]
wn  = sqrt(k/m);    % [rad/s]

b   = @(Z)      2*Z*wn*m;
phi = @(w,Z)    atan2d(b(Z).*w,(k-m.*w.^2));
xss = @(w,Z)    P./(sqrt((k-m*w.^2).^2 + b(Z)^2.*w.^2));

Z       = [0.00 0.15 0.30 0.45 0.60 0.75];
nZ      = numel(Z);
wbywn   = 0:0.01:3;
nw      = numel(wbywn);

XS      = zeros(nZ,nw);
PHI     = zeros(nZ,nw);

figure(1)
hold on
xlabel('$\frac{\omega}{\omega_n}$','Interpreter','latex')
ylabel('|XSS|')
for iZ = 1:numel(Z)
    for iw = 1:numel(wbywn) 
        w = wbywn(iw)*wn;
        XS(iZ,iw) = xss(w,Z(iZ));
    end
    plot(wbywn,XS(iZ,:),'DisplayName',sprintf('\x3B6=%.2f',Z(iZ)))
end
plot([1 1], [min(XS,[],'all') 5],'--','HandleVisibility','off')
ylim([0 3])
legend show

figure(2)
hold on
xlabel('$\frac{\omega}{\omega_n}$','Interpreter','latex')
ylabel('$\phi$','Interpreter','Latex')
for iZ = 1:numel(Z)
    for iw = 1:numel(wbywn) 
        w = wbywn(iw)*wn;
        PHI(iZ,iw) = phi(w,Z(iZ));
    end
    plot(wbywn,PHI(iZ,:),'DisplayName',sprintf('\x3B6=%.2f',Z(iZ)))
end
legend('location','southeast')