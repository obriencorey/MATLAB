xn = -1;
xnplus1 = 6;
upperlimit = 200;

values = zeros(1,upperlimit);
numbers = 1:upperlimit;
for x = 0:upperlimit - 1
    xnplus2 = 1/3 * xnplus1 + 2/3 * xn;
    xn = xnplus1;
    xnplus1 = xnplus2;
    values(x + 1) = xnplus2;
end

hold on
plot(numbers,values);