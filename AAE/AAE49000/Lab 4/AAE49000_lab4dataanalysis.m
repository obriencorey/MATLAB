clc,clear, close all


specimen = [1
2
3
4
5
6
7
8
9
10
11
12
];

cond = [4.542E-05
4.940E-05
2.866E-05
6.686E-05
7.406E-05
6.292E-05
8.249E-05
7.610E-05
4.502E-05
3.558E-05
5.180E-05
7.960E-05
];

hold on

grid on
set(gca, 'YGrid', 'on', 'XGrid', 'off')
title("Distribution of Element Conductivity");
subtitle("For 0.5 wt %")
ylabel("Number of Elements");
xlabel("Conductivity (S/m)");
h = histogram(cond);
h.BinWidth = 0.000008;
