function output = HW2_modeMN_FUNC(a,b,m,n)

%first half of product
output = ((sin(m * pi / 2) * sin(n * pi / 2)) / (m * n));
%second half of product
output = output * 1 / ((m^2 / a^2) + (n^2 / b^2))^2;
end

