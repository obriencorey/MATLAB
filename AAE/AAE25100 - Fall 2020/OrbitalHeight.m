%This program calulates orbital height at a given true anomaly angle

Rp = input("Enter the periapsis radius (km): ");
Ra = input("Enter the apoapsis radius(km): ");
Anom = input("Enter the truly anomaly(degrees): ");

a = .5 * (Rp + Ra);
e = (Ra - a) / a;
p = a * (1 - e * e);

R = p / (1 + e * cosd(Anom));

fprintf("-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*\n");
fprintf("Your orbital radius is: %.3fkm. \nYour orbital height is %.3fkm\n",R,R-6371);
fprintf("-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*\n");