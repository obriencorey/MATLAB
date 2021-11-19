omega = 6.97;
G = tf([omega],[1 omega]);
hold on
h = bodeplot(G);
p = getoptions(h);
p.Xlim{1} = [1/1000 10000];
setoptions(h,p)

omegas = linspace(1/10,1000,1000);
mags = 20*log(omega./sqrt(omegas.^2+omega^2));
