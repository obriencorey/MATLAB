G = tf([1 0 9],[1 3 2]);

t = 0:0.04:10; 
u = cos(3*t);
ss = -112*cos(7*t+0.825) + 39*sin(4*t+1.35);
func = .5 + (1-(-1)^1)/(1*pi)*sin(t)+(1-(-1)^2)/(2*pi)*sin(t);;
hold on
plot(t,func)
title("u(t) with ideal low pass filter \lambda_0 = 2.5");
xlabel("time");
ylabel("u(t)");
%lsim(G,u,t,'k')
% plot(t,ss)
% legend("y(t)","y_{ss}(t)");

