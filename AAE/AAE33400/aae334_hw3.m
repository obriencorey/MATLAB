E = linspace(0,1,100);

Cmacbyeta = 2*sqrt(E.*(1-E)).*(E-1);

plot(E,Cmacbyeta)


idx = islocalmin(Cmacbyeta);

grid on
title("c_{mac}/\eta vs E")
xlabel("E")
ylabel("c_{mac}/\eta")