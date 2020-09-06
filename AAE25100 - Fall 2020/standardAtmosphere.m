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

R = .286;       %kj/kg/k
Gamma = 1.4;    %Dimensionless,
G = 9.81        %m/s

pressure = 101325; %kpa

gradient = 1; %1 if altitude is in gradient, 0 if not
referenceA = 0; %reference altitude for gradient ranges
referenceP = 0; %reference pressure for gradient ranges
referenceR = 0; %reference density for gradient ranges
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for x = (1:Astep)
    
    altitude = altitudes(x);
    if(altitude >= 0 && altitude <= 11)     %troposphere
        temperature = 288.16 + altitude * -6.5;
        gradient = 1;
        
        referenceA = 0;             %km
        referenceP = 101325;        %pa
        referenceR = 1.225;         %kg/m^3
    end
    
    if(altitude > 11 && altitude <= 25)     %tropopause
        temperature = 216.66;
        gradient = 0;
    end
    
    if(altitude > 25 && altitude <= 47)     %stratosphere
        temperature = 216.66 + (altitude - 25) * 3;
        gradient = 1;
        referenceA = 25;               %km
        referenceP = 2527.3;           %pa
        referenceR = 0.040639;         %kg/m^3
    end
    
    if(altitude > 47 && altitude <= 53)     %stratopause
        temperature = 282.66;
        gradient = 0;
    end
    
    if(altitude > 53 && altitude <= 79)     %mesosphere
        temperature = 282.66 + (altitude - 53) * -4.5;
        gradient = 1;
        referenceA = 53;
    end
    
    if(altitude > 79 && altitude <= 90)     %mesopause
        temperature = 165.66;
        gradient = 0;
    end
    
    if(altitude > 90)                       %thermosphere
        temperature = 165.66 + (altitude - 90) * 4;
        gradient = 1;
        referenceA = 90;
    end
    
    temperatures(x) = temperature;
    speedsofsound(x) = sqrt((Gamma * R * temperature) * 1000);
    
    if(gradient)
        pressures(x) = pressure
    else
    end
    
    
        
end

figure();
figure(1);
plot(temperatures,altitudes,'r');
title('Temperature Distribution in the Standard Atmosphere');
xlabel('Altitude (Km)');
ylabel('Temperature (k)');

figure();
figure(2);
plot(speedsofsound,altitudes,'g');
title('Altitude Vs. Speed of Sound');
xlabel('Speed of Sound (m/s)');
ylabel('Altitude (Km)');


