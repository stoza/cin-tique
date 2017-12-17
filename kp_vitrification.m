function [ kp ] = kp_vitrification( X_m )
%calcul de kp en avec la vitrification. 
%   Detailed explanation goes here
if X_m < 0.45
    kp = 2.5;
elseif X_m < 0.8
    kp_graphe = [2.3 1.8 1.5 0.1];
    Xm = [0.5 0.6 0.65 0.8];
    kp_polynome = polyfit(Xm,kp_graphe,2);
    kp = polyval(kp_polynome,X_m);
else
    kp = 0;  
end

