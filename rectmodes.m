clear
clc
close all

a = 1;
b = 1;
m = 5;
n = 5;
A = 1;

x = linspace(0,a,100);
y = linspace(0,b,100);

[xx,yy] = meshgrid(x,y);

phix = sin(m*pi*xx/a);
phiy = sin(n*pi*yy/b);

W = 1;

figure()

for t = 1:0.1:100
    cla;
    zz = A*phix.*phiy*sin(W*t);
    mesh(xx,yy,zz)
    axis([0 a 0 b -A A]);
    view(45,45)
    drawnow
end