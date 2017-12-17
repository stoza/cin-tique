function [kt] = kt_tromdorff( X_m )
%UNTITLED foonction qui calcul kt avec l effet trommdorff
%   kt est un vecteur contenant les differente valeurs de k_t pour les
%   differentes valeur de concentration passee en parametre X_m
Xm = [0.10:0.10:0.80];
kt_graphe = [7.5 6.7 5.9 5.8 5.3 4.5 3.9 3.3];

polynome_kt = polyfit(Xm,kt_graphe,2);
kt = polyval(polynome_kt,X_m);
end

