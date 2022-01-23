clear; clc; close all;

% Description: verifies the mean and standard deviation calculation of
% Weibull random numbers of matlab

meanU  = 10;    % [m/s]
sigmaU = 2;     % [m/s]

k = (sigmaU/meanU)^(-1.086);
c = meanU/gamma(1+1/k);

nrun = 3;

for irun = 1:nrun
    fprintf('\n Execution Number # %d\n',irun)
    fprintf('Ideal Values:\n Mean: %d\tStandard Deviation: %d\n',meanU,sigmaU)
    for N = logspace(1,5,5)
        u = wblrnd(c,k,N,1);

        meanUcalc = 1/N*sum(u);
        sigmaUcalc = sqrt(1/(N-1)*sum((u-meanUcalc).^2));
        fprintf('N = %d\n',N)
        fprintf('Calculated Values:\n Mean: %.10f\tStandard Deviation: %.10f\n',meanUcalc,sigmaUcalc)
    end
end