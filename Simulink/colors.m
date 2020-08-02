time = linspace (0,30,1001);
values = zeros(1,1001);

for i = 1:1001
    
    r = 7 + (-7).*rand(100,1);
    v = sin(r);
    values(i) = v(1);
end

figure(1);
plot(time,values);