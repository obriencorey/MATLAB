%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Corey O'Brien - AAE340 Homework 6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
close all

tstart = 0;
tstop = 3029832;
res = tstop/10;
timespan = linspace(tstart,tstop,res);

%orbiter hyperbolic
r01 = 21419400; %km
rdot01 = -5.54771; %km/s
theta01 = 0; %rad
thetadot01 = 1.88502*10^(-8); %rad/s

xinitial1 = [r01; rdot01; theta01; thetadot01;];

options = odeset('AbsTol',1e-12,'RelTol',1e-12);
[t1,x1] = ode45(@odefunc,timespan,xinitial1,options);

r1 = x1(:,1);
rdot1 = x1(:,2);
theta1 = x1(:,3);
thetadot1 = x1(:,4);

xvals1 = r1.*cos(theta1);
yvals1 = r1.*sin(theta1);

%probe hyperbolic
r02 = 21419400; %km
rdot02 = -5.558; %km/s
theta02 = 0; %rad
thetadot02 = 9.28949*10^(-9); %rad/s

xinitial2 = [r02; rdot02; theta02; thetadot02;];

options = odeset('AbsTol',1e-12,'RelTol',1e-12);
[t2,x2] = ode45(@odefunc,timespan,xinitial2,options);

r2 = x2(:,1);
rdot2 = x2(:,2);
theta2 = x2(:,3);
thetadot2 = x2(:,4);

xvals2 = r2.*cos(theta2);
yvals2 = r2.*sin(theta2);


%orbiter elliptic
tstart = 0;
tstop = 188*86400;
res = tstop/10;
timespan2 = linspace(tstart,tstop,res);

r03 = 285592; %km
rdot03 = 0; %km/s
theta03 = 155.7*pi/180; %rad
thetadot03 = 0.000103536; %rad/s

xinitial3 = [r03; rdot03; theta03; thetadot03;];

options = odeset('AbsTol',1e-12,'RelTol',1e-12);
[t3,x3] = ode45(@odefunc,timespan2,xinitial3);

r3 = x3(:,1);
rdot3 = x3(:,2);
theta3 = x3(:,3);
thetadot3 = x3(:,4);

xvals3 = r3.*cos(theta3);
yvals3 = r3.*sin(theta3);

RJ = 71398;
thetavals = linspace(0,2*pi);
xvals4 = RJ.*cos(thetavals);
yvals4 = RJ.*sin(thetavals);

hold on
axis equal
plot(xvals1,yvals1,'LineWidth',2,'DisplayName','Orbiter Hyperbolic')
plot(xvals2,yvals2,'LineWidth',2,'DisplayName','Probe Hyperbolic')
plot(xvals3,yvals3,'LineWidth',2,'DisplayName','Orbiter Elliptic')
plot(xvals4,yvals4,'LineWidth',2,'DisplayName','Jupiter')
title("Corey O'Brien - Galileo Mission Plots");
xlabel("km");
ylabel("km");
legend();



function dstate = odefunc(t,x)

mu = 1.267*10^8;

dx1 = x(2);
dx2 = x(1)*x(4)^2 - mu/x(1)^2;
dx3 = x(4);
dx4 = -2*x(2)*x(4)/x(1);

dstate = [dx1; dx2; dx3; dx4];
end