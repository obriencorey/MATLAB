%function that outputs the effect in plane composite properties
%(E_1c,E_2c,v_12c,G_12c) using 
%(E_1f,E_2f,v_12f,G_12f,E_m,v_m) and V_f as inputs

function compprops = ROMprops(E_1f,E_2f,v_12f,G_12f,E_m,v_m,V_f)
E_1c = E_1f*V_f+E_m*(1-V_f);

v_12c = v_12f*V_f + v_m*(1-V_f);
E_2c = 1 / (V_f / E_2f + (1-V_f)/E_m);
G_m = E_m / (2*(1+v_m));
G_12c = 1 / (V_f / G_12f + (1-V_f)/G_m);

compprops = [E_1c,E_2c,v_12c,G_12c];
end