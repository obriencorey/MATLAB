%AAE 251 Fall 2020
%Homework <Homework 1>
%standardAtmosphere.m
%Authors <Corey O'Brien (obrie187)>

Astart = 0;     %start altitude (km)
Astop = 31;      %stop altitude (km)
Astep = Astop / .25;    %number of altitude increments
altitudes = linspace(Astart,Astop,Astep); %generate list of altitudes
temperatures = zeros(1,Astep);

for x = (1:Astep)
    
    altitude = altitudes(x);
    if(altitude >= 0 && altitude <= 11)     %troposphere
        temperature = 288.16 + altitude * -6.5;
    end
    
    if(altitude > 11 && altitude <= 25)     %tropopause
        temperature = 216.66;
    end
    
    if(altitude > 25 && altitude <= 47)     %stratosphere
        temperature = 216.66 + (altitude - 25) * 3;
    end
    
    if(altitude > 47 && altitude <= 53)     %stratopause
        temperature = 282.66;
    end
    
    if(altitude > 53 && altitude <= 79)     %mesosphere
        temperature = 282.66 + (altitude - 53) * -4.5;
    end
    
    if(altitude > 79 && altitude <= 90)     %mesopause
        temperature = 165.66;
    end
    
    if(altitude > 90)                       %thermosphere
        temperature = 165.66 + (altitude - 90) * 4;
    end
    
    temperatures(x) = temperature;
        
end


hold on
figure(1);
plot(temperatures,altitudes,'r');
title('Temperature Distribution in the Standard Atmosphere');
xlabel('Altitude (Km)');
ylabel('Temperature (k)');
grid on;