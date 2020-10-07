alpha = [-16 -14 -12 -10 -8 -6 -4 -2 0 2 4 6 8 10 12 14 16 18 20];
cl = [ -1 -1.1 -1 -.85 -.6 -.4 -.2 0 .2 .4 .6 .82 .97 1.25 1.45 1.6 1.7 1.5 1.23];
cd = [.012 .013 .012 .009 .008 .007 .006 .0055 .006 .006 .007 .008 .009 .012 .014 .018 .018 .016 .011];

clbycd = cl./cd;

p = polyfit(alpha,clbycd,6);

x1 = linspace(-16,20);
y1 = polyval(p,x1);


figure()
plot(x1,y1);
hold on
grid on
plot(alpha, clbycd,'o');
xline(0);
yline(0);
xlim([-20 24])
ylim([-150 150]);
legend("Fitted Curve of Degree 6","Data Points",'Location','northwest');
xlabel("Angle of Attack (degrees)");
ylabel('$\displaystyle\frac{c_l}{c_d}$','interpreter','latex')
title('$\displaystyle\frac{c_l}{c_d}$ vs. Angle of Attack','interpreter','latex');
set(gca,'FontName','Times');
set(gca,'FontSize',12);
set(get(gca,'ylabel'),'rotation',0)
