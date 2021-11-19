Vx = 40; %m/s
Y0 = .5;

t = linspace(0,2);

X0 = 0;
Xf = 7.07;

g = -10;

Xvals = X0 + Vx.*t;
Yvals = Y0 + 1/2 * g * t.^2;

hold on
grid on
xline(0);
xline(7.07);
yline(0);
yline(3);
plot(Xvals,Yvals,'Linewidth',2);