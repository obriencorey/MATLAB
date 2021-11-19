R1 = 3;
R2 = 10;
w1 = -5;
w2 = 10;
P1 = 100000;
n = 1000;
rho = 1000;

r = linspace(R1,R2,n);
V = zeros(1,n);
P = zeros(1,n);

for x = 1:n
    V(x) = (R1^2*R2^2*(w2-w1))/(r(x)*(R1^2-R2^2)) + r(x) * (R1^2*w1-R2^2*w2)/(R1^2-R2^2);
    
    P(x) = P1 + rho /(R2^2-R1^2)^2 * ((-w1*R1^2+w2*R2^2)^2*(r(x)^2-(R1+0.01)^2)/2 ...
        -2*R1^2*R2^2*(w2-w1)*(w2*R2^2-w1*R1^2)*(log(r(x))-log(R1+0.01)) ...
        -R1^4*R2^4/2*(w2-w1)^2*(1/(r(x)^2-(R1+0.01)^2)));
end

hold on

title('pressure with $$\omega_1 = -5 \;\; \omega_2 = 10 $$','interpreter','latex');
xlabel("meters");
ylabel("meters")
scalefactor = max(V, [], 'all') / (R2);
V = V./(3*scalefactor);
P = P./1000000;

for n = 1:20
    P(n) = P(20);
end

%for velocity
% plot(r,V,'k')
% plot(-V,r,'k')
% plot(-r,-V,'k')
% plot(V,-r,'k')

%for pressure
plot(r,P,'k')
plot(-P,r,'k')
plot(-r,-P,'k')
plot(P,-r,'k')

r = r(1:70:end);
V = V(1:70:end);
P = P(1:70:end);
z = zeros(1,length(V));

%for velocity
% quiver(r,z,z,V,0,'b')
% quiver(z,r,-V,z,0,'b')
% quiver(-r,z,z,-V,0,'b')
% quiver(z,-r,V,z,0,'b')

%for pressure
quiver(r,z,z,P,0,'b')
quiver(z,r,-P,z,0,'b')
quiver(-r,z,z,-P,0,'b')
quiver(z,-r,P,z,0,'b')


rad = R1;
th = 0:pi/50:2*pi;
xunit = rad * cos(th);
yunit = rad * sin(th);
h = plot(xunit, yunit,'k','Linewidth',5);

rad = R2;
th = 0:pi/50:2*pi;
xunit = rad * cos(th);
yunit = rad * sin(th);
h = plot(xunit, yunit,'k','Linewidth',5);
axis equal