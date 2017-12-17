function  result = dm_transfert(t,C)
%calcul de le truc en fct de l evolution en agent de transfert et de l
%effet trommdorff
%   On suposse que l agent de transfert ne change l evolution de la
%   concentration en monomere. 
%   Reslut est un vecteur contenant en position une la solution pour l
%   evolution de la concentratione en monomere et pour la position deux l
%   evolution de la concentration en agent de transfert
%   C est un vecteur contenant a la premiere position la concentration en
%   monomere et a la deuxieme la concentration en agent de transfert
result = zeros(2,1);
M0 = 1;
ri = 8.36*10^(-9);
Cs = 0.66;

log_kp = kp_vitrification(1-C(1)/M0);
log_kt = kt_tromdorff(1-C(1)/M0);

kp = 10.^log_kp;
kt = 10.^log_kt;
ks = kp*Cs;

R = sqrt(ri/kt);

%EDO a resoudre
result(1) = -kp*R*C(1);
result(2) = -ks*R*C(2);


end

