clear,clc

spar = [0, 0.0225, 0.045, 0.09, 0.17, 0.34, 0.68 1.36];

U1 = [6.828e-3, 7.013e-3, 7.15e-3, 7.237e-3, 7.238e-3, 7.006e-3, 6.063e-3, 4.816e-3];
U2 = [1.156e-2, 1.085e-2, 1.064e-2, 1.046e-2, 1.029e-2, 9.992e-3, 9.162e-3, 7.121e-3];

tau1 = [1.938e-4, 2.039e-4, 2.060e-4, 2.077e-4, 2.073e-4, 2.019e-4, 1.76e-4, 1.336e-4];
tau2 = [1.938e-4, 1.782e-4, 1.751e-4, 1.736e-4, 1.735e-4, 1.716e-4, 1.581e-4, 1.159e-4];

 
theta = .5 * (atan(2.*U1 / 4.875) + atan(2.*U2 / 4.875));


hold on
grid on 
grid minor
plot(spar,tau1*(10e5))
plot(spar,tau2*(10e5))
title("shear strain vs spar thickness (FEA)")
ylabel("shear strain in microstrain");
xlabel("spar thickness in inches");
legend("cell 1","cell 2");
ytickangle(45)

