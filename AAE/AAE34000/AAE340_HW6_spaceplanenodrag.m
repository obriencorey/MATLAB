%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Corey O'Brien - AAE340 Homework 6
%space plane 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
close all

tstart = 0;
tstop = 86400;
res = 2*tstop;
timespan = linspace(tstart,tstop,res);

%ICs
r0 = 42166;
theta0 = pi;
v0 = 1.59709;
gamma0 = 0;

xinitial = [r0, theta0, v0, gamma0 ];

options = odeset('AbsTol',1e-12,'RelTol',1e-12);
[t1,x1] = ode45(@odefunc,timespan,xinitial,options);

r = x1(:,1);
theta = x1(:,2);
v = x1(:,3);
gamma = x1(:,4);

xvals1 = r.*sin(theta);
yvals1 = r.*cos(theta);

thetavals = linspace(0,2*pi);
xvals2 = 6376.*cos(thetavals);
yvals2 = 6376.*sin(thetavals);

figure()
hold on
axis equal
grid on
grid minor
plot(xvals1,yvals1);
fill(xvals2,yvals2,'g');
title("Corey O'Brien - Simulation with no thrust, no lift, and no drag");
ylabel("km")
xlabel("km")
legend("Orbit","Earth");




function dstate = odefunc(t,x)

r_ref = 6458;
rho_ref = 7.7*10^(-6);
H = 5;
m = 1000;
S = 1;
mu = 3.986*10^5;
C_d = 0;


dx1 = x(3)*sin(x(4));
dx2 = x(3)/x(1)*cos(x(4));
dx3 = -1/(2*m)*rho_ref*exp((r_ref-x(1))/H)*S*C_d*x(3)*x(3)-mu/(x(1)^2)*sin(x(4));
dx4 = x(3)/x(1)*cos(x(4)) - mu/(x(1)^2*x(3))*cos(x(4));

dstate = [dx1; dx2; dx3; dx4];
end