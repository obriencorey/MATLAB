%{
Filename: 'NonLinearSprings.m'

Title: NonLinear Spring assignment for MA26600 Fall 2020

Purpose: To simulate the behavior of a dynamics system
         of springs

By: Corey O'Brien
%}

tstart = 0;     %start and stop times
tstop = 60;
timespan = linspace(tstart,tstop,5000);     %generate list of time steps
epsilon = -.2;
omega = 1;

f = @(t,y) [y(2); -y(1) - epsilon * y(1)^3];    %define function as system

%first column of y is position and second is velocity 

t0 = 0;         %initial time 
y0 = [0, 1];    %initial values (start position and velocity)

[ts,ys] = ode45(f, timespan, y0);

plot(ts,ys(:,1),'b')              % plot solution y(t)
title('position of the mass vs time - epsilon = -.2')
xlabel('time'); 
ylabel('position');
grid on
   