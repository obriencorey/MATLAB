%Read data from csv file and make stressstrain plot
data = readtable('T886CSV.csv');

time = data(:,3);
force = data(:,5);
extension = data(:,6);

time = time{:,:};
force = force{:,:};
extension = extension{:,:};

A =0.07427175;      %in^2
L0 = 4.296;         %in

stress = force./A;
strain = extension./L0;

hold on
plot(strain,stress,'k');
title("Stress vs. Strain for 2024-T3 Aluminum Alloy");
xlabel("Strain");
ylabel("Stress (ksi)");
yticks([.5e+4 1e+4 1.5e+4 2e+4 2.5e+4 3e+4 3.5e+4 4e+4 4.5e+4])
yticklabels(["5" "10" "15" "20" "25" "30" "35" "40" "45"])
set(gca,'FontName','Times');
set(gca,'FontSize',12);