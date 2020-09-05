%By: Corey O'Brien for AAE25100 Fall 2020
%Initial velocity: 20m/s
%Acceleration:
%   0-5s: 0m/s^2
%   5-10s: 3m/s^2
%   10-17s: -5m/s^2

Vinit = 20;             %starting velocity
velocity = Vinit;       %initialize velocity term
VMatrix = {Vinit};      %initialize velocity matrix
tstart = 0;             %start time
tstop = 17;             %end time
tstep = 1000;           %increment of time
counter = 1;            %initalize counter
timespan = linspace(tstart,tstop,tstep);   %create matrix of time

 
while(counter < tstep)              %loop through all time steps
    time = timespan(counter);
    %during the first 5 second the acceleration is 0
    if(time < 6)
        acceleration = 0;
    end
    %during the next 5 seconds the acceleration is 3m/s^2
    if(time > 6 && time < 11)
        acceleration = 3;
    end
    %during the final 7 seconds, the acceleration is -5m/s^2
    if(time > 11)
        acceleration = -5;
    end
  
    deltaT = (timespan(counter + 1) - timespan(counter));
    velocity = velocity + acceleration * deltaT;
    counter = counter + 1;
    VMatrix = [VMatrix, velocity];
end
V = cell2mat(VMatrix);      %Convert cell type to double

plot(timespan,V,'r');
title('Velocity vs Time for Car - Corey O''Brien');
xlabel('Time (seconds)');
ylabel('Velocity (meters per second)');

