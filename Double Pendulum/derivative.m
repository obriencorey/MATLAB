function thetaderivative = derivative(t,x)

L1 = 3;        %length in meters
L2 = 2;
m1 = 5;        %mass in kg
m2 = 1;
g = 9.81; 

dtheta1dt = x(3);    
dtheta2dt = x(4);    

num1 = (-g*(2*m1 + m2)*sin(x(1) - m2*g*sin(x(1) - 2*x(2)) - 2 * sin(x(1) - x(2))*m2*(x(4)*x(4)*L2+x(3)*x(3)*L1*cos(x(1) - x(2)))));
den1 = L1*(2*m1+m2-m2*cos(2*x(1)-2*x(2)));

num2 = (2*sin(x(1)-x(2))*(x(3)*x(3)*L1*(m1+m2)+g*(m1+m2)*cos(x(1))+x(4)*x(4)*L2*m2*cos(x(1)-x(2))));
den2 = (L2*(2*m1+m2-m2*cos(2*x(1)-2*x(2))));

dtheta3dt = num1 / den1;
dtheta4dt = num2 / den2;

thetaderivative = [dtheta1dt; dtheta2dt; dtheta3dt; dtheta4dt];