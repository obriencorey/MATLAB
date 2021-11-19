function [A, height] = CLPT_moduli(angles, E1, E2, nu12, G12, t) 
    
%number of plies n 
n = length(angles); 
  
height = 0; %initial total thickness of the laminate (height) 
  
for ii = 1:1:n 
     
    height = height + t(ii); %add thickness of each ply to the total  
  
end 
 
  
z_sym = height /2; %location of symmetric plane 
  
zbar = 0; %reference coordinate zbar from bottom of ply 
  
%matrices A B D initialization 
  
A = zeros(); 
B = zeros(); 
D = zeros(); 
  
for ii = 1:1:n 
     
    zk_1 = zbar - z_sym; %z value of bottom of layer 
     
    zbar = zbar + t(ii); %reference coordinate zbar from bottom of ply 
     
    zk = zbar - z_sym; %z value of top of layer 
     
    %find the Qbar matrix for each ply 
    [Q_bar] = Q_to_Qbar_transformation( E1, E2, nu12, G12,angles(ii)); 
     
    %find A,B,D matrix of each ply and add to the previous to produce 
    A = A + Q_bar .* (zk - zk_1); 
    B = B + Q_bar .* (zk .^ 2 - zk_1 .^ 2) ./ 2;  
    D = D + Q_bar .* (zk .^ 3 - zk_1 .^ 3) ./ 3;   
     
end 
  
end