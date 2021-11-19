theta_0 = 0.3; %rad
theta_dot_0 = 0; %rad/s
omega_n = 1; %rad/s

period = (2 * pi) / omega_n;

t = linspace(0,period,400);
theta = sqrt(theta_0^2 + theta_dot_0^2/omega_n^2) * cos(omega_n.*t + atan2(-theta_dot_0,omega_n*theta_0));

plot(t,theta,'k','linewidth',2);
xlabel("time in seconds");
ylabel("\theta in radians");
title("\theta vs time - Corey O'Brien");
grid on

