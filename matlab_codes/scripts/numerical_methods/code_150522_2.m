clear; clc; close all;

% Description: Solves a problem using numerical integration
a = 0;
b = 10;
N = 100;
z = linspace(a,b,N);

f = distributedLoad(z);
figure
plot(z,f)
xlabel('z [m]')
ylabel('f(z) [N/m]')
grid on

zf = meanForce(z);
figure
plot(z,zf)
xlabel('z [m]')
ylabel('zf(z) [N]')
grid on

fprintf('Equivalent Force [N]\n')
fprintf('-------------------------------------------------------\n')
fprintf('m\t\tTrapezoidal\t\tSimpson\n')
fprintf('-------------------------------------------------------\n')

% Numerical Integration
for m = 10.*(2.^(0:5))
    IT = compositeTrapezoidal(a,b,m,@distributedLoad);
    IS = compositeSimpson(a,b,m,@distributedLoad);
    fprintf('%d\t\t%.10f\t\t%.10f\n',m,IT,IS)
end

% Action Point
d = compositeSimpson(a,b,m,@meanForce)/compositeSimpson(a,b,m,@distributedLoad);
fprintf('\nThe action point is at %.3f m from the bottom.\n',d)

function f = distributedLoad(z)
    L = 10; % [m]
    f = 2900*(z./(5+z)).*exp(-2*z/L); % [N/m]
end


function f = meanForce(z)
    f = z.*distributedLoad(z); % [N]
end

function I = compositeTrapezoidal(a,b,numSubintervals,theFunction)
  dx = (b-a)/numSubintervals;
  x = a:dx:b;
  I = dx/2*(theFunction(x(1)) + 2*sum(theFunction(x(2:end-1))) ... 
      + theFunction(x(end)));
end

function I = compositeSimpson(a,b,numSubintervals,theFunction)
	h = (b-a)/numSubintervals;
	x = a:h:b;
	I = h/3*(theFunction(x(1)) + ... 
        2*sum(theFunction(x(3:2:numSubintervals-1))) + ... 
        4*sum(theFunction(x(2:2:numSubintervals))) + ... 
        theFunction(x(numSubintervals+1)));
end