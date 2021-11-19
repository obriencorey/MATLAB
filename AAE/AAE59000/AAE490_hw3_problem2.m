%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Corey O'Brien - AAE59000 - HW3 problem 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc,clear

%target composite properties
E1c_targ = 147;
E2c_targ = 10.3;
v12c_targ = 0.27;
G12c_targ = 7;
G23c_targ = 3.7;


% rangemat = [E1f_range; E2f_range; v12f_range; G12f_range; G23f_range; ...
%     Em_range; vm_range; V_f_range]';


lb = [75, 15, .2, 20, 7, 3, 0.35, 0.5];
ub = [230, 230, .35, 35, 35, 5, 0.36, 0.65];
nvars = 8;

IntCon = 1;
A = [];
b = [];
Aeq = [];
beq = [];
nonlcon = [];

%rng default % For reproducibility
options = optimoptions('ga','PlotFcn', @gaplotbestf);
x = ga(@optfunc,nvars,A,b,Aeq,beq,lb,ub,nonlcon,IntCon,options); 


finalproperties = CCAprops(x(1),x(2),x(3),x(4),x(5),x(6),x(7),x(8));

    E1c = finalproperties(1);
    E2c = finalproperties(2);
    v12c = finalproperties(3);
    G12c = finalproperties(4);
    G23c = finalproperties(5);
    
finalerror = abs(1 - E1c_targ/E1c) + abs(1 - E2c_targ/E2c) + abs(1 - v12c_targ/v12c) ...
        + abs(1 - G12c_targ/G12c) + abs(1 - G23c_targ / G23c);
    
fprintf("\n-=-=-=-=-=-=-=-=-=-=-=-=-=-\n");
fprintf("Final total error is %.3f\n",finalerror);
fprintf("\n-=-=-=-=-=-=-=-=-=-=-=-=-=-\n");
fprintf("Constituent Properties are:\n");
fprintf("E_1f = %.3f\n",x(1));
fprintf("E_2f = %.3f\n",x(2));
fprintf("v_12f = %.3f\n",x(3));
fprintf("G_12f = %.3f\n",x(4));
fprintf("G_23f = %.3f\n",x(5));
fprintf("E_m = %.3f\n",x(6));
fprintf("v_m = %.3f\n",x(7));
fprintf("V_f = %.3f\n",x(8));
fprintf("\n-=-=-=-=-=-=-=-=-=-=-=-=-=-\n");
fprintf("Composite Properties are:\n");
fprintf("E1c = %.3f with error %.3f%%\n",E1c,100*abs(1 - E1c_targ/E1c));
fprintf("E2c = %.3f with error %.3f%%\n",E2c,100*abs(1 - E2c_targ/E2c));
fprintf("v12c = %.3f with error %.3f%%\n",v12c,100*abs(1 - v12c_targ/v12c));
fprintf("G12c = %.3f with error %.3f%%\n",G12c,100*abs(1 - G12c_targ/G12c));
fprintf("G23c = %.3f with error %.3f%%\n",G23c,100*abs(1 - G23c_targ / G23c));

function val = optfunc(x)

    %target composite properties
    E1c_targ = 147;
    E2c_targ = 10.3;
    v12c_targ = 0.27;
    G12c_targ = 7;
    G23c_targ = 3.7;

    properties = CCAprops(x(1),x(2),x(3),x(4),x(5),x(6),x(7),x(8));

    E1c = properties(1);
    E2c = properties(2);
    v12c = properties(3);
    G12c = properties(4);
    G23c = properties(5);
    
    val = abs(1 - E1c_targ/E1c) + abs(1 - E2c_targ/E2c) + abs(1 - v12c_targ/v12c) ...
        + abs(1 - G12c_targ/G12c) + abs(1 - G23c_targ / G23c);
    
end








