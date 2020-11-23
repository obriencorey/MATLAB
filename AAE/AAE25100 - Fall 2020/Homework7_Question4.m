
Steps = 1000;       %Number of steps for velocity
Vdc3 = linspace(20,300,1000);       %Arrays for velocity of aircraft

Mdc3 = 11431;           %mass of dc 3
Wdc3 = 9.81 * Mdc3;
Adc3 = 91.7;        %m^2
CD0dc3 = 0.0267;
efficiency = 0.7;
AR = 9.17;
DragConstantdc3 = 1 / (pi * AR * efficiency);

Rsealevel = 1.225;          %kg/m^3
Raltitude = 1.6480 * 10^(-3) * (14.5939 / 0.0283168); %convert to kg/m^3

Powerdc3 = zeros(1,Steps);

Pmax = 2 * 890;     %kw
PropEfficiency = 0.8;
Pmaxactual = Pmax * (Raltitude / Rsealevel) * PropEfficiency;

for x = 1:Steps
    %LandDfromV(Velocity,Weight,CD0,DragConstant,Area,Rho)
    %function with inputs for reference
    
    Datadc3 = LandDfromV(Vdc3(x),Wdc3,CD0dc3,DragConstantdc3,Adc3,Raltitude); %matrix of lift and drag
    Powerdc3(x) = ((Vdc3(x) * Wdc3) / (Datadc3(1) / Datadc3(2))) / 1000;    %convert to kW
    
end

plot(Vdc3,Powerdc3);
yline(Pmaxactual);
xlabel("velocity (m/s)");
ylabel("power required (KW)");
