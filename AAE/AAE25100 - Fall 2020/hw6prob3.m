Isp1 = 350;        %Isp for first stage
Isp2 = 470;        %Isp for second stage
Finert1 = 0.05;    %inert fraction for first stage
Finert2 = 0.07;    %inert fraction for the second stage

dV = 9200;      %m/s
m_pay = 1000;   %kg
g0 = 9.81;      %m/s^2

f1 = linspace(0,1,10000);        %values for f1
minit = zeros(1,10000);
massmin = realmax;

for x = 1:10000
    f2 = 1 - f1(x);
    
    dV1 = f1(x) * 9200;
    dV2 = f2 * 9200;
    %for first stage
    numerator1 = exp(dV1 / (g0 * Isp1)) * (1 - Finert1);   %from eq
    denominator1 = 1 - Finert1 * exp(dV1 / (g0 * Isp1));   %from eq
    %for second stage
    numerator2 = exp(dV2 / (g0 * Isp2)) * (1 - Finert2);   %from eq
    denominator2 = 1 - Finert2 * exp(dV2 / (g0 * Isp2));   %from eq
    %find initial mass
    minit(x) = m_pay * (numerator1 / denominator1) * (numerator2 / denominator2);
    
    %calculate minimum values
    if(minit(x) < massmin)
        massmin = minit(x);
        f1min = f1(x);
    end

end

hold on
xlim([-.5 1.3])
ylim([-2000 60000]);
plot(f1min,massmin,'color','k','linestyle','none','marker','o')
plot(f1,minit);
xline(0);
yline(0);
legend("minimum initial mass","f1 vs m_0");
legend('location','northwest');
title("f_1 vs initial mass of rocket")
xlabel("f_1");
ylabel("initial mass of rocket (kg)");
text(f1min,massmin - 3000,['(',num2str(f1min),',',num2str(massmin),')']);