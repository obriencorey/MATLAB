clear;

%set up all variables, will be inputted later
L = 1;
H = 0.2;
alpha = 50;
angle = alpha;
alpha = alpha*pi/180;
errorlim = 0.0001;
Pa = 100000;
rho = 1;

%set grid resolution x direction
deltax = 0.008;
deltay = deltax; 
Uinf = 50;

xdim = floor(L/deltax);
ydim = floor(H/deltay);

%determine location of valve
valveleft = L/2-H/2*cos(alpha);     %left most point of valve
valveright = L/2+H/2*cos(alpha);    %right most point of valve
valvelength = H*cos(alpha);         %total scalar project onto x axis

%create matrix with coordinates of valve, compatible with grid size
xvalve = linspace(valveleft,valveright,valvelength/deltax);
yvalve = H/2-tan(alpha).*(-L/2+xvalve);             %equation for line through midpoint of valve

%convert these coordinates to indices. expression ensures that no floating
%point rounding error occurs
xvalve = ceil((xdim-1).*xvalve./L + 1);
yvalve = ceil((ydim-1).*yvalve./H + 1);

%apply all boundary conditions
psimat = zeros(xdim,ydim);                          %create matrix, psi(x,0)=0
psimat(:,ydim) = Uinf * H;                          %psi(x,ymax)=U_inf*H
for j = 1:ydim
    psimat(1,j) = Uinf * H * (j-1) / (ydim-1);      %psi on right and left sides
    psimat(xdim,j) = psimat(1,j);                   %is constant gradient
    
    %for first approximation, assume psi is constant along x direction
    %i.e. if no valve was present
    for i = 1:xdim
        psimat(i,j) = psimat(1,j);
    end
      
end

%set psi equal to butterfly valve value
for ctr = 1:length(xvalve)
    psimat(xvalve(ctr),yvalve(ctr)) = Uinf * H/2;
end

errorval = 1;
ctr = 0;
while(errorval > errorlim && ctr < 50)
    newpsi = psimat;
    for i = 2:xdim-1
        for j = 2:ydim-1
            newpsi(i,j) = 1/4 * (psimat(i,j+1) + psimat(i,j-1) + psimat(i+1,j) + psimat(i+1,j));
        end
    end

    %set psi equal to butterfly valve value
    for x = 1:length(xvalve)
        newpsi(xvalve(x),yvalve(x)) = Uinf * H/2;
    end

    errormat = abs(psimat-newpsi);
    errorval = mean(errormat,'all');
    ctr = ctr+1;
    psimat = newpsi;
end

velocityx = zeros(xdim,ydim);
velocityy = zeros(xdim,ydim);

velocityx(1,:)=Uinf;
velocityx(xdim,:)=Uinf;
velocityy(1,:)=0;
velocityy(xdim,:)=0;
for i = 2:xdim-1
    for j = 2:ydim-1
        velocityx(i,j) = (1 / (2*deltax)) * (psimat(i,j+1)-psimat(i,j-1));
        velocityy(i,j) = -(1 / (2*deltay)) * (psimat(i+1,j)-psimat(i-1,j));
    end
end

velocity = sqrt(velocityx.^2 + velocityy.^2);
pressure = Pa + rho * Uinf^2/2 - rho.*velocity.^2/2;

figure();
subplot(2,1,1);
hold on;
matsize = size(velocityx);
q1 = quiver(velocityx',velocityy');
set(q1,'AutoScale','on', 'AutoScaleFactor', 2);

%modify arrays for butterfly valve to plot smoothly
xvalve = linspace(valveleft,valveright,1000);
yvalve = H/2-tan(alpha).*(-L/2+xvalve);
xvalve = (xdim-1).*xvalve./L + 1;
yvalve = (ydim-1).*yvalve./H + 1;

plot(xvalve,yvalve,'k','LineWidth',3);
yline(0,'k','LineWidth',10);
yline(matsize(2),'k','LineWidth',10);

%set title
titlestr = "Velocity Profile Through Channel with Butterfly Valve at ";
str1 = string(angle);
str2 = " degrees, length ";
str3 = string(L);
if(L==1)
    str4 = " meter, height ";
