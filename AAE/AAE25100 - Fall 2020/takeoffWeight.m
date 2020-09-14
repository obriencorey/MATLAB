%AAE 251 Fall 2020
%Homework <Homework 2>
%takeoffWeight.m
%Authors <Corey O'Brien (obrie187)>

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Types = ["SPU" "SPP" "HMW" "HMC" "GAS" "GAT" "AGA" "TWN" "FBT" "TRN" "FHT" "MIL" "JET"];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inputs
units = input("Enter unit type in double qoutes (SI or EE): ");

if(units == "EE")
    range = input("Enter range (ft): ");
    payloadWeight = input("Enter payload weight (lbs): ");
    cruiseSpeed = input("Enter cruise speed (ft/s): ");
else
    range = input("Enter range (m): ");
    range = range * 3.28084;
    payloadWeight = input("Enter payload weight (Kg): ");  
    payloadWeight = payloadWeight * 2.20462;
    cruiseSpeed = input("Enter cruise speed (m/s): ");
    cruiseSpeed = cruiseSpeed * 2.20462;
    
end

%A in the empty weight fraction 
EmptyA = [0.86 0.91 1.19 1.15 2.36 1.51 0.74 0.96 1.09 1.59 2.34 0.93 1.02];
%C in the empty weight fraction
EmptyC = [-0.05 -0.05 -0.09 -0.09 -0.18 -0.10 -0.03 -0.05 -0.05 -0.10 -0.13 -0.07 -0.06];

%create map between types and constants
EmptyWeightFracA = containers.Map(Types, EmptyA);
EmptyWeightFracC = containers.Map(Types, EmptyC);

%input users engine type
fprintf("Enter engine type (Turbojet, LBTurboFan, HBTurbofan \n");
engineType = input("Fixedpitchprop, Variablepitch, Turboprop): ");

%determine specific fuel consumption using switch statement
switch engineType
    case "Turbojet"
        cruise = 0.9; %1/s
        loiter = 0.8;
        guess = 50000;
    case "LBTurboFan"
        cruise = 0.8; %1/s
        loiter = 0.7 ;
        guess = 75000;
    case "HBTurboFan"
        cruise = 0.5; %1/s
        loiter = 0.4;
        guess = 100000;
    case "Fixedpitchprop"
        cruise = (0.4) * (cruiseSpeed / (550 * 0.8));
        loiter = (0.5) * (cruiseSpeed / (550 * 0.8));
        guess = 25000;
    case "Variablepitch"
        cruise = (0.4) * (cruiseSpeed / (550 * 0.8));
        loiter = (0.5) * (cruiseSpeed / (550 * 0.8));
        guess = 10000;
    case "Turboprop"
        cruise = (0.5) * (cruiseSpeed / (550 * 0.8));
        loiter = (0.6) * (cruiseSpeed / (550 * 0.8));
        guess = 50000;
    otherwise
        cruise = 0.5; 
        loiter = 0.4;
        guess = 50000;
end 

LDratio = input("Enter lift to drag ratio: ");
LoiterTime = input("Enter loiter time (s): ");

type = "help";
while(type == "help" || type == "Help" || type == "HELP")
    type = input("Enter your aircraft type in double qoutes (or enter ""help"" for options): ");

    if(type == "help" || type == "Help" || type == "HELP")
        fprintf("---------------------------------------------------------\n");
        fprintf("--- \tHere is a list of acceptable type arguments   ---\n");
        fprintf("---\t\tAircraft Type \t\t\t\t\t ""ARG""        ---\n");
        fprintf("---------------------------------------------------------\n");
        fprintf("\t\tSail Plane (unpowered) \t\t\t ""SPU""\n");
        fprintf("\t\tSail Plane (powered) \t\t\t ""SPP""\n");
        fprintf("\t\tHomebuilt (metal/wood) \t\t\t ""HMW""\n");
        fprintf("\t\tHomebuilt (composite) \t\t\t ""HMC""\n");
        fprintf("\t\tGeneral Aviation (single) \t\t ""GAS""\n");
        fprintf("\t\tGeneral Aviation (twin) \t\t ""GAT""\n");
        fprintf("\t\tAgricultural Aircraft \t\t\t ""AGA""\n");
        fprintf("\t\tTwin Turboprop \t\t\t\t\t ""TWN""\n");
        fprintf("\t\tFlying Boat \t\t\t\t\t ""FBT""\n");
        fprintf("\t\tJet Trainer  \t\t\t\t\t ""TRN""\n");
        fprintf("\t\tJet Fighter \t\t\t\t\t ""FHT""\n");
        fprintf("\t\tMilitary Cargo/Bomber \t\t\t ""MIL""\n");
        fprintf("\t\tJet Transport \t\t\t\t\t ""JET""\n");

    end
end

WEFrac = 0.97 * .985;   %takeoff and climb
WEFrac = WEFrac * exp((-range * (cruise / 2600)) / (cruiseSpeed * LDratio * 0.866)); %cruise
WEFrac = WEFrac * exp((-LoiterTime * (loiter / 3600)) / (LDratio));  %loiter
WEFrac = WEFrac * 0.995;    %descend

WEFrac = 1.06 * (1 - WEFrac); %added fraction for safety 



frac = .9 * EmptyWeightFracA(type) * guess ^ EmptyWeightFracC(type); %fraction calculated using guess
EmptyWeight = payloadWeight / (1 - WEFrac - frac);
guess = guess + (guess - EmptyWeight) * .5;
counter = 1;

%loop through 20 times to converge upon actual takeoff weight
while(counter < 5)
    EmptyWeight = payloadWeight / (1 - WEFrac - frac);

    guess = guess + (guess - EmptyWeight) * .5;
    counter = counter + 1;
end
fprintf("The empty weight is: %.2fkg\n",EmptyWeight);


