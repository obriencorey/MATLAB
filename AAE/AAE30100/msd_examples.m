M = diag([1, 2]);
Phi = [1, -0.1;
       -0.1, 3];
K = diag([1, 1]);
b = [0;1];

n = 2;
M_I = inv(M);
A = [zeros(n), eye(n);
     -M_I*K, -M_I*Phi];
B = [zeros(n, 1); M_I*b];
C = [eye(2), zeros(2)];
D = zeros(2, 1);

t = linspace(0, 100, 1000);
u = 10*ones(1, length(t));
sys = ss(A, B, C, D);
y = lsim(sys, u, t);

disp(charpoly(A));
disp(roots(charpoly(A)));
disp(eig(A));

plot(t, y)


[num, den] = ss2tf(A, B, C, D);
G1 = tf(num(1, :), den);
G2 = tf(num(2, :), den);

disp(G1)
disp(G2)

step(10*sys)