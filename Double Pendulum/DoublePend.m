
tstart = 0;     %start and stop times
tstop = 25;

timespan = linspace(tstart,tstop,5000);     %generate list of time steps

thetainitial = [pi/6, -pi/6, 0, 0];   %initial angles and angular velocities

[t,x] = ode45('derivative', timespan, thetainitial);  

hold on
figure(1);
plot(t, x(:,1),t, x(:,2),t, x(:,3),t, x(:,4));
title('Pendulum Data');
xlabel('Time (seconds)');
legend("Angle1", "Angle2", "Omega1", "Omega2");
legend('Location','northwest');
grid on;