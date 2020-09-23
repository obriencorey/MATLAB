%Read data from csv file and make stressstrain plot
data = readtable('T887CSV.csv');

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
ylabel("Stress (psi)");
set(gca,'FontName','Times');
set(gca,'FontSize',12);