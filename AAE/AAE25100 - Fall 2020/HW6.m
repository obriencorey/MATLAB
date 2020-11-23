tstart = 0;
tstop =10;
steps = 300;
time = linspace(tstart,tstop,steps);
d = zeros(300,1);
mdot = 350;
C = 300;
minit = 7000;

%loop through and create enough data points to graph
for x = 1:steps
    d(x) = -C *((time(x)- minit / mdot)*log(minit - mdot*time(x)) - time(x)-log(minit)*time(x)+minit /mdot * log(minit));
    
end


plot(time,d)
xlabel("time (s)")
ylabel("distance (m)");
title("hero space ship position vs time");
