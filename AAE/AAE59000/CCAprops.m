%function that outputs the effect in plane composite properties
%(E_1c,E_2c,v_12c,G_12c,G_23c) using 
%(E_1f,E_2f,v_12f,G_12f,E_m,v_m) and V_f as inputs
function compprops = CCAprops(E_1f,E_2f,v_12f,G_12f,G_23f,E_m,v_m,V_f)

%find poisson's ratio using relation
v_23f = E_2f/(2*G_23f) - 1;

%first find bulk moduli
K_23f = E_2f / (2 * (1 - v_23f - 2 * E_2f/E_1f*v_12f^2));
K_23m = E_m / (2 * (1 - v_m - 2 * v_m^2));


%K_23m = E_m / (3 * (1 - 2*v_m));

%calculate shear modulus of matrix
G_m = E_m / (2*(1+v_m));

E_1c = E_1f*V_f + E_m*(1-V_f) + ((4*V_f*(1-V_f)*(v_12f-v_m)^2*G_m)) / ...
    (((G_m*(1-V_f)/K_23f) + 1 + (G_m*V_f / K_23m)));

v_12c = v_12f*V_f + v_m*(1-V_f) + (V_f*(1-V_f)*(v_12f - v_m)*(G_m / K_23m - G_m / K_23f)) ...
    / ( ((G_m*(1-V_f))/K_23f) + ((G_m*V_f)/(K_23m)) + 1);

G_12c = G_m * (((G_12f*(1+V_f)+G_m*(1-V_f))) / (G_12f*(1-V_f)+G_m*(1+V_f)));

G_23c = G_m * (1 + ((V_f) / (((G_m)/(G_23f - G_m))+ ((K_23m + 2*G_m)*(1-V_f)) ...
    / (2*(K_23m + G_m)))));

K_23c = K_23m + ((V_f) / ((1)/(K_23f - K_23m) + (1-V_f)/(K_23m + G_m)));
%K_23c = ((G_m+K_23f)*K_23f + G_m*(K_23f - K_23m)*V_f) / (G_m + K_23f - K_23f*V_f + K_23m*V_f);

E_2c = (4*G_23c*K_23c) / (K_23c + G_23c*(1 + (4*K_23c*v_12c^2) / (E_1c)));


compprops = [E_1c,E_2c,v_12c,G_12c,G_23c];
end