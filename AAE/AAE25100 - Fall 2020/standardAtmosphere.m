%AAE 251 Fall 2020
%Homework <Homework 1>
%standardAtmosphere.m
%Authors <Corey O'Brien (obrie187)>

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constants and Definitions

Astart = 0;                 %start altitude (km)
Astop = 31;                 %stop altitude (km)
Astep = Astop / .25;        %number of altitude increments

altitudes = linspace(Astart,Astop,Astep); %generate list of altitudes

temperatures = zeros(1,Astep);     %generate lists for t,p,rho,s       
pressures = zeros(1,Astep);
densities = zeros(1,Astep);
speedsofsound = zeros(1,Astep);

Etemperatures = zeros(1,Astep);     %generate lists for engineering units       
Epressures = zeros(1,Astep);
Edensities = zeros(1,Astep);
Espeedsofsound = zeros(1,Astep);
Ealtitudes = zeros(1,Astep);
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
    
    %%%%%%%%%%%%%%%%%%%
    %convert to english units
    %temp - K -> R
    %density - kg/m^3 -> slug/ft^3
    %pressure - pa -> lb/ft^2
    %speed of sound - m/s -> feet/s
    %altitude - km -> ft

    Etemperatures(x) = temperatures(x) * 1.8;
    Epressures(x) = pressures(x)* 0.020885434273039;
    Edensities(x) = densities(x) * 0.00194032;
    Espeedsofsound(x) = speedsofsound(x) * 3.28084;
    Ealtitudes(x) = altitudes(x) * 3280.84;
    Ialtitudes(x) = altitudes(x) * 1000;
        
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plots - SI Units
figure();
figure(1);
plot(temperatures,Ialtitudes,'r');
title('Temperature Distribution in the Standard Atmosphere (SI Units)');
xlabel('Temperature (k)');
ylabel('Altitude (m)');

figure();
figure(2);
plot(speedsofsound,Ialtitudes,'r');
title('Speed of Sound Distribution in the Standard Atmosphere (SI Units)');
xlabel('Speed of Sound (m/s)');
ylabel('Altitude (m)');

figure();
figure(3);
plot(pressures,Ialtitudes,'r');
title('Pressure Distribution in the Standard Atmosphere (SI Units)');
xlabel('Pressure (pa)');
ylabel('Altitude (m)');

figure();
figure(4);
plot(densities,Ialtitudes,'r');
title('Density Distribution in the Standard Atmosphere (SI Units)');
xlabel('Density (kg/m^3)');
ylabel('Altitude (m)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plots - English Engineering Units
figure();
figure(5);
plot(Edensities,Ealtitudes,'r');
title('Density Distribution in the Standard Atmosphere (English Engineering Units)');
xlabel('Density (slug/ft^3)');
ylabel('Altitude (ft)');

figure();
figure(6);
plot(Epressures,Ealtitudes,'r');
title('Pressure Distribution in the Standard Atmosphere (English Engineering Units)');
xlabel('Pressure (lb/ft^2)');
ylabel('Altitude (ft)');

figure();
figure(7);
plot(Etemperatures,Ealtitudes,'r');
title('Temperatures Distribution in the Standard Atmosphere (English Engineering Units)');
xlabel('Temperature (R)');
ylabel('Altitude (ft)');

figure();
figure(8);
plot(Espeedsofsound,Ealtitudes,'r');
title('Speed of Sound Distribution in the Standard Atmosphere (English Engineering Units)');
xlabel('Speed of Sound (ft/s)');
ylabel('Altitude (ft)');

