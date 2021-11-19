a = 1;
k = 1;
c = 1/10;

G = tf([a],[c k])
figure()
bode(G)

angles = linspace(1/1000,10000,10000);
Gangle = -atan(angles./10);
deltaT = Gangle./angles;
figure()
semilogx(angles,deltaT)
title("Time Delay vs Input Signal Frequency")
xlabel("Input frequency (rad/s)")
ylabel("Time delay (s)")