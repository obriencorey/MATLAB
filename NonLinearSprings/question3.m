tstart = 0;     %start and stop times
tstop = 60;
timespan = linspace(tstart,tstop,5000);     %generate list of time steps
epsilon = -.6;

omega = 0.5;
f = @(t,y) [y(2); -.2*y(2) - y(1) - .2 * y(1)^3 + cos(omega * t)];    %define function as system
%first column of y is position and second is velocity 
t0 = 0;         %initial time 
y0 = [0, 1];    %initial values (start position and velocity)
[ts,ys] = ode45(f, timespan, y0);
hold on
plot(ts,ys(:,1))              % plot solution y(t)

omega = 0.6;
f = @(t,y) [y(2); -.2*y(2) - y(1) - .2 * y(1)^3 + cos(omega * t)];    %define function as system
%first column of y is position and second is velocity 
t0 = 0;         %initial time 
y0 = [0, 1];    %initial values (start position and velocity)
[ts,ys] = ode45(f, timespan, y0);
hold on
plot(ts,ys(:,1))              % plot solution y(t)

omega = 0.7;
f = @(t,y) [y(2); -.2*y(2) - y(1) - .2 * y(1)^3 + cos(omega * t)];    %define function as system
%first column of y is position and second is velocity 
t0 = 0;         %initial time 
y0 = [0, 1];    %initial values (start position and velocity)
[ts,ys] = ode45(f, timespan, y0);
hold on
plot(ts,ys(:,1))              % plot solution y(t)

omega = 0.8;
f = @(t,y) [y(2); -.2*y(2) - y(1) - .2 * y(1)^3 + cos(omega * t)];    %define function as system
%first column of y is position and second is velocity 
t0 = 0;         %initial time 
y0 = [0, 1];    %initial values (start position and velocity)
[ts,ys] = ode45(f, timespan, y0);
hold on
plot(ts,ys(:,1))              % plot solution y(t)

omega = 0.9;
f = @(t,y) [y(2); -.2*y(2) - y(1) - .2 * y(1)^3 + cos(omega * t)];    %define function as system
%first column of y is position and second is velocity 
t0 = 0;         %initial time 
y0 = [0, 1];    %initial values (start position and velocity)
[ts,ys] = ode45(f, timespan, y0);
hold on
plot(ts,ys(:,1))              % plot solution y(t)


omega = 1;
f = @(t,y) [y(2); -.2*y(2) - y(1) - .2 * y(1)^3 + cos(omega * t)];    %define function as system
%first column of y is position and second is velocity 
t0 = 0;         %initial time 
y0 = [0, 1];    %initial values (start position and velocity)
[ts,ys] = ode45(f, timespan, y0);
hold on
plot(ts,ys(:,1))              % plot solution y(t)

omega = 1.1;
f = @(t,y) [y(2); -.2*y(2) - y(1) - .2 * y(1)^3 + cos(omega * t)];    %define function as system
%first column of y is position and second is velocity 
t0 = 0;         %initial time 
y0 = [0, 1];    %initial values (start position and velocity)
[ts,ys] = ode45(f, timespan, y0);
hold on
plot(ts,ys(:,1))              % plot solution y(t)

omega = 1.2;
f = @(t,y) [y(2); -.2*y(2) - y(1) - .2 * y(1)^3 + cos(omega * t)];    %define function as system
%first column of y is position and second is velocity 
t0 = 0;         %initial time 
y0 = [0, 1];    %initial values (start position and velocity)
[ts,ys] = ode45(f, timespan, y0);
hold on
plot(ts,ys(:,1))              % plot solution y(t)

omega = 1.3;
f = @(t,y) [y(2); -.2*y(2) - y(1) - .2 * y(1)^3 + cos(omega * t)];    %define function as system
%first column of y is position and second is velocity 
t0 = 0;         %initial time 
y0 = [0, 1];    %initial values (start position and velocity)
[ts,ys] = ode45(f, timespan, y0);
hold on
plot(ts,ys(:,1))              % plot solution y(t)

omega = 1.4;
f = @(t,y) [y(2); -.2*y(2) - y(1) - .2 * y(1)^3 + cos(omega * t)];    %define function as system
%first column of y is position and second is velocity 
t0 = 0;         %initial time 
y0 = [0, 1];    %initial values (start position and velocity)
[ts,ys] = ode45(f, timespan, y0);
hold on
plot(ts,ys(:,1))              % plot solution y(t)

omega = 1.5;
f = @(t,y) [y(2); -.2*y(2) - y(1) - .2 * y(1)^3 + cos(omega * t)];    %define function as system
%first column of y is position and second is velocity 
t0 = 0;         %initial time 
y0 = [0, 1];    %initial values (start position and velocity)
[ts,ys] = ode45(f, timespan, y0);
hold on
plot(ts,ys(:,1))              % plot solution y(t)

omega = 1.6;
f = @(t,y) [y(2); -.2*y(2) - y(1) - .2 * y(1)^3 + cos(omega * t)];    %define function as system
%first column of y is position and second is velocity 
t0 = 0;         %initial time 
y0 = [0, 1];    %initial values (start position and velocity)
[ts,ys] = ode45(f, timespan, y0);
hold on
plot(ts,ys(:,1))              % plot solution y(t)

omega = 1.7;
f = @(t,y) [y(2); -.2*y(2) - y(1) - .2 * y(1)^3 + cos(omega * t)];    %define function as system
%first column of y is position and second is velocity 
t0 = 0;         %initial time 
y0 = [0, 1];    %initial values (start position and velocity)
[ts,ys] = ode45(f, timespan, y0);
hold on
plot(ts,ys(:,1))              % plot solution y(t)

omega = 1.8;
f = @(t,y) [y(2); -.2*y(2) - y(1) - .2 * y(1)^3 + cos(omega * t)];    %define function as system
%first column of y is position and second is velocity 
t0 = 0;         %initial time 
y0 = [0, 1];    %initial values (start position and velocity)
[ts,ys] = ode45(f, timespan, y0);
hold on
plot(ts,ys(:,1))              % plot solution y(t)

omega = 1.9;
f = @(t,y) [y(2); -.2*y(2) - y(1) - .2 * y(1)^3 + cos(omega * t)];    %define function as system
%first column of y is position and second is velocity 
t0 = 0;         %initial time 
y0 = [0, 1];    %initial values (start position and velocity)
[ts,ys] = ode45(f, timespan, y0);
hold on
plot(ts,ys(:,1))              % plot solution y(t)

omega = 2;
f = @(t,y) [y(2); -.2*y(2) - y(1) - .2 * y(1)^3 + cos(omega * t)];    %define function as system
%first column of y is position and second is velocity 
t0 = 0;         %initial time 
y0 = [0, 1];    %initial values (start position and velocity)
[ts,ys] = ode45(f, timespan, y0);
hold on
plot(ts,ys(:,1))              % plot solution y(t)
plot(32.07,3.015,'color','b','marker','.','markersize',15)
title('position of the mass vs time for various values of omega')
xlabel('time'); 
ylabel('position');
lgd = legend('0.5', '0.6', '0.7', '0.8', '0.9', '1.0', '1.1', '1.2', '1.3', '1.4', '1.5', '1.6', '1.7', '1.8', '1.9','2.0')
legend('Location','southwest')
legend('boxoff')
lgd.NumColumns = 2;
grid on
   