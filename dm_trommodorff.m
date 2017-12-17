function  dM  = dm_trommodorff(t,M)
%fonction qui exprime l EDO a resoudre pour trouver l evolution de la
%concentration en amorceurs si il y a un effet trommdorff
%   M est la valeur initial de la cocentration en monomere 
%   t est l intrevall de temps pour lequel on va resoudre cette EDO
M0 = 1;
k_p = 10^(2.5);
ri = 8.36*10^(-9);
log_kt = kt_tromdorff(1-M/M0);

k_t = 10.^log_kt;
R = sqrt(ri/k_t);
dM = -k_p*R*M;

end

