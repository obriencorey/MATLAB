figure
hold on
xlabel('Range (nmi)');
ylabel('Aspect Ratio');
xlim([6000 9000])
ylim([6 14]);
set(gca,'FontName','Poppins');
set(gca,'FontSize',12);
title("Aspect Ratio - Range Trends");
marksize = 15;

%x is range, y is AR
plot(6300,10.03,'.','MarkerSize',marksize);
text(6300 - 50,10.03 + .4,'787-10');

plot(7200,8.8,'.','MarkerSize',marksize);
text(7200 - 50,8.8 + .4,'A330-900');

plot(7350,11,'.','MarkerSize',marksize);
text(7350 - 50,11 + .4,'787-8');

plot(7650,11,'.','MarkerSize',marksize);
text(7650 - 50,11 + .4,'787-9');

plot(7500,9.96,'.','MarkerSize',marksize);
text(7500 - 50,9.96 + .4,'777x-9');

plot(8000,7.8,'.','MarkerSize',marksize);
text(8000 - 50,7.8 + .4,'A380');

plot(8000,8.47,'.','MarkerSize',marksize);
text(8000 - 50,8.47 + .4,'747-8');

plot(8100,9.49,'.','MarkerSize',marksize);
text(8100 - 50,9.49 + .4,'A350-900');

plot(8000,8.47,'.','MarkerSize',marksize);
text(8000 - 50,8.47 + .4,'747-8');

grid on
hold off