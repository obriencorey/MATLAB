hold on
for n = 0:49
   plot(cos(1 / 50 * (2 * pi + 2 * n * pi)), sin(1 / 50 * (2 * pi + 2 * n * pi)),'ko');
end
xlim([-1.25 1.25]);
ylim([-1.25 1.25]);
title("Problem 8 - HW1");
xlabel("real");
ylabel("imag");
yline(0);
xline(0);