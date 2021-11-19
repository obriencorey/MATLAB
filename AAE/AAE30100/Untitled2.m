k_i = 0;
k_p = 1;
k_d = 1;
N = 10;

A = [0 1
    0 -N];
B = [0
    1];
C = [N*k_i k_i+N*k_i-N^2*k_d-k_p*N];
D = N*k_d+k_p;

[out1 out2] = ss2tf(A,B,C,D);

H22 = tf([out1],[out2]);
A = [0 1
    0 -N];
B = [0
    1];
C = [N*k_i N*k_p-N^2*k_d];
D = N*k_d;

[out1 out2] = ss2tf(A,B,C,D);

H23 = tf([out1],[out2]);

hold on
bode(H22)
bode(H23)
legend("H_22(s)","H_23(s)");