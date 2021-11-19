%HW8 Problem1
% File: HW8_Prob2_brasmuse.m
% Date: 3/26 2021
% By: Benjamin Rasmusen
% Brasmuse
% Section: 2
% Team: 16
% 
% ELECTRONIC SIGNATURE
% Benjamin rasmusen
% 
% The electronic signature above indicates that the program
% submitted for evaluation is my individual work. I have
% a general understanding of all aspects of its development
% and execution.
% 
% 3 points give off an electric field and also electrical potential energy.
%This program will map them on a graph.

% ---------------------------------------------------
%   Inputs
% ---------------------------------------------------
clc
clear 

x = [-3.0:0.2:3.0];
y= [-3.0:0.2:3.0];


[X,Y] = meshgrid(x,y);
V = 27000*(-1./((X.^2+Y.^2).^.5)-1./(((x+1).^2+Y.^2).^.5)+1./((X.^2+(Y-1).^2).^.5));
hold on
plot(-1,0,'o','MarkerEdgeColor',"Black","Linewidth",1);
viscircles([0,0],0.05,'Color','Black',"Linewidth",1);
plot(0,1,'o','MarkerEdgeColor',"Black","Linewidth",1);
contour(X,Y,V,25,'g');
axis equal

Xcomp = 27000*((X)./((X.^2+Y.^2).^1.5)+(X+1)./(((x+1).^2+Y.^2).^1.5)+(-X)./((X.^2+(Y-1).^2).^1.5));
Ycomp = 27000*((Y)./((X.^2+Y.^2).^1.5)+(Y)./(((x+1).^2+Y.^2).^1.5)+(1-Y)./((X.^2+(Y-1).^2).^1.5));
%quiver(X,Y,Xcomp,Ycomp,'filled');
streamline(X,Y,Xcomp,Ycomp,X,Y)

xlabel("x(m)")
ylabel("y(m)")
title("Potential Energy Curves and Field Lines for HW8 Problem 2")
legend({"Positive Charge", "Negative Charge", "Potential Energy Curves", "Field Lines"}, "location", "southwest");
