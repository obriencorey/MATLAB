yinitial = 0;

Start = -2;
Stop = 2;
Stepsize = .000001;

steps = linspace(Start,Stop,1 + Stop / Stepsize);
steps = steps(1:end - 1);
yold = yinitial;
for i = 1:length(steps)
    ynew = yold + (steps(i) + .5 * (yold * yold) - 7) * Stepsize;
    yold = ynew;
end

fprintf("ynew with step size %f is %f\n",Stepsize,ynew);