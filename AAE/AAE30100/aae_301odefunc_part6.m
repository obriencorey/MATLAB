function output = aae_301odefunc_part6(t,y)

    %constants
    if(t < 5)
        mdot = -0.1;
        T = 100;
    else
        mdot = 0;
        T = 0;
    end
    
    error = pi/2 - y(3);
    delta = 60 * error;
    CD0 = 0.01;
    CLalpha = 2*pi;
    rho = 1.225;
    r = 0.1;
    l = 1;
    kd = 0.1;
    da = 0.25;
    dm = 0.5;
    g = 9.81;
    
    %auxiliary equations
    alpha = atan2(y(5),y(4));
    V = sqrt(y(4)^2+y(5)^2);
    CL = CLalpha*alpha;
    CD = CD0 + kd*CL^2;
    s = pi * r^2;
    D = CD*rho*V^2*s/2;
    L = CL*rho*V^2*s/2;
    J = y(7)*l^2/12;
    Jdot = mdot*l^2/12;
    
    xdot = y(4)*cos(y(3))+y(5)*sin(y(3));
    zdot = -y(4)*sin(y(3))+y(5)*cos(y(3));
    q = y(6);
    udot = (T*cos(delta)-D*cos(delta)+L*sin(alpha)-y(7)*g*sin(y(3)))/y(7) - y(6)*y(5);
    wdot = (T*sin(delta)-D*sin(alpha)-L*cos(alpha)+y(7)*g*sin(y(3)))/y(7) + y(6)*y(4);
    qdot = 1 / J * (T*dm*sin(delta)-D*da*sin(alpha)-L*da*cos(alpha)-Jdot*y(6));
    %output is derivative of state vector
    output = [xdot; zdot; q; udot; wdot; qdot; mdot];
end