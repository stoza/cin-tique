function dM = dm_tromvitre(t,M)
%fonction qui calcul l effet de la vitrification combine avec l effet
%trommdorff sur l evolution de la concentration.
%   Detailed explanation goes here
M0 = 1;
ri = 8.36*10^(-9);

log_kp = kp_vitrification(1-M/M0);
log_kt = kt_tromdorff(1-M/M0);

kp = 10.^log_kp;
kt = 10.^log_kt;
R = sqrt(ri/kt);
dM = -kp*R*M;
end

