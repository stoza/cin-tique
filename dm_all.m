function result = dm_all(t,C)
%calcul l evolution de la concentration avec ri 
%   C(1) la concentration en monomere
%   C(2) la concentration en agent de transfert
%   C(3) la concentration en amorceur
result = zeros(3,1);
M0 = 1;
ri = 8.36*10^(-9);
ki = 1E-5;
Cs = 0.66;
f =1;

log_kp = kp_vitrification(1-C(1)/M0);
log_kt = kt_tromdorff(1-C(1)/M0);

kp = 10.^log_kp;
kt = 10.^log_kt;
R = sqrt(ri/kt);

ks =Cs*kp;

%equadiff a resoudre
result(1) = -kp*C(1)*sqrt(2*f*ki*C(3)/kt);
result(2) = -ks*R*C(2);
result(3) = -ki*C(3);

end

