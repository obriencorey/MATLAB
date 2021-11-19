clear;
clc;

freq = [10 15 20 25 30]; %hz
velocity = [5.93 9.04 12.2 15.5 18.8]; %m/s
rho = 1.225; %kg/m^3
mu = 18.03e-6;
LBtoN = 4.44822;
in2tom2 = 0.00064516;

%in pounds
Hplatelift = [0.063529
0.148943
0.272006
0.453419
0.692679
]';

Hplatedrag = [0.016655
0.039291
0.070476
0.120061
0.181924]';

Vplatelift = [0.024719
0.027994
0.024357
0.013236
-0.019034
]';

Vplatedrag = [0.481285
1.235417
2.403945
3.959387
5.907503
]';

Smcylinderlift = [0.025972
0.025783
0.028623
0.032107
0.039112
]';

Smcylinderdrag = [0.019478
0.054919
0.104369
0.179207
0.277661
]';

Bgsmoothcylinderlift = [0.020951
0.028739
0.028126
0.040073
0.027921
]';

Bgsmoothcylinderdrag = [0.194729
0.518748
1.015567
1.710088
2.517111
]';

Bgroughcylinderlift = [0.03125
0.029535
0.006372
-0.013603
-0.099797
]';

Bgroughcylinderdrag = [0.18745
0.465239
0.862391
1.435319
2.092639
]';

foilforwardlift = [0.097555
0.225229
0.405033
0.656667
0.964736
]';

foilforwarddrag = [0.010352
0.02479
0.042452
0.067598
0.099506
]';

foilbackwardlift = [0.044997
0.070272
0.106708
0.164918
0.248158
]';

foilbackwarddrag = [0.012218
0.030752
0.05899
0.102169
0.159117
]';

Hplatedrag = LBtoN.*Hplatedrag;
Vplatedrag = LBtoN.*Vplatedrag;
Smcylinderdrag = LBtoN.*Smcylinderdrag;
Bgsmoothcylinderdrag = LBtoN.*Bgsmoothcylinderdrag;
Bgroughcylinderdrag = LBtoN.*Bgroughcylinderdrag;
foilforwarddrag = LBtoN.*foilforwarddrag;
foilbackwarddrag = LBtoN.*foilbackwarddrag;

HplateA = in2tom2 * (0.231*17.5);
VplateA = in2tom2 * (4*17.5);
BgsmoothA = in2tom2 * (17*3.5);
BgroughA = BgsmoothA;
Smcylinder = in2tom2 * (17*0.5);
AirfoilA = in2tom2 * (4.75 * 11.5);

CD_hplate = zeros(1,5);
CD_vplate = zeros(1,5);
CD_bgsmooth = zeros(1,5);
CD_bgrough = zeros(1,5);
CD_small = zeros(1,5);
CD_foilforward = zeros(1,5);
CD_foilbackward = zeros(1,5);

Re_hplate = zeros(1,5);
Re_vplate = zeros(1,5);
Re_bgsmooth = zeros(1,5);
Re_small = zeros(1,5);
Re_foil = zeros(1,5);

for x = 1:5
    CD_hplate(x) = Hplatedrag(x) / (.5 * rho * velocity(x)*velocity(x) * HplateA);
    CD_vplate(x) = Vplatedrag(x) / (.5 * rho * velocity(x)*velocity(x) * VplateA);
    CD_bgsmooth(x) = Bgsmoothcylinderdrag(x) /  (.5 * rho * velocity(x)*velocity(x) * BgsmoothA);
    CD_bgrough(x) = Bgroughcylinderdrag(x) / (.5 * rho * velocity(x)*velocity(x) * BgsmoothA);
    CD_small(x) = Smcylinderdrag(x) / (.5 * rho * velocity(x)*velocity(x) * Smcylinder);
    CD_foilforward(x) = foilforwarddrag(x) / (.5 * rho * velocity(x)*velocity(x) * AirfoilA);
    CD_foilbackward(x) = foilbackwarddrag(x) / (.5 * rho * velocity(x)*velocity(x) * AirfoilA);
    
    Re_hplate(x) = (rho * velocity(x) *  0.0058674) / mu;
    Re_vplate(x) = (rho * velocity(x) *  0.1016) / mu;
    Re_bgsmooth(x) = (rho * velocity(x) * 0.0889 ) / mu;
    Re_small(x) = (rho * velocity(x) *  0.0127) / mu;
    Re_foil(x) = (rho * velocity(x) *  0.12065) / mu;
    
end

hold on

plot(Re_hplate,CD_hplate,'Linewidth',2);
plot(Re_vplate,CD_vplate,'Linewidth',2);
plot(Re_bgsmooth,CD_bgsmooth,'Linewidth',2);
plot(Re_bgsmooth,CD_bgrough,'Linewidth',2);
plot(Re_small,CD_small,'Linewidth',2);
plot(Re_foil,CD_foilforward,'Linewidth',2);
plot(Re_foil,CD_foilbackward,'Linewidth',2);
title("Reynolds Number vs Coefficient of Drag")
ylabel("C_D")
xlabel("Re")
legend("Horizontal Plate","Vertical Plate","Big Smooth Cylinder"...
    ,"Big Rough Cylinder","Small Cylinder","Airfoil Forward","Airfoil Backward");
