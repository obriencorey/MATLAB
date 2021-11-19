fileID = fopen('ahhh.txt','r');
tline = fgets(fileID);

data = textscan(fileID, '%f%f%f%f%f%f', 'Delimiter', ',');
fclose(fileID);

data1 = cell2mat(data(1));
data2 = cell2mat(data(2));


data3 = cell2mat(data(3));
data4 = cell2mat(data(4));

data5 = cell2mat(data(5));
data6 = cell2mat(data(6));



hold on
grid on
grid minor

plot(data1(1:end-10),data2(1:end-10),'LineWidth',2);
plot(data3(1:end-10),data4(1:end-10),'LineWidth',2);

% plot(data1(1:end-100),data2(1:end-100),'r','LineWidth',2);
% plot(data1(101:end),data2(101:end),'b','LineWidth',2);

%plot(data3(1:end-10),data4(1:end-10),'LineWidth',2);
%plot(data5(1:end-10),data6(1:end-10),'LineWidth',2);

%for finding max cl
% [M,I] = max(data2);
% plot(data1(I),M,'r.','MarkerSize',20);
% 
% xvals = linspace(0,2,1000);
% yvals = 0.00546168/0.585834.*xvals;
% plot(xvals,yvals,'--k','LineWidth',1);
% plot(1.34562,0.01168,'r.','MarkerSize',20);
% text(0.585,0.00546168+0.01,"(i)");

% xvals = linspace(0,2,1000);
% yvals = 0.00589/0.6111.*xvals;
% plot(xvals,yvals,'-.k','LineWidth',1);
% plot(0.6111,0.00589,'g.','MarkerSize',20);
%text(1.18891,0.012777+0.01,"(ii)");

% text(0.6,-1.6,"SOMEWHAT");
% text(0.6,-1,"UNFAVORABLE");
% % 
% text(0.1,-3.2,"VERY");
% text(0.1,-2.7,"UNFAVORABLE");

% plot(0.442,0.0004325,'k.','Markersize',20);
% plot(0.6,4.827E-5,'k.','Markersize',20);
% 
% plot(0.505,0.00579,'r.','Markersize',20);
% plot(0.693,0.00352,'r.','Markersize',20);
xline(0);
yline(0);
%legend("NACA64(2)-215 (51) Panels","NACA64(2)-215 (101) Panels"  ,"NACA64(2)-215 (201) Panels"); 

%str = "Max c_l/c_d @" + "(" + string(data1(I)) + "," + string(M) + ")";
legend("NACA64(2)-215 (201) Panels (Re=3e9)(upper surface)","NACA64(2)-215 (201) Panels (Re=3e9)(lower surface)");  
title('$\tau_w$ vs $x/c$','Interpreter','latex', 'FontSize', 19);
xlabel('$x/c$','Interpreter','latex', 'FontSize', 18);
ylabel('$\tau_w$','Interpreter','latex', 'FontSize', 18)
set(get(gca,'ylabel'),'rotation',0)
%set(gca, 'YDir','reverse')