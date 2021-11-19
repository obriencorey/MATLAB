theta = linspace(0,pi,1000);
W = zeros(1,1000);
num = 5e5;

for x = 1:1000
    if(tan(theta(x)) * pi^2 * 70e9 * 1/12 * 0.02^4 > num || tan(theta(x)) * pi^2 * 70e9 * 1/12 * 0.02^4 < -num)
        W(x) = 0;
    else
        W(x) = tan(theta(x)) * pi^2 * 70e9 * 1/12 * 0.02^4;
    end
 
end

hold on
xticks
plot(theta,W)
xticks([0 pi/6 pi/3 pi/2  2*pi/3 5*pi/6 pi])
xticklabels({'0','\pi/6','\pi/3','\pi/2','2\pi/3','5\pi/6','\pi'})
xlabel("Angle (radians");
ylabel("Critical Load (newtons)");
title("Angle vs Critical Load");
plot(pi/6,5320,'kx');
text(pi/6,-50000,'30 deg, 5320N')