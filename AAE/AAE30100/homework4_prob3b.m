t = linspace(0,2 * pi, 100);
f = zeros(0,100);
p = zeros(0,100);

N = 3;
for x = 1:100
    f(x) = t(x)*sin(t(x));
    p(x) = -1 -1/2*cos(t(x)) + pi*sin(t(x));
    for n = 2:N
        p(x) = p(x) + (-2 / (1-n^2)) * cos(n * t(x));
    end
end


hold on
grid on
plot(t,f,'g')
plot(t,p,'b')
title("p_n(t) vs f(t) for n = 3")
xlabel("t")
ylabel("p_3(t), f(t)")
legend("f(t)","p_3(t)")