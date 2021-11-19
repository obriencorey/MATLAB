tstart = 0;
tstop = 10;

timespan = linspace(tstart,tstop,1000);

%outputinitial = [x z theta u w q m];
outputinitial = [0; 0; pi/2; 0; 0; 0; 1];

[t,y] = ode45(@aae_301odefunc_part6,timespan,outputinitial);

x = y(:,1);
z = y(:,2);
theta = y(:,3);

figure()
plot(t,theta.*180/pi)
title("pitch angle above horizon vs time")
xlabel("time (s)");
ylabel("angle (degrees)");

figure()
plot(x,-z)
title("altitude vs horizontal distance")
xlabel("horizontal distance (m)");
ylabel("altitude (m)");