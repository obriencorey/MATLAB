xn = 0;
upperlimit = 200;

values = zeros(1,upperlimit);
numbers = 1:upperlimit;
for x = 0:upperlimit - 1
    xnplus1 = 1 + sqrt(xn - 1);
    xn = xnplus1;
    values(x + 1) = xn;
end

hold on
plot(numbers,values);