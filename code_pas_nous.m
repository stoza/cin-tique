M0 = 1;
% Concentration initiale en monomeres
HTr0 = 10^(-2);
% Concentration initiale en agent de transfert
A0 = 10^-3;
% Concentration initiale en amorceur
jour = 1;
r_i = 8.36*10^(-9);
% vitesse d’apparition des radicaux
k_i1 = 1E-5;
% constante de vitesse de la premiere reaction
t=linspace(0,24*3600*jour,10^2);
% Effet Trommsdorff - kt non-cst
[T,M] = ode15s(@ComputeM_Trommsdorff,t,M0);
figure
plot(t/3600,1-M/M0)
V=axis;
axis([V(1) jour*24 V(3) 1]);
set(gca,'XTick',[2 4 6 8 10 12 14 16 18 20 22 24]*jour)
xlabel('\fontsize{11} Temps [h]');
ylabel('\fontsize{11} Taux de conversion en monomeres X_M');
title('Effet Trommsdorff');