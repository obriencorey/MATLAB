%Homework6_Question1

Steps = 1000;       %Number of steps for velocity
Vjet = linspace(50,300,1000);       %Arrays for velocity of aircraft
Vprop = linspace(20,150,1000);

Mjet = 33100;       %kg
Wjet = 9.81 * Mjet;
Ajet = 88.2;        %m^2
CD0jet = 0.015;
DragConstantjet = 0.05;

Mprop = 1315;       %kg
Wprop = 9.81 * Mprop;
Aprop = 16.3;       %m^2
CD0prop = 0.026;
DragConstantprop = 0.054;

R = 1.225;          %kg/m^3

Thrustjet = zeros(1,Steps);
Powerprop = zeros(1,Steps);

for x = 1:Steps
    %LandDfromV(Velocity,Weight,CD0,DragConstant,Area,Rho)
    Datajet = LandDfromV(Vjet(x),Wjet,CD0jet,DragConstantjet,Ajet,R); %matrix of lift and drag
    Thrustjet(x) = Wjet / (Datajet(1) / Datajet(2));                  %divide to find thrust required
    
    Dataprop = LandDfromV(Vprop(x),Wprop,CD0prop,DragConstantprop,Aprop,R);
    Powerprop(x) = Vprop(x) * (Wprop / (Dataprop(1) / Dataprop(2)));
end

figure();
plot(Vjet, Thrustjet);
title("Thrust required for jet aircraft");
xlabel("velocity (m/s)");
ylabel("thrust required (N)");

figure()
plot(Vprop,Thrustprop)
title("Power required for propeller aircraft");
xlabel("velocity (m/s)");
ylabel("power required (W)");

    