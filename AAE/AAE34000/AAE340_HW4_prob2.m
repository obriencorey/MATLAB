%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Corey O'Brien - HW4 problem 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tstart = 0;
tstop = 6*pi;
timespan = linspace(tstart,tstop,2000);
xinitial = [0; 0];
options = odeset('AbsTol',1e-12);
[t,x] = ode45(@odefunc,timespan,xinitial,options);


hold on
plot(t,x(:,1),'r','linewidth',2);
xlabel("time in seconds");
ylabel("x in meters");
title("x vs time - Corey O'Brien");
legend("numerical integration sol^n");
grid on


function dstate = odefunc(t,x)

omega_n = 1; %rad/s
f_0 = 1;
m = 1;

dx1dt = x(2);
dx2dt = -f_0 / m * sin(omega_n*t) - omega_n^2 * x(1);

dstate = [dx1dt; dx2dt];
end