

a = input('Enter the length a [meters]: ');
if a < 0
    fprintf("Error: Negative input\n");
    return;
end

b = input('Enter the length b [meters]: ');
if b < 0
    fprintf("Error: Negative input\n");
    return;
end

K = input('Enter the parameter K [meters^3]: ');
if K < 0
    fprintf("Error: Negative input\n");
    return;
end
M_max = input('Enter M_max: ');
N_max = input('Enter N_max: ');

sum = 0;

for m = 1:M_max
    for n = 1:N_max
        sum = sum + HW2_modeMN_FUNC(a,b,m,n);
    end
end

dmax = 16 * K / pi^6 * sum;

fprintf("The maximum deflection of the plate is %.4f meters\n",dmax);