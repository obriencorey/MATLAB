%AAE490 lab 7 data analysis
clear all, close all

t_cond = [0.010294
0.027604
0.015437
0.012037
0.149854
0.018389
0.012690
0.010461
0.011246
0.009639
];

l_cond = [0.04203
0.02906
0.06419
0.03935
0.09055
0.04194
0.09788
0.06182
0.03842
0.04661
];

o_cond = [0.000567121
0.000511744
0.000735298
0.000743937
0.001133666
];

nbins = 5;
hold on
axis([0.0003 .0012 0 3.5]);
yticks([1 2 3 4 5]);

grid on
set(gca, 'YGrid', 'on', 'XGrid', 'off')
title('Distribution of Element Conductivity of  CNF modified GFRP','Interpreter','latex', 'FontSize', 15);
subtitle('Out of Plane Measurements','Interpreter','latex');
ylabel('Number of Elements','Interpreter','latex', 'FontSize', 15);
xlabel('Conductivity (S)','Interpreter','latex', 'FontSize', 15);
h = histogram(o_cond);
h.BinWidth = .00005;