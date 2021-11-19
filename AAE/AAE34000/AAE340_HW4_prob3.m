%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Corey O'Brien - HW4 problem 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tstart = 0;
tstop = 6*pi;
timespan = linspace(tstart,tstop,2000);

omega_n = 1; %rad/s
f_0 = 1;
m = 1;
x_0 = 0;
xdot_0 = 0;

x_analytical = x_0*cos(omega_n.*timespan) + (xdot_0 / ...
    omega_n + f_0 / (2*omega_n^2*m))*sin(omega_n.*timespan) - ...
    f_0 / (2*omega_n*m).*timespan.*cos(omega_n.*timespan);


xinitial = [0; 0];
options = odeset('AbsTol',1e-12,'RelTol',1e-12);
[t,x] = ode45(@odefunc,timespan,xinitial,options);

x_numerical = x(:,1);
x_error = x_numerical' - x_analytical;

hold on
plot(t,x_error,'b','linewidth',1);
xlabel("time in seconds");
ylabel("difference in x in meters");
title("error vs time - Corey O'Brien");
legend("error");
grid on


function dstate = odefunc(t,x)

omega_n = 1; %rad/s
f_0 = 1;
m = 1;

dx1dt = x(2);
dx2dt = f_0 / m * sin(omega_n*t) - omega_n^2 * x(1);

dstate = [dx1dt; dx2dt];
end
