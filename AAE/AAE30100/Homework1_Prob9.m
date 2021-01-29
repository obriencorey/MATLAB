theta = linspace(0,2*pi,100);

hold on
%Part I
% for n = 0:99
%     plot(cos(3 * theta(n+1)), sin(3 * theta(n+1)), 'k.');
% end

%Part II

data = zeros(2,100);
for n = 0:99
    %plot(-sin(-theta(n+1) / 2), cos(-theta(n+1) / 2), 'k.');
    data(1,n+1) = -sin(-theta(n+1) / 2);
    data(2,n+1) = cos(-theta(n+1) / 2);
end

plot(data(1,:),data(2,:),'k.');
ylim([-1.25 1.25]);
xlim([-1.25 1.25]);
title("Problem 9 - HW1");
xlabel("real");
ylabel("imag");
yline(0);
xline(0);


