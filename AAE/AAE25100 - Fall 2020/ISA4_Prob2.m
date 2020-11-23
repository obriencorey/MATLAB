RE = 6371;
omega = 7.27 * 10^(-5);
mu = 3.986 * 10^5;
h0 = 100;
mpay = 4500;
g0 = 9.81;

h = linspace(100,2000,20);
dV1 = 8970;     %m/s
dV2 = zeros(1,20);
dV3 = zeros(1,20);
prop1 = zeros(1,20);
prop2 = zeros(1,20);
prop3 = zeros(1,20);

Isp1 = 390;
Isp2 = 420;
Isp3 = 450;

finert1 = .058;
finert2 = .06;
finert3 = 0.063;

for x = 1:20
    %velocities used for deltaV calculations
    Vtrans = sqrt(mu * (2 / (RE + h0) - (1 / ((2 * RE + h0 +h(x)) / 2))));
    Vleo = sqrt(mu / (RE + h0));
    Vfinal = sqrt(mu / (RE + h(x)));
    
    %deltaVs for 2nd and 3rd stage
    dV2(x) = abs(Vtrans - Vleo);
    dV3(x) = abs(Vfinal - Vtrans);
    
    %convert to m/s
    dV2 = dV2(x) * 1000;
    dV3 = dV3(x) * 1000;
    
    
    %initial masses for each stage
    mi_3 = mpay * (exp(dV3 / (Isp3 * g0)) * (1 - finert3)) / (1 - finert3 * exp(dV3 / (Isp3 * g0)));
    mi_2 = mi_3 * (exp(dV2 / (Isp2 * g0)) * (1 - finert2)) / (1 - finert2 * exp(dV2 / (Isp2 * g0)));
    mi_1 = mi_2 * mi_3 * (exp(dV1 / (Isp1 * g0)) * (1 - finert1)) / (1 - finert1 * exp(dV1 / (Isp1 * g0)));
    
    %propellant masses for each stage
    mprop_3 = mpay * ((exp(dV3 / (Isp3 * g0)) - 1) * (1 - finert3)) / (1 - finert3 * exp(dV3 / (Isp3 * g0)));
    mprop_2 = mi_3 * ((exp(dV2 / (Isp2 * g0)) - 1) * (1 - finert2)) / (1 - finert2 * exp(dV2 / (Isp2 * g0)));
    mprop_1 = mi_2 * ((exp(dV1 / (Isp1 * g0)) - 1) * (1 - finert1)) / (1 - finert1 * exp(dV2 / (Isp1 * g0)));
   
    prop1(x) = mprop_1;
    prop2(x) = mprop_2;
    prop3(x) = mprop_3;
    
    if(x == 6)
        fprintf("Stage 1 initial mass: %f. Stage 2 initial mass: %f. Stage 3 initial mass: %f\n",mi_1,mi_2,mi_3);
    end
end

plot(h,dV2,h,dV3)
% plot(h,prop3);
% title("stage 3 propellant mass vs h")
% xlabel("h (km)");
% ylabel("propellant mass (kg)");