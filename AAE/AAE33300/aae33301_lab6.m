CD_smwhiffle = [0.713169363
0.772478479
0.842499234
0.854069369
0.757341784];

RE_smwhiffle = [1.31E+04
2.20E+04
3.07E+04
3.93E+04
4.84E+04];

CD_tennis = [0.725584317
0.70141964
0.708017923
0.720940198
0.67960046];

RE_tennis = [21965.35284
36837.01657
51219.79299
65666.85413
80892.4631];

CD_lgwhiffle = [0.618849748
0.537039824
0.526302674
0.543188896
0.521977649];

RE_lgwhiffle = [24940.18803
41825.96685
58156.64685
74560.31783
91847.97779];

CD_foot = [0.509935588
0.396634584
0.416573662
0.413164865
0.337907961];

RE_foot = [27050.24554
45364.64088
63076.97342
80868.47233
99618.74983];

CD_base = [0.507997345
0.497759818
0.546751275
0.554828623
0.502420311];

RE_base = [24386.73032
40897.79005
56866.06939
72905.71994
89809.7425];

CD_head = [1.656910309
1.481019853
1.43646881
1.409760003
1.210673689];

RE_head = [96647.55249
162082.8729
225367.0892
288934.1582
355926.8376];

CD_shield = [1.40713847
1.261130115
1.195627003
1.080503805
1.007754351];

RE_shield = [96647.55249
162082.8729
225367.0892
288934.1582
355926.8376];

hold on
width = 3;
plot(RE_smwhiffle,CD_smwhiffle,'LineWidth',width)
plot(RE_tennis,CD_tennis,'LineWidth',width)
plot(RE_lgwhiffle,CD_lgwhiffle,'LineWidth',width)
plot(RE_foot,CD_foot,'LineWidth',width)
plot(RE_base,CD_base,'LineWidth',width)
plot(RE_head,CD_head,'LineWidth',width)
plot(RE_shield,CD_shield,'LineWidth',width)
title("Reynolds Number vs Coefficient of Drag")
ylabel("C_D")
xlabel("Re")
legend("Small Whiffle Ball","Tennis Ball","Large Whiffle Ball","Football","Baseball","Head","Head with Faceshield");