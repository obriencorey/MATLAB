x = 0:1000;
y = log(x);



figure
semilogx(x,y)
hold on
xlim([100 10000000])
ylim([0 0.9])
yticks([0.2 0.3 0.4 0.5 0.6 0.7 0.8]);
yticklabels({'0.2','0.3','0.4','0.5','0.6','0.7','0.8'});
xticks([100 1000 10000 100000 1000000 10000000]);
xticklabels({'100' , '1000' , '10000' , '100000' , '1000000' ,'10000000'});
xlabel('Takeoff Weight (W_0)');
ylabel('Empty Weight Fraction (W_e / W_0)');
set(gca,'FontName','Poppins');
set(gca,'FontSize',12);
title("Empty Weight Fraction Trends");

plot(2641,0.66,'.');
text(2641,0.66,'     Diamond DA40')

plot(1670,0.65,'.');
text(1670,0.65,'     Cessna 152')

plot(1325,0.53,'.');
text(1325,0.53,'     Rutan Long EZ')

plot(4189,0.56,'.');
text(4189,0.56,'     Rutan Boomerang')

plot(1773,0.55,'.');
text(1773,0.55,'     Piper Comanche')

plot(5071,0.68,'.');
text(5071,0.68,'     Diamond DA62')

plot(255000,0.50,'.');
text(255000,0.50,'     Boeing 757-200')

plot(602000,0.47,'.');
text(602000,0.47,'     McDonnel Douglas MD-11')

plot(551000,0.48,'.');
text(551000,0.48,'     Ilyushin IL-96')

plot(920000,0.41,'.');
text(920000,0.41,'     Lockheed C5 Galaxy')

plot(585000,0.48,'.');
text(585000,0.48,'     Boeing C-17 GLobemaster III')

plot(191800,0.27,'.');
text(191800,0.27,'     Embraer C-390 Millennium')

grid on
hold off
