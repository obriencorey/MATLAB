%AAE 251 Fall 2020
%ISA <ISA8>
%ISA5_Question1.m
%Authors <Corey O'Brien (obrie187)>

MTOW = 4750;            %kg
Wempty = 2810;          %kg
Wmaxfuel = 1225;        %kg

Crew = 1; 
WCrew = 65;             %kg

Passenger = 8;          
WPassenger = 75;        %kg
WLuggage = 25;          %kg

LtoD = 15;              %lift to drag ratio
eta = 0.8;              %propeller efficiency
ct = 7.16e-07;          %specific fuel consumption 1/m

Takeoff = 0.995;        %Fuel fractions for various phases of the flight
Climb = 0.98;
Descent = 0.99;
Loiter = 0.987;
Land = 0.992;

%for point A
%-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
%Find the remaining weight that can be used to store fuel
fuelweight = MTOW - (Wempty + Crew * WCrew + Passenger * (WPassenger + WLuggage)); 

%adjust for takeoff and climb fractions
fuelweight = fuelweight * Takeoff * Climb;

%M1 is the the weight without the fuel burned during climb and takeoff
M1 = Wempty + Crew * WCrew + Passenger * (WPassenger + WLuggage) + fuelweight;
%adjust for descent, loiter, and land
fuelweight = fuelweight - (fuelweight * (1 - Descent) + fuelweight * (1-Loiter) + fuelweight * (1 - Land));

%Weight 2 is the fuel available leaving fuel for descent landing and loiter
M2 = M1 - fuelweight;

%range at point A
RangeA = eta / ct * LtoD * log(M1 / M2) * (1 / 1000);     %km
PayloadA = Passenger * (WPassenger + WLuggage);

%for point B
%-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
WLuggage = MTOW - (Wmaxfuel + Wempty + Crew * WCrew + Passenger * WPassenger);
WLuggage = WLuggage / 8;

%adjust for takeoff and climb fractions
fuelweight = Wmaxfuel * Takeoff * Climb;

M1 = Wempty + Crew * WCrew + Passenger * (WPassenger + WLuggage) + fuelweight;

%adjust for descent, loiter, and land
fuelweight = fuelweight - (fuelweight * (1 - Descent) + fuelweight * (1-Loiter) + fuelweight * (1 - Land));
M2 = M1 - fuelweight;
RangeB = eta / ct * LtoD * log(M1 / M2) * (1 / 1000);     %km
PayloadB = Passenger * (WPassenger + WLuggage);

%for point C
%-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
%adjust for takeoff and climb fractions
fuelweight = Wmaxfuel * Takeoff * Climb;

M1 = Wempty + Crew * WCrew + fuelweight;

%adjust for descent, loiter, and land
fuelweight = fuelweight - (fuelweight * (1 - Descent) + fuelweight * (1-Loiter) + fuelweight * (1 - Land));
M2 = M1 - fuelweight;
RangeC = eta / ct * LtoD * log(M1 / M2) * (1 / 1000);     %km
PayloadC = 0;

hold on
grid on

%plot data on plot
plot(RangeA,PayloadA,'r*')
text(RangeA,PayloadA + 60,"full payload")
plot(RangeB,PayloadB,'r*')
text(RangeB,PayloadB + 60,"full fuel")
plot(RangeC,PayloadC,'r*')
text(RangeC,PayloadC + 60,"no payload")

%create lines to connect points
plot([0 RangeA], [PayloadA PayloadA],'k')
plot([RangeA RangeB], [PayloadA PayloadB],'k')
plot([RangeB RangeC], [PayloadB PayloadC],'k')
xlim([-300 6000]) 
ylim([-50 900])
xline(0);
yline(0);
title("Range vs Payload")
xlabel("Range (km)");
ylabel("Payload (kg)");