clear; clc; close all;

% Description: Appends rows and column to a matrix

M = magic(4)
M = zerorowcolumn(M)

f = @(x) log(x) - x.^2 + 2;
fplot(f)
set(gca,'xaxislocation','origin')
set(gca,'yaxislocation','origin')
fprintf('The roots are %.4f and %.4f\n',fzero(f,[0.1,1]),fzero(f,[1,2]))

function M = zerorowcolumn(M)
    M(:,end+1) = zeros(1,size(M,1));
    M(end+1,:) = zeros(1,size(M,2));
end

