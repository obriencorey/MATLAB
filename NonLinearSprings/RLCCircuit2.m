% 
% Filename: 'RLCCircuits.m'
% 
% Title: RLC Circuits assignment for MA26600 Fall 2020
% 
% Purpose: To simulate the behavior of a RLC Circuit
% 
% By: Corey O'Brien


tstart = 0;     %start and stop times
tstop = 80;
timespan = linspace(tstart,tstop,5000);     %generate list of time steps
L = 1;
C = .2;
R = 4;
omega = 1000;


f = @(t,y) [y(2); 1 / L * (10*cos(omega * t) - (1 / C * y(1)) - R * y(2))];    %define function as system

%first column of y is position and second is velocity 

t0 = 0;         %initial time 
y0 = [0, 0];    %initial values (start position and velocity)

[ts,ys] = ode45(f, timespan, y0);

x = 1;
while(ts(x) < 30)
    x = x+1;
end

ts = ts(x:end);
ys = ys(:,1);
ys = ys(x:end);
maxline = zeros(length(ys),1);
maximum = 0;
for y = 1 : length(ys)
    if(abs(ys(y)) > maximum)
        maximum = abs(ys(y));
    end
end

for y = 1:length(ys)
    maxline(y) = maximum;
end
    
hold on
plot(ts,ys(:,1),'b')              % plot solution y(t)
plot(ts,maxline,'r')
title(['charge on capacitor and A(ω) with respect to time (omega = ', num2str(omega),')'])
xlabel('time'); 
ylabel('charge');
legend('charge','A(ω)');
legend('location','southwest');
grid on
   