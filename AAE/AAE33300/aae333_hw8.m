%by corey obrien
%for aae333
%hw 8
%buttefly valve

clear;

%set up all variables, will be inputted later
L = 1;
H = .2;
alpha = -35;
angle = alpha;              %later used for formatting
alpha = alpha*pi/180;
errorlim = 0.0001;
Pa = 100000;
rho = 1;

%set grid resolution x direction
deltax = 0.01;
deltay = deltax; 
Uinf = 50;

%xdim and ydim are the largest indices for matrices
xdim = floor(L/deltax);
ydim = floor(H/deltay);

%determine location of valve
valveleft = L/2-H/2*cos(alpha);     %left most point of valve
valveright = L/2+H/2*cos(alpha);    %right most point of valve
valvelength = H*cos(alpha);         %total scalar projection onto x axis

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

%now loop through all value of y
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

%both used to check conditions on while loop
errorval = 1;
ctr = 0;

%loop through until error converges or until number of 
%loops has been reached
while(errorval > errorlim && ctr < 50)
    %store old matrix in new matrix variable
    newpsi = psimat;
    
    %loop through all x values except for boundaries
    for i = 2:xdim-1
        %loop through all y values except for boundaries
        for j = 2:ydim-1
            %we set the value of psi equal to the average of the four
            %nearby values of psi
            newpsi(i,j) = 1/4 * (psimat(i,j+1) + psimat(i,j-1) + psimat(i+1,j) + psimat(i+1,j));
        end
    end

    %set psi equal to butterfly valve value
    %this restores the boundary conditions
    for x = 1:length(xvalve)
        newpsi(xvalve(x),yvalve(x)) = Uinf * H/2;
    end

    %calculate the difference between old and new matrix
    errormat = abs(psimat-newpsi);
    errorval = mean(errormat,'all');
    ctr = ctr+1;
    psimat = newpsi;
end

%create matrices to store velocity
velocityx = zeros(xdim,ydim);
velocityy = zeros(xdim,ydim);

%we know x velocity at inlet is Uinf
velocityx(1,:)=Uinf;
%we know x velocity at outlet is Uinf
velocityx(xdim,:)=Uinf;
%we know y velocity at inlet is 0
velocityy(1,:)=0;
%we know y velocity at outlet is 0
velocityy(xdim,:)=0;

%loop through all values except boundaries
for i = 2:xdim-1
    for j = 2:ydim-1
        %x velocity is partial psi / partial y
        %but we do discrete version delta psi / delta y
        velocityx(i,j) = (1 / (2*deltax)) * (psimat(i,j+1)-psimat(i,j-1));
        
        %y velocity is partial -psi / partial x
        velocityy(i,j) = -(1 / (2*deltay)) * (psimat(i+1,j)-psimat(i-1,j));
    end
end

%find magnitude of velocity
velocity = sqrt(velocityx.^2 + velocityy.^2);

%using bernoullis find pressure as function of x and y
pressure = Pa + rho * Uinf^2/2 - rho.*velocity.^2/2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%start first figure - velocity vector field
figure();
subplot(2,1,1);
hold on;
matsize = size(velocityx);
q1 = quiver(velocityx',velocityy');
set(q1,'AutoScale','on', 'AutoScaleFactor', 2); %may need to adjust autoscale factor
                                                %so quiver plots nicely

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

str7 = " with grid size ";
str8 = string(deltax);

str = strcat(titlestr,str1,str2,str3,str4,str5,str6,str7,str8);

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

%end first figure - velocity vector field
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%start second figure - streamlines
subplot(2,1,2);
hold on
[X,Y] = meshgrid(1:xdim,1:ydim);
startx = 1:.1:xdim;
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

str7 = " with grid size ";
str8 = string(deltax);

str = strcat(titlestr,str1,str2,str3,str4,str5,str6,str7,str8);

%set axes size and labels
plot(xvalve,yvalve,'k','LineWidth',3);
yline(0,'k','LineWidth',10);
yline(matsize(2),'k','LineWidth',10);
xlabel('x direction (m)');
ylabel('y direction(m)');
title(str);
xlim([-2 matsize(1)+1]);
ylim([-2 matsize(2)+1]);
xticks([0:matsize(1)/5:matsize(1)]);
yticks([0:matsize(2)/5:matsize(2)]);
xticklabels([0:L/5:L]);
yticklabels([0:H/5:H]); 
axis equal
%end second figure - streamlines
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%start third figure - velocity magnitude contour
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

str7 = " with grid size ";
str8 = string(deltax);

str = strcat(titlestr,str1,str2,str3,str4,str5,str6,str7,str8);

%set axes size and labels
plot(xvalve,yvalve,'k','LineWidth',3);
yline(0,'k','LineWidth',5);
yline(matsize(2),'k','LineWidth',5);
xlabel('x direction (m)');
ylabel('y direction(m)');
title(str);
xlim([-3 matsize(1)+2]);
ylim([-3 matsize(2)+2]);
xticks([0:matsize(1)/5:matsize(1)]);
yticks([0:matsize(2)/5:matsize(2)]);
xticklabels([0:L/5:L]);
yticklabels([0:H/5:H]);

axis equal
%end third figure - velocity magnitude contour
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%start fourth figure - pressure contour
subplot(2,1,2);
hold on
pressure = pressure./1000;
contourf(pressure');
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

str7 = " with grid size ";
str8 = string(deltax);

str = strcat(titlestr,str1,str2,str3,str4,str5,str6,str7,str8);

%set axes size and labels
plot(xvalve,yvalve,'k','LineWidth',3);
yline(0,'k','LineWidth',5);
yline(matsize(2),'k','LineWidth',5);
xlabel('x direction (m)');
ylabel('y direction(m)');
title(str);
xlim([-3 matsize(1)+2]);
ylim([-3 matsize(2)+2]);
xticks([0:matsize(1)/5:matsize(1)]);
yticks([0:matsize(2)/5:matsize(2)]);
xticklabels([0:L/5:L]);
yticklabels([0:H/5:H]);

axis equal
%end fourth figure - pressure contour
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

