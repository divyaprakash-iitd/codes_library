function C = curve_fit_LSM(x,y,N)
% curve_fit_LSM: Fits a Polynomial (Curve)
% C = curve_fit_LSM(x,y,N):
%   Returns the coefficients C of a Polynomial (Curve) of the order N,
%   using Least Squares Method.
%   p = C(1)x^N + C(2)x^(N-1) + ... + C(N+1)x^0
%
% input: 
%   x = Vector of x values
%   y = Vector of f(x) values
% output:
%   C = Coefficients of the required polynomial. 
%
% Author: Divyaprakash
%         Mechanical Engineer
% e-mail: divyaprakash.poddar@gmail.com
% Date  : 17 June 2021

    NC = N + 1; % Number of coefficients

    % Preallocate the Matrix and Vector
    A = zeros(NC,NC);
    b = zeros(NC,1);
    
    % Construct the Matrix and Vector
    for row = 1:NC
        for col = 1:NC
            A(row,col) = sum(x.^(col - 2 +row));
        end
        b(row) = sum(x.^(row - 1).*y);
    end

    C = flip(A\b);
end