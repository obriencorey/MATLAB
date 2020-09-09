radii = [7,8,9,10,13,14];

strainWheat = [
0.006901620743
0.005938320321
0.005397734009
0.004870696225
0.004048300506
0.003696038749
];

strainTheory = [
0.00795
0.00696
0.00619
0.00558
0.0043
0.00399
];

strainVirtual = [
0.007909286098
0.006935050993
0.006174181428
0.005563607085
0.004291465378
0.00398819109
];

hold on
plot(radii,strainWheat,'r','LineWidth',2)
plot(radii,strainTheory,'b','LineWidth',2)
plot(radii,strainVirtual,'g','LineWidth',2)
yticks([.003 .0035 .004 .0045 0.005 .0055 .006 .0065 .007 .0075 .008 .0085 .009 .0095])
yticklabels({'.003','.0035','.004','.0045','.005', '.0055' ,'.006' ,'.0065', '.007' ,'.0075' ,'.008' ,'.0085' ,'.009' ,'.0095'});
xlabel("Curvature(inches)");
ylabel("Strain");
legend("Experimental","Theoretical","Virtual")
grid on
set(gca,'FontName','Arial');
set(gca,'FontSize',14);
hold off