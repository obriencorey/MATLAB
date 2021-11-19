%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Corey O'Brien - HW3 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%for numerical integration
zeta = sqrt(2);
theta_0 = 0.1; %rad
theta_dot_0 = 0; %rad/s
omega_n = 1; %rad/s
tstart = 0;
tstop = 20;
timespan = linspace(tstart,tstop,2000);
xinitial = [0.1; 0];
[t,x] = ode45('xderiv',timespan,xinitial);

hold on
plot(t,x(:,1),'r','linewidth',2);
xlabel("time in seconds");
ylabel("\theta in radians");
title("\theta vs time for \zeta = " + zeta + " - Corey O'Brien");
grid on

%for checking numerical integration with analytical solutions

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%for underdamped case
% period = (2 * pi) / omega_n;
% omega_d = omega_n * sqrt(1 - zeta^2);
% 
% C1num = omega_n * theta_0 * sqrt(zeta^2 - 1) + omega_n * theta_0 * zeta + theta_dot_0;
% C1den = 2 * omega_n * sqrt(zeta^2 - 1);
% 
% C1 = C1num / C1den;
% 
% C2num = theta_dot_0 - theta_0*(-zeta*omega_n + omega_n * sqrt(zeta^2 - 1));
% C2den = -2 * omega_n * sqrt(zeta^2 - 1);
% 
% C2 = C2num / C2den;
% 
% K1 = C1 + C2;
% K2 = 1i*(C1 - C2);
% 
% theta = exp(-zeta*omega_n.*timespan).*(K1*cos(omega_d.*timespan)+K2*sin(omega_d.*timespan));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for critically damped case
%theta = exp(-zeta*omega_n.*timespan).*(theta_0 + (theta_dot_0 + omega_n * theta_0).*timespan);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for over damped case
theta = (exp(-zeta*omega_n.*timespan)) / (2*sqrt(zeta^2-1)).*(((sqrt(zeta^2-1)-zeta)*theta_0 - theta_dot_0/omega_n)...
    .*exp(-sqrt(zeta^2-1)*omega_n.*timespan) + ((sqrt(zeta^2-1)+zeta)*theta_0 + theta_dot_0/omega_n).*exp(sqrt(zeta^2-1)*omega_n.*timespan));    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for plotting analytical solution
plot(timespan,theta,'-.k','linewidth',1);
legend("Numerical Integration Soln","Analytical Soln");

