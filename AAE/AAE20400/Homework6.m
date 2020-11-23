V1 = 18;
V2 = 8;

V = zeros(1,1000);
M = zeros(1,1000);

M_1 = zeros(1,1000);
M_2 = zeros(1,1000);

nums_1 = zeros(1,1000);
nums_2 = zeros(1,1000);

nums = linspace(0,6,1000);

for x = 1:1000
    if(nums(x) < 3)
        V(x) = -4 - 4 /6 * nums(x)^2;
    else
        V(x) = 24 - 4 * nums(x);
    end
    
    if(V(x) < 0)
        nums_1(x) = nums(x);
        M_1(x) = V(x);
    else
        nums_2(x) = nums(x);
        M_2(x) = V(x);
    end
        
    
end
M_1(1) = 0;
nums_1(x) = 0;
M_1 = M_1(1:499);
nums_1 = nums_1(1:499);
M_1(499) = 0;

M_2 = M_2(500:end);
nums_2 = nums_2(500:end);
M_2(500) = 0;
nums_2(1) = 3;

hold on
plot(nums,V,'k','LineWidth',2);
p = patch(nums_1,M_1,'b');
hatchfill(p);
p = patch(nums_2,M_2,'b');
hatchfill(p);


xline(0);
yline(0);
xlim([-3 10])
ylim([-100 100]);
xlabel("Distance From Origin (m)");
ylabel("Shear Force (kN)");
title('Shear Force Diagram - Corey O''Brien');
set(gca,'FontName','Times');
set(gca,'FontSize',12);