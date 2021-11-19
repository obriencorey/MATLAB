x = [-9.01 -0.493 -0.493];
y = [0 0.931 -0.931];

figure()
hold on
grid on
plot(x,y,'k.','Markersize',14)
xlabel("real")
ylabel("imag")
title("Plot of Poles of Close Loop Control System");
yline(0)
xline(0)
hold off

figure()
YbyR = tf([10 1],[1 10 10 10]);
step(YbyR)