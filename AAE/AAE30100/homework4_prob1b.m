t = linspace(0,2 * pi, 100);
f = zeros(0,100);
p = zeros(0,100);

N = 5;
for x = 1:100
    f(x) = sin(1.5 * t(x));
    p(x) = 2 / (3 * pi);
    for n = 1:N
        p(x) = p(x) + ((1 / pi * (3 / (9/4 - n^2))) * cos(n * t(x)));
    end
end


hold on
grid on
plot(t,f,'g')
plot(t,p,'b')
title("p_n(t) vs f(t) for n = 5")
xlabel("t")
ylabel("p_5(t), f(t)")
legend("f(t)","p_5(t)")