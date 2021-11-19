theta_0 = 0.1; %rad
theta_dot_0 = 0; %rad/s
omega_n = 1; %rad/s
zeta = .99; 

period = (2 * pi) / omega_n;
omega_d = omega_n * sqrt(1 - zeta^2);

C1num = omega_n * theta_0 * sqrt(zeta^2 - 1) + omega_n * theta_0 * zeta + theta_dot_0;
C1den = 2 * omega_n * sqrt(zeta^2 - 1);

C1 = C1num / C1den;

C2num = theta_dot_0 - theta_0*(-zeta*omega_n + omega_n * sqrt(zeta^2 - 1));
C2den = -2 * omega_n * sqrt(zeta^2 - 1);

C2 = C2num / C2den;

K1 = C1 + C2;
K2 = 1i*(C1 - C2);

t = linspace(0,10*period,400);
theta = exp(-zeta*omega_n*t).*(K1*cos(omega_d.*t)+K2*sin(omega_d.*t));

hold on
plot(t,theta,'linewidth',2);
xlabel("time in seconds");
ylabel("\theta in radians");
title("\theta vs time - Corey O'Brien");
plot(0,exp(-zeta*omega_n*0).*(K1*cos(omega_d.*0)+K2*sin(omega_d.*0)),'ro');
plot(period,exp(-zeta*omega_n*period).*(K1*cos(omega_d.*period)+K2*sin(omega_d.*period)),'ro');
grid on

