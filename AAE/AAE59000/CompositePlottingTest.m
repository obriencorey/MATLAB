E_1f = 270;
E_2f = 15;
v_12f = 0.28;
G_12f = 15;
G_23f = 5;
E_m = 3.4;
v_m = 0.38;
G_23f = 5;
num = 10;

%AAE590_hw2(E_1f,E_2f,v_12f,G_12f,E_m,v_m,V_f)
%return compprops = [E_1c,E_2c,v_12c,G_12c];

%let volume fraction range between 0 and 1
V_f = linspace(0,.99,num);

E_1clist = zeros(1,length(V_f));
E_2clist = zeros(1,length(V_f));
v_12clist = zeros(1,length(V_f));
G_12clist = zeros(1,length(V_f));


E_1clistCCA = zeros(1,length(V_f));
E_2clistCCA = zeros(1,length(V_f));
v_12clistCCA = zeros(1,length(V_f));
G_12clistCCA = zeros(1,length(V_f));

for x = 1:num
    properties = ROMprops(E_1f,E_2f,v_12f,G_12f,E_m,v_m,V_f(x));
    propertiesCCA = CCAprops(E_1f,E_2f,v_12f,G_12f,G_23f,E_m,v_m,V_f(x));
    
    E_1clist(x) = properties(1);
    E_2clist(x) = properties(2);
    v_12clist(x) = properties(3);
    G_12clist(x) = properties(4);
    
    E_1clistCCA(x) = propertiesCCA(1);
    E_2clistCCA(x) = propertiesCCA(2);
    v_12clistCCA(x) = propertiesCCA(3);
    G_12clistCCA(x) = propertiesCCA(4);
end

figure()
hold on
grid on
plot(V_f,E_1clistCCA,'k','linewidth',2)
plot(V_f,E_1clist,'r','linewidth',.5)
title("E_1 vs V_f")
xlabel("Fiber Volume Fraction")
ylabel("E_1 (GPa)");
legend("ROM","CCA");

figure()
hold on
grid on
plot(V_f,E_2clist,'r','linewidth',.5)
plot(V_f,E_2clistCCA,'k','linewidth',2)
title("E_2 vs V_f")
xlabel("Fiber Volume Fraction")
ylabel("E_2 (GPa)");
legend("ROM","CCA");

figure()
hold on
grid on
plot(V_f,v_12clist,'r','linewidth',.5)
plot(V_f,v_12clistCCA,'k','linewidth',2)
title("v_12 vs V_f")
xlabel("Fiber Volume Fraction")
ylabel("v_12");
legend("ROM","CCA");

figure()
hold on
grid on
plot(V_f,G_12clist,'r','linewidth',.5)
plot(V_f,G_12clistCCA,'k','linewidth',2)
title("G_12 vs V_f")
xlabel("Fiber Volume Fraction")
ylabel("G_12 (GPa)");
legend("ROM","CCA");