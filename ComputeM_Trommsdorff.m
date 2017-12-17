function dM = ComputeM_Trommsdorff(t,M)
% COMPUTEM_TROMMSDORFF - Cette fonction MATLAB contient l’equation
% differentielle regulant l’evolution de la concentration en monomeres [M]
% et ce en considerant l’effet Trommsdorf (et non l’effet de
% vitrification et des agents de transfert).
% Les arguments sont : un vecteur t representant l’intervalle de temps sur
% lequel on resoud l’EDO et un scalaire M (la concentration en monomere).
M0 = 1;
k_p = 10^(2.5);
r_i = 8.36*10^(-9);
p = piecewisekt(1-M/M0);
% concentration initiale en monomeres
% constante de propagation constant
% vitesse d’apparition des radicaux
k_t = 10.^p;
R = sqrt(r_i/k_t);
% constante de terminaison non-constant
% concentration en radicaux propageant la chaine
% Equadiff a resoudre
dM = k_p*-R*M;
end