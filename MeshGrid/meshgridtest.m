x = -7:0.25:7;
y = x;
[X,Y] = meshgrid(x);

F = X.*sin(-X.^2-Y.^2);
surf(X,Y,F)