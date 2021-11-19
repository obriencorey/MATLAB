E_1f = 270e9;
E_2f = 15e9;
v_12f = 0.28;
G_12f = 15e9;
G_23f = 5e9;
E_m = 3.4;
v_m = 0.38;
G_23f = 5e9;

%AAE590_hw2(E_1f,E_2f,v_12f,G_12f,E_m,v_m,V_f)
%return compprops = [E_1c,E_2c,v_12c,G_12c];

%let volume fraction range between 0 and 1
V_f = linspace(0,.99,100);

E_1clist = zeros(1,length(V_f));
E_2clist = zeros(1,length(V_f));
v_12clist = zeros(1,length(V_f));
G_12clist = zeros(1,length(V_f));


E_1clistCCA = zeros(1,length(V_f));
E_2clistCCA = zeros(1,length(V_f));
v_12clistCCA = zeros(1,length(V_f));
G_12clistCCA = zeros(1,length(V_f));

for x = 1:100
    properties = ROMprops(E_1f,E_2f,v_12f,G_12f,E_m,v_m,V_f(x));
    propertiesCCA = CCAprops(
    E_1clist(x) = properties(1);
    E_2clist(x) = properties(2);
    v_12clist(x) = properties(3);
    G_12clist(x) = properties(4);
end

figure()
plot(V_f,E_1clist)
title("E_1 vs V_f")
xlabel("Fiber Volume Fraction")
ylabel("E_1 (GPa)");

figure()
plot(V_f,E_2clist)
title("E_2 vs V_f")
xlabel("Fiber Volume Fraction")
ylabel("E_2 (GPa)");
figure()
plot(V_f,v_12clist)
title("v_12 vs V_f")
xlabel("Fiber Volume Fraction")
ylabel("v_12");
figure()
plot(V_f,G_12clist)
title("G_12 vs V_f")
xlabel("Fiber Volume Fraction")
ylabel("G_12 (GPa)");