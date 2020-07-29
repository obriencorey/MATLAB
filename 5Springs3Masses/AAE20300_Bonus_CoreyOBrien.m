%{
Filename: 'AAE20300_Bonus_CoreyOBrien.m'

Title: Bonus Assignment for AAE20300 Summer 2020

Purpose: To simulate the behavior of a dynamic system 
         of springs and masses

By: Corey O'Brien
%}

tstart = 0;     %start and stop times
tstop = 25;

timespan = linspace(tstart,tstop,5000);     %generate list of time steps

xinitial = [0; 0; 0; .1; .2; .3];   %initial conditions

[t,x] = ode45('xderiv', timespan, xinitial);  

hold on
figure(1);
plot(t, x(:,1),t, x(:,2),t, x(:,3));
title('Position vs Time - Corey O''Brien');
xlabel('Time (seconds)');
ylabel('Position (meters)');
legend("m1 position", "m2 position", "m3 position");
legend('Location','southeast');
grid on;

figure(2);
plot(t, x(:,4),t, x(:,5),t, x(:,6));
title('Velocity vs Time - Corey O''Brien');
xlabel('Time (seconds)');
ylabel('Velocity (meters per second)');
legend("m1 velocity", "m2 velocity", "m3 velocity");
legend('Location','southeast');
grid on;
hold on
   