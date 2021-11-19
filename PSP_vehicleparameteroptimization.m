%what it does: uses genetic algorithm to optimize various rocket flight parameters
%              by finding the minimum to the optimization function
%
%how it works: uses matlab ga function and uses rough estimates of upper and 
%              lower bounds of parameters
%
%inputs:       can change gains in optfunc to fine tune optimization. for example
%              if you want to optimize landing energy over time, change that gain
%
%outputs:      prints to the screen recommended flight parameters

clc,clear

%target values we are aiming for
E_targ = 70; %ftlb
T_targ = 85; %seconds

%gain for optimizing function. if you want to focus on one value more,
%increase the gain. Default values are 1
E_gain = 1;
T_gain = 1;

%apogee upper and lower bounds (ft)
Ha_ub = 6000;
Ha_lb = 4300;

%deployment altitude upper and lower bounds (ft)
Hd_ub = 4000;
Hd_lb = 600;

%drogue descent velocity upper and lower bounds (ft/s)
Vdr_ub = 100;
Vdr_lb = 50;

%descent velocity upper and lower bounds (ft/s)
V_ub = 25;
V_lb = 10;

%time to apogee upper and lower bounds(s)
Ta_ub = 25;
Ta_lb = 15;

%vehicle weight upper and lower bounds (lbs)
W_ub = 60;
W_lb = 45;

%vehicle mass fraction of heaviest component upper and lower bounds (%)
F_ub = .5;
F_lb = .46;

%define two matrices containing the lower and upper bound information
lb = [Ha_lb, Hd_lb, Vdr_lb, V_lb, Ta_lb, W_lb, F_lb];
ub = [Ha_ub, Hd_ub, Vdr_ub, V_ub, Ta_ub, W_ub, F_ub];

%this is a required input argument, just the number of variables to expect
nvars = length(lb);

%supply initial condition for error function and blank equality argument
IntCon = 1;
A = [];
b = [];
Aeq = [];
beq = [];
nonlcon = [];

%rng default % For reproducibility, uncomment this. 

%enable graph to view optimization progress
options = optimoptions('ga','PlotFcn', @gaplotbestf);

%define our fitness function and pass our targets and gains
fitnessfunc = @(x) optfunc(x,E_targ,T_targ,E_gain,T_gain);

%conduct genetic algorithm optimization
%x is a matrix of the flight parameters.
%     x1 = apogee
%     x2 = deployment height
%     x3 = drogue descent rate
%     x4 = descent rate
%     x5 = time to apogee (maybe calculate this based on motor???
%     x6 = Weight
%     x7 = mass fraction of heaviet component
x = ga(fitnessfunc,nvars,A,b,Aeq,beq,lb,ub,nonlcon,IntCon,options); 

%final energy expression
E = .5 * x(6)/32 * x(7) * x(4)^2;
    
%final flight time expression
T = x(5) + (x(1)-x(2))/x(3) + x(2)/x(4);

finalerror = abs(1 - E_targ/E) + abs(1 - T_targ/T);
   
fprintf("\n-=-=-=-=-=-=-=-=-=-=-=-=-=-\n");
fprintf("Final total error is %.2f %%\n",finalerror * 100);
fprintf("Landing Energy = %.2f ftlb\n",E);
fprintf("Flight Time = %.2f s\n",T);
fprintf("\n-=-=-=-=-=-=-=-=-=-=-=-=-=-\n");
fprintf("Flight Parameters are are:\n\n");
fprintf("Apogee = %.2f ft\n",x(1));
fprintf("Main Deploy Altitude = %.2f ft\n",x(2));
fprintf("Drogue descent rate= %.2f ft/s\n",x(3));
fprintf("Descent rate = %.2f ft/s\n",x(4));
fprintf("Time to apogee = %.2f seconds\n",x(5));
fprintf("Weight = %.2f lbs\n",x(6));
fprintf("Fraction = %.2f %%\n",x(7)*100);
fprintf("\n-=-=-=-=-=-=-=-=-=-=-=-=-=-\n");
function val = optfunc(x,E_targ,T_targ,E_gain,T_gain)  
    %energy expression
    %equals 1/2*m*f*v^2
    E = .5 * x(6)/32 * x(7) * x(4)^2;
    
    %flight time expression
    %equals time to apogee plus drogue descent time plus main descent time
    T = x(5) + (x(1)-x(2))/x(3) + x(2)/x(4);


    val = E_gain*abs(1 - E_targ/E) + T_gain*abs(1 - T_targ/T);
    
end








