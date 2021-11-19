[tout, yout] = ode45(@f, [0, 10], [0, 0]);

plot(tout, yout);

function dy = f(t, y)
    
    % state vector
    theta = y(1);
    q = y(2);
    
    % compute aux equations
    
    % compute input vector
    M = 1;
    
    % parameters
    Jy = 1;
    
    % derivative of the state vector
    dy = [
        q;         % d/dt theta
        (1/Jy)*M   % d/dt q
        ];
end