else
    str4 = " meters, height ";
end

if(H==1)
    str6 = " meter";
else
    str6 = " meters";
end
str5 = string(H);

str = strcat(titlestr,str1,str2,str3,str4,str5,str6);

%set axes size and labels
xlabel('x direction (m)')
ylabel('y direction(m)')
title(str);
xlim([-2 matsize(1)+1]);
ylim([-2 matsize(2)+1]);
xticks([0:matsize(1)/5:matsize(1)]);
yticks([0:matsize(2)/5:matsize(2)]);
xticklabels([0:L/5:L]);
yticklabels([0:H/5:H]);
axis equal

subplot(2,1,2);
hold on
[X,Y] = meshgrid(1:xdim,1:ydim);
startx = 1:2:xdim;
starty = ones(size(startx));
streamline(X,Y,velocityx',velocityy',starty,startx);
%set title
titlestr = "Streamlines of Flow Through Channel with Butterfly Valve at ";
str1 = string(angle);
str2 = " degrees, length ";
str3 = string(L);
if(L==1)
    str4 = " meter, height ";
else
    str4 = " meters, height ";
end

if(H==1)
    str6 = " meter";
else
    str6 = " meters";
end
str5 = string(H);

str = strcat(titlestr,str1,str2,str3,str4,str5,str6);

%set axes size and labels
plot(xvalve,yvalve,'k','LineWidth',3);
yline(0,'k','LineWidth',10);
yline(matsize(2),'k','LineWidth',10);
xlabel('x direction (m)')
ylabel('y direction(m)')
title(str);
xlim([-2 matsize(1)+1]);
ylim([-2 matsize(2)+1]);
xticks([0:matsize(1)/5:matsize(1)]);
yticks([0:matsize(2)/5:matsize(2)]);
xticklabels([0:L/5:L]);
yticklabels([0:H/5:H]);
axis equal

figure();
subplot(2,1,1);
hold on

contourf(velocity')
h = colorbar;
set(get(h,'label'),'string','Velocity (m/s)');
%set title
titlestr = "Velocity Profile of Flow Through Channel with Butterfly Valve at ";
str1 = string(angle);
str2 = " degrees, length ";
str3 = string(L);
if(L==1)
    str4 = " meter, height ";
else
    str4 = " meters, height ";
end

if(H==1)
    str6 = " meter";
else
    str6 = " meters";
end
str5 = string(H);

str = strcat(titlestr,str1,str2,str3,str4,str5,str6);

%set axes size and labels
plot(xvalve,yvalve,'k','LineWidth',3);
yline(0,'k','LineWidth',10);
yline(matsize(2),'k','LineWidth',10);
xlabel('x direction (m)')
ylabel('y direction(m)')
title(str);
xlim([-2 matsize(1)+1]);
ylim([-2 matsize(2)+1]);
xticks([0:matsize(1)/5:matsize(1)]);
yticks([0:matsize(2)/5:matsize(2)]);
xticklabels([0:L/5:L]);
yticklabels([0:H/5:H]);

subplot(2,1,2);
hold on
pressure = pressure./1000;
contourf(pressure')
h = colorbar;
set(get(h,'label'),'string','Pressure (KPa)');
%set title
titlestr = "Pressure Distribution of Flow Through Channel with Butterfly Valve at ";
str1 = string(angle);
str2 = " degrees, length ";
str3 = string(L);
if(L==1)
    str4 = " meter, height ";
else
    str4 = " meters, height ";
end

if(H==1)
    str6 = " meter";
else
    str6 = " meters";
end
str5 = string(H);

str = strcat(titlestr,str1,str2,str3,str4,str5,str6);

%set axes size and labels
plot(xvalve,yvalve,'k','LineWidth',3);
yline(0,'k','LineWidth',10);
yline(matsize(2),'k','LineWidth',10);
xlabel('x direction (m)')
ylabel('y direction(m)')
title(str);
xlim([-2 matsize(1)+1]);
ylim([-2 matsize(2)+1]);
xticks([0:matsize(1)/5:matsize(1)]);
yticks([0:matsize(2)/5:matsize(2)]);
xticklabels([0:L/5:L]);
yticklabels([0:H/5:H]);

