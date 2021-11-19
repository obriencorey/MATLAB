clc;
clear;

xmax = 3;
xmin = -3;
ymax = 3;
ymin = -3;
deltax = 0.2;
deltay = 0.2;

%generate matrix between starting and ending y and x values
[X,Y] = meshgrid(xmin:deltax:xmax,ymin:deltay:ymax);

%constants used throughout the problem
Q = 3e-6;
K = 8.988e9;
d = 1;

%determine size of matrices
xsize = length(X);
ysize = length(Y);

%allocate two matrices to store electric field data
E_x = zeros(xsize,ysize);
E_y = zeros(xsize,ysize);



for x = 1:(xsize)      %loop through all x values
    for y = 1:(ysize)  %loop through all y values
        xcomp = (X(x,y) / ((X(x,y)^2 + Y(x,y)^2)^(3/2)));                   %from first particle
        xcomp = xcomp + (-X(x,y) / (X(x,y)^2 + (Y(x,y)-d)^2)^(3/2));        %from second
        xcomp = xcomp + ((X(x,y)+d) / (((X(x,y)+d)^2 + Y(x,y)^2)^(3/2)));   %from third
        xcomp = Q*K*xcomp;
        E_x(x,y) = xcomp;   %assign to matrix
        
        ycomp = (Y(x,y) / ((X(x,y)^2 + Y(x,y)^2)^(3/2))); 
        ycomp = ycomp + (-(Y(x,y)-d) / (X(x,y)^2 + (Y(x,y)-d)^2)^(3/2));
        ycomp = ycomp + (Y(x,y) / (((X(x,y)+d)^2 + Y(x,y)^2)^(3/2)));
        ycomp = Q*K*ycomp;
        E_y(x,y) = ycomp;
    end
end

%calculate potential energy function
potential = Q*K*(1./sqrt(X.^2+Y.^2) - 1./sqrt(X.^2+(Y-d).^2) + 1./sqrt((X+d).^2+Y.^2));

hold on
plot(-d,0,'ro', 'MarkerSize',8,'LineWidth',2)
plot(0,0,'ro', 'MarkerSize',8,'LineWidth',2,'HandleVisibility','off') %handle visibility off for legend
plot(0,d,'ko', 'MarkerSize',8,'LineWidth',2)

contour(X,Y,potential,30,'g');
streamlines = streamline(X,Y,E_x,E_y,X,Y);
set(streamlines,'color','blue','LineWidth',1);

title("Field Lines and Potential Energy Curves for Problem 2");
xlabel("x(m)");
ylabel("y(m)");
legend("positive particle","negative particle","potential energy","field lines")