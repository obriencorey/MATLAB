%Initial mass of rocket
%takes number of stages as input and calculates the initial mass of a
%rocket.

dV = 9200;      %m/s
Isp = 360;      %s
m_pay = 1000;   %kg
f_inert = .12;  %dimensionless
g0 = 9.81;      %m/s^2

%uncomment for manual input
%stages = input("Enter the number of stages: ");
initialmasses = zeros(1,6);

for stages = 1:6
    
    dV = 9200 / stages;       %adjust delta V amount for number of stages

    numerator = exp(dV / (g0 * Isp)) * (1 - f_inert);   %from eq
    denominator = 1 - f_inert * exp(dV / (g0 * Isp));   %from eq
    m_initial = m_pay * (numerator / denominator)^stages;

    initialmasses(stages) = m_initial;
    
end

hold on
plot(1,initialmasses(1),'*');   %plot the outlier

initialmasses = initialmasses(2:end);   %format data for exp fit
xmat = (2:6)';                          %format data for exp fit (remove negatives)
f = fit(xmat,initialmasses','exp2');

%plotting formatting
plot(2:6,initialmasses,'color','k','linestyle','none','marker','o');
xline(0);
yline(0);
xlim([-2 8])
ylim([-40000 40000]);
title("initial mass of rocket vs number of stages");
legend("outlier","data points");
legend('location','southeast');
plot(f);
xlabel("number of stages");
ylabel("initial mass of rocket (kg)");
