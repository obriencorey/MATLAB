x = 1:100;
f = sin(x);
x1 = [20 35 35 20]
y1 = [0.4 0.4 0.7 0.7]
h=plot(x,f);
p=patch(x1,y1,'b');
hatchfill(p);