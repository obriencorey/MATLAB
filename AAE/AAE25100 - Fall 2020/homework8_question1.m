%AAE 251 Fall 2020
%Homework <Homework 8>
%homework8question1.m
%Authors <Corey O'Brien (obrie187)>

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constants and Definitions

Astart = 0;                 %start altitude (km)
Astop = 31;                 %stop altitude (km)
Astep = Astop / .1;        %number of altitude increments

altitudes = linspace(Astart,Astop,Astep); %generate list of altitudes

temperatures = zeros(1,Astep);     %generate lists for t,p,rho,s       
pressures = zeros(1,Astep);
densities = zeros(1,Astep);
speedsofsound = zeros(1,Astep);
Ialtitudes = zeros(1,Astep);            %Needed for SI unit of length

R = .286;       %kj/kg/k
Gamma = 1.4;    %Dimensionless,
G = 9.81;        %m/s

pressure = 101325; %kpa

gradient = 1; %1 if altitude is in gradient, 0 if not
referenceA = 0; %reference altitude for gradient ranges
referenceP = 0; %reference pressure for gradient ranges
referenceR = 0; %reference density for gradient ranges
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%loop through and first find the temperature for the altitude.
%then find if it is a gradient or isotherm
%find the pressure using the appropriate formula
%and calculate density using equation of state
for x = (1:Astep)
    
    altitude = altitudes(x);
    if(altitude >= 0 && altitude <= 11)     %troposphere
        temperature = 288.16 + altitude * -6.5;
        gradient = 1;
        
        referenceA = 0;             %km
        referenceP = 101325;        %pa
        referenceR = 1.225;         %kg/m^3
        referenceT = 288.16;        %K
        a = -6.5;
    end
    
    if(altitude > 11 && altitude <= 25)     %tropopause
        temperature = 216.66;
        gradient = 0;
        referenceA = 11;             %km
        referenceP = 22700;        %pa
        referenceT = temperature;        %K
    end
    
    if(altitude > 25)     %stratosphere
        temperature = 216.66 + (altitude - 25) * 3;
        gradient = 1;
        referenceA = 25;               %km
        referenceP = 2527.3;           %pa
        referenceR = 0.040639;         %kg/m^3
        referenceT = 216.66;           %k
        a = 3;
    end
    
    
    temperatures(x) = temperature;
    speedsofsound(x) = sqrt((Gamma * R * temperature) * 1000);
    
    if(gradient)
        pressures(x) = referenceP * (temperature / referenceT) ^ ((-G) / (a * R));
        
    else
        pressures(x) = referenceP * exp(-(G / (R * temperature)) * (altitude - referenceA));
    end
    
    densities(x) = pressures(x) / (R * temperatures(x) * 1000);    
    Ialtitudes(x) = altitudes(x) * 1000;
        
end

%constants for power required
K = 0.054;
M = 1315;       %kg
S = 16.3;       %m^2
CD0 = 0.026;
P0 = 216;    %Kw
eta = 0.8;
mad = 0.6;

powermin = zeros(1,Astep);      %generate matrix for minimum power required
poweravail = zeros(1,Astep);    %generate matrix for power available

for y = (1:Astep)
    
    poweravail(y) = (densities(y) / 1.225)^ mad * P0 * eta;
    powermin(y) =  4 / 3 *sqrt((2 * (M * G)^3) / (densities(y) * S) * sqrt(3 * K^3 * CD0));
    powermin(y) = powermin(y) / 1000;
    
    
end

plot(Ialtitudes,poweravail,Ialtitudes,powermin);
legend("power available", "minimum power required");
legend('location','northwest');
xlabel("altitude (m)");
ylabel("power (kW)");