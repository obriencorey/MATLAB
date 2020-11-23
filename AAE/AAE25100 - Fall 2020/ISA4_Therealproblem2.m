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
    Vtrans1 = sqrt(mu * ((2 / (RE + h0)) - (1 / ((2 * RE + h0 +h(x)) / 2))));
    Vtrans2 = sqrt(mu * ((2 / (RE + h(x))) - (1 / ((2 * RE + h0 +h(x)) / 2))));
    Vleo = sqrt(mu / (RE + h0));
    Vfinal = sqrt(mu / (RE + h(x)));
    
    %deltaVs for 2nd and 3rd stage
    dV2(x) = abs(Vtrans1 - Vleo);
    dV3(x) = abs(Vfinal - Vtrans2);
    
    
end

plot(h,dV2,h,dV3)
legend('$\displaystyle\Delta$V2','$\displaystyle\Delta$V3','interpreter','latex');
legend('location','northwest');
title('$\displaystyle\Delta$V2 and $\displaystyle\Delta$V3 vs. h','interpreter','latex');
