% x = linspace(0,1,100);
% v = zeros(1,100);
% exact = zeros(1,100);
% for i = 1:100
%     v(i) = .87*(3/2 * (5/16) + 1/4)*(-x(i)+x(i)^2) + 5/16*(-x(i)^2+x(i)^3);
%     
%     if(i < 50)
%         exact(i) = -1/2 * x(i)^2 - 1/8 * x(i);
%     else
%         exact(i) = 3/8 * x(i) - 3/8;
%     end
% end
% 
% hold on
% plot(x,v)
% plot(x,exact)
% xlabel("distance")
% ylabel("displacement");
% legend("Ritz Method","Exact");
% title("Distance vs. Displacement");

% x = linspace(0,1,100);
% v = zeros(1,100);
% exact = zeros(1,100);
% for i = 1:100
%     v(i) = 16/9 * (x(i)^2-x(i)) - 20/27 * (x(i)^3-x(i));
%     
%     if(i < 33)
%         exact(i) = -2/3*x(i);
%     else
%         exact(i) = 1/3 * (x(i)-1);
%     end
% end
% 
% hold on
% plot(x,v)
% plot(x,exact)
% xlabel("distance")
% ylabel("displacement");
% legend("Ritz Method","Exact");
% title("Distance vs. Displacement");

x = linspace(0,1,100);
v = zeros(1,100);
exact = zeros(1,100);
for i = 1:100
    v(i) = 1/16 * (x(i)^2-x(i));
    
    if(i < 50)
        exact(i) = -.7*(-7/48 * x(i)^3 + 3/16 * x(i)^2);
    else
        exact(i) = -.7*(1/48*x(i)^3-1/16*x(i)^2+1/24);
    end
end

hold on
plot(x,v)
plot(x,exact)
xlabel("distance")
ylabel("displacement");
legend("Ritz Method","Exact");
title("Distance vs. Displacement");