%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Corey O'Brien - AAE340 Homework 8 Problem 5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close all

M = 1.987 * 10^(30);

M1 = M;
M2 = .5*M;

tstart = 0;
tstop = 1*10^4;
res = 10^4;
timespan = linspace(tstart,tstop,res);

x1 = 0;
y1 = 0;
x2 = 0;
y2 = 7000; 
x1dot = 0;
y1dot = 0;
x2dot = 9;
y2dot = 0;

xinit = [x1, y1, x2, y2, x1dot, y1dot, x2dot, y2dot];

%opt = odeset('AbsTol',1e-12,'RelTol',1e-12);
[t,x] = ode45(@odefunc,timespan,xinit);

xpos1 = x(:,1);
ypos1 = x(:,2);

xpos2 = x(:,3);
ypos2 = x(:,4);


% figure()
% hold on 
% grid on
% grid minor
% 
% title("Motion of Stars");
% subtitle("Corey O'Brien");
% xlabel("x (km)");
% ylabel("y (km)");
% plot(xpos1,ypos1);
% plot(xpos2,ypos2);
% legend("P1","P2");
% 
% figure()
% hold on 
% grid on
% grid minor
% title("Center of Mass of Stars");
% subtitle("Corey O'Brien");
% xlabel("x (km)");
% ylabel("y (km)");
% xcm = 1/(M1+M2) * (M1*xpos1 + M2*xpos2);
% ycm = 1/(M1+M2) * (M1*ypos1 + M2*ypos2);
% plot(xcm,ycm)
% 
% figure()
% hold on 
% grid on
% grid minor
% title("Velocity of the Center of Mass of Stars");
% subtitle("Corey O'Brien");
% xlabel("x (km/s)");
% ylabel("y (km/s)");
% vxcm = 1/(M1+M2) * (M1*x(:,5) + M2*x(:,7));
% vycm = 1/(M1+M2) * (M1*x(:,6) + M2*x(:,8));
% plot(vxcm,vycm);
% 
% figure()
% hold on 
% grid on
% grid minor
% title("Position Vectors of Stars from Center of Mass");
% subtitle("Corey O'Brien");
% xlabel("x (km)");
% ylabel("y (km)");
% vxcm = 1/(M1+M2) * (M1*x(:,5) + M2*x(:,7));
% vycm = 1/(M1+M2) * (M1*x(:,6) + M2*x(:,8));
% plot(xpos1 - xcm,ypos1 - ycm);
% plot(xpos2 - xcm,ypos2 - ycm);


%uncomment for orbit animation
hold on
grid on 
grid minor 
axis([min(min(xpos1,xpos2)) max(max(xpos1,xpos2)) min(min(ypos1,ypos2)) max(max(ypos1,ypos2))]);
th = 0:pi/50:2*pi;
xunit = 6371 * cos(th);
yunit = 6371 * sin(th);
h = plot(xunit, yunit);

for i = 1:10:length(timespan)
    
%     plot(xpos1(i),ypos1(i),'b.','Markersize',450);
    plot(xpos2(i),ypos2(i),'r.');
    
    drawnow

end

  

function dstate = odefunc(t,x)
G = 6.673 * 10^(-20);
M = 1.987 * 10^(30);

% M1 = M;
% M2 = .1*M;

M1 = 5.972*10^24;
M2 = 50000;

dx1 = x(5);
dx2 = x(6);
dx3 = x(7);
dx4 = x(8);

dx5 = (G*M2 * (x(3)-x(1))) / ((x(3)-x(1))^2+(x(4)-x(2))^2)^(3/2);
dx6 = (G*M2 * (x(4)-x(2))) / ((x(3)-x(1))^2+(x(4)-x(2))^2)^(3/2);
dx7 = (G*M1 * (x(1)-x(3))) / ((x(3)-x(1))^2+(x(4)-x(2))^2)^(3/2);
dx8 = (G*M1 * (x(2)-x(4))) / ((x(3)-x(1))^2+(x(4)-x(2))^2)^(3/2);


dstate = [dx1; dx2; dx3; dx4; dx5; dx6; dx7; dx8];
end