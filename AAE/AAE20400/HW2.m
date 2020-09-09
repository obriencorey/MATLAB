%lbs
load = [1000 2000 6000 10000 12000 12900 13400 13600 13800 14000 14400 15200 16800 18400 20000 22400 22600];
%inches
elongation = [0.0002 0.0006 0.0019 0.0033 0.0039 0.0043 0.0047 0.0054 0.0063 0.0090 0.0102 0.0130 0.0230 0.0336 0.0507 0.1108 0.12];

stress = load./(pi/4*(.505)^2);
strain = elongation./2;

plot(strain,stress,'k','LineWidth',1.25);
title("STRESS VS. STRAIN FOR HIGH-STRENGTH STEEL");
xlabel("STRAIN");
ylabel("STRESS");
set(gca,'FontName','Poppins');
set(gca,'FontSize',10);