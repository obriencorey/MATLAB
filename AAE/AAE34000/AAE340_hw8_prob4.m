%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Corey O'Brien - AAE340 Homework 8 Problem 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close all

tstart = 0;
tstop = 1*60;
res = 200;
timespan = linspace(tstart,tstop,res);

xinit = [0,0];
C_Dlist = [0.01,0.1,1];
maxdata = zeros(1,6);

hold on
grid on
grid minor
title("Corey O'Brien - Altitude vs Time for Model Rocket");
xlabel("time (seconds)");
ylabel("altitude (meters)");
ctr = 1;

%loop through all values of C_D
%plot altitude and find max altitudes
for C_D = C_Dlist
    opt = odeset('AbsTol',1e-12,'RelTol',1e-12);
    [t,x] = ode45(@odefunc,timespan,xinit,opt,C_D);

    alt = x(:,1);

    for indx = 1:length(alt)
        if(alt(indx) < 0)
            alt(indx) = 0;
        end
    end
    plot(t,alt,'Linewidth',2);
    [maxval,maxidx] = max(alt);
    maxdata(ctr) = maxval;
    maxdata(ctr+1) = t(maxidx);
    plot(t(maxidx),maxval,'.','MarkerSize',20);
    
    ctr = ctr + 2;
  
end

ylim([-10,maxdata(1)+200]);

lgdstr1 = sprintf("max alt with C_D = 0.01:     %.1fm at %.1fs",maxdata(1),maxdata(2));
lgdstr2 = sprintf("max alt with C_D = 0.1:     %.1fm at %.1fs",maxdata(3),maxdata(4));
lgdstr3 = sprintf("max alt with C_D = 1:     %.1fm at %.1fs",maxdata(5),maxdata(6));
lgd = legend("Flight with C_D = 0.01",lgdstr1,"Flight with C_D = 0.1",lgdstr2,...
    "Flight with C_D = 1",lgdstr3,'Location', 'southoutside','NumColumns',1);
htitle = get(lgd,'Title');
set(htitle,'String','Legend')

%new figure for velocities
figure()
hold on
grid on
grid minor
title("Corey O'Brien - Velocity vs Time for Model Rocket");
xlabel("time (seconds)");
ylabel("velocity (meters/s)");

%loop through and plot velocities
for C_D = C_Dlist
    opt = odeset('AbsTol',1e-12,'RelTol',1e-12);
    [t,x] = ode45(@odefunc,timespan,xinit,opt,C_D);
    vel = x(:,2);
    plot(t,vel,'Linewidth',2);
end
lgd = legend("Velocity for C_D = 0.01","Velocity for C_D = 0.1","Velocity for C_D = 1");
htitle = get(lgd,'Title');
set(htitle,'String','Legend');

%find C_D such that apogee is around 1800 ft
maxalt = maxdata(5);
targ = 1800;
C_D = 1;
ctr = 1;

C_Dvals = [C_D];
Iterationvals = [ctr];
while(abs(targ-maxalt) > .01)
    %fprintf("iteration %d \t %f\n",ctr,C_D);
    if(maxalt > targ)
        C_D = C_D + 0.001 * abs(targ-maxalt);
    else
        C_D = C_D - 0.001 * abs(targ-maxalt);
    end
    opt = odeset('AbsTol',1e-12,'RelTol',1e-12);
    [t,x] = ode45(@odefunc,timespan,xinit,opt,C_D);
    alt = x(:,1);
    [maxval,maxidx] = max(alt);
    maxalt = maxval * 3.28084;
    maxtime = t(maxidx);
     
    ctr = ctr + 1;
    
     C_Dvals = [C_Dvals, C_D];
     Iterationvals = [Iterationvals, ctr];
end

for indx = 1:length(alt)
        if(alt(indx) < 0)
            alt(indx) = 0;
        end
end
    
figure()
hold on
grid on
grid minor
title("Corey O'Brien - Altitude vs Time for Model Rocket w Apogee = 1800ft");
xlabel("time (seconds)");
ylabel("altitude (meters)");
plot(t,alt,'Linewidth',2);
plot(maxtime,maxalt/3.281,'.','Markersize',20);
lgdstr4 = sprintf("max alt with C_D = %.3f:     %.1fft at %.1fs",C_D,maxalt,maxtime);
legend("flight path",lgdstr4);
ylim([-10,800]);

% figure()
% hold on
% plot(Iterationvals,C_Dvals)

function dstate = odefunc(t,x,C_D)
%constants

tb = 3;         %burn time
g = 9.80665;       %gravity
rho = 1.225;    %air density kg/m^3
A = 0.004869;   %frontal area

%if motor burning then we are losing mass
%assume constant mass flow rate
if(t <= tb)
    m = 0.4943 - (0.0625/tb)*t; %kg
else
    m = 0.4305; %kg
end

%thrust is assumed constant
T = 40; %N

if(t <= tb)
    %if motor is still firing here are equations
    dx1 = x(2);
    dx2 = 1/m*(-.5 * rho * C_D * A * x(2)^2 - m*g + T);
elseif(x(2) < 0) 
    %if rocket is falling
    dx1 = x(2);
    dx2 = 1/m*(.5 * rho * C_D * A * x(2)^2 - m*g);
else
    %if motor burn complete and still rising
    dx1 = x(2);
    dx2 = 1/m*(-.5 * rho * C_D * A * x(2)^2 - m*g);
end


dstate = [dx1; dx2];
end