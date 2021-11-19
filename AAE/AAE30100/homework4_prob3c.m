k = sym('k');
t = sym('t');

f = t*sin(t);

p = -1 + -1/2*cos(t) + pi*sin(t) + -2/(1-2^2)*cos(2*t) + -2/(1-3^2)*cos(3*t);

expr = sqrt(1 / (2*pi) * int((f-p)^2,t,0,2*pi));
fprintf("Error is: %.3g\n",vpa(expr))
