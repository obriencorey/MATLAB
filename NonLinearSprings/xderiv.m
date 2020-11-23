%{
Filename: 'xderiv.m'

Title: Function for MA26600 assignment

Purpose: Used in ode45

By: Corey O'Brien
%}
function xderivative = xderiv(t,x)

k = 15; %N/M
m1 = 1; %kg
m2 = 2; %kg
m3 = 4; %kg 

f1 = 2*t+1;  %N
f2 = t*t+7; %N
f3 = 5;     %N

dx1dt = x(4);
dx2dt = x(5);
dx3dt = x(6);
dx4dt = (-x(1) * k + (x(3) - x(1)) * 5 * k + (x(2) - x(1)) * k + f1) / m1;
dx5dt = (-(x(2)- x(1)) * k + (x(3) - x(2)) * k + f2) / m2 ;
dx6dt = (-(x(3) - x(2)) * k - (x(3) -x(1)) * 5 * k - x(3) * k + f3) / m3;

xderivative = [dx1dt; dx2dt; dx3dt; dx4dt; dx5dt; dx6dt];
