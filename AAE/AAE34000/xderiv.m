function xderivative = xderiv(t,x)

%zeta = 0.1;
%zeta = 1;
zeta = sqrt(2);
omega_n = 1;

dx1dt = x(2);
dx2dt = -2*zeta*omega_n * x(2) - omega_n^2 * x(1);

xderivative = [dx1dt; dx2dt];