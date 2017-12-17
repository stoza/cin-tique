function kp = kp_temperature( X,T )
%calcul le kp en fonction de la concentration et de la temperature.
%   Detailed explanation goes here
Ep = 18284*10^4;
R = 8.314;
if X<0.48
    kp = 10^(2.5)*exp(-Ep/R*T);
elseif X < 0.8
        kp_no_t = kp_vitrification(X);
        kp = kp_no_t*exp(-Ep/R*T);
else
    kp = exp(-Ep/R*T);
end
        

end

