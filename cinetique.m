%les constantes du problèmes
ri = 8.36*10^(-9);
k_t = 10^7.8;
R = (ri/k_t)^(1/2);
k_p = 316.23;

%fraction converti et Dpn sans aucuns effets
tps = linspace(0,24*3600,1800);
M = Concentration_monomere(tps);
frac_convertie = (1-(M/9.4));
plot(tps/3600,frac_convertie);
%title('evolution de la frac convertie en fct du temps');
xlabel('Temps [h]');
ylabel('Fraction convertie de monomère');
figure;

dpn = Degre_polymerisation(M,'none');
plot(frac_convertie,dpn);
%title('evolution du dpn en fct de frac convertie');
xlabel('fraction convertie de monomère');
ylabel('DPn');
figure;

%ici on est avec un effet trommdorff
[T,M] = ode45(@dm_trommodorff,tps,1);
plot(T/3600,1-M/1);
%title('evolution de la concentration en monomere avec trommdorff');
xlabel('Temps [h]');
ylabel('Fraction convertie de monomère');
figure;

%avec trommdorff et vitrification
[T,M] = ode45(@dm_tromvitre,tps,1);
plot(T/3600,1-M/1);
%titlxlabel('Temps [h]');
ylabel('Fraction convertie de monomère');
xlabel('temps [h]');
figure;

dpn = Degre_polymerisation(M,'tromvitre');
plot(1-M,dpn);
%title('evolution du dpn en fct du taux de convertion sans agent de transfert');
xlabel('taux de convertion du monomère');
ylabel('DPn');
figure;

%avec transfert et trommdorf et vitrification et transfert
[T,C] = ode45(@dm_transfert,tps,[1 10^(-2)]);
M = C(:,1);
htr = C(:,2);
plot(T/3600,1-C(:,1)/1);
title('evolution de la [M] avec transfert');
figure;

dpn = Degre_polymerisation(M,'transfert');
plot(1-M,dpn);
title('evolution du dpn en fct du taux de convertion agent de transfert cs = 0.66');
figure;

%avec ri non constant et trommdorff et vitrification
[T,C] = ode45(@dm_all, tps, [1;10^(-2);10^(-3) ]);
plot(T/3600,1-C(:,1)/1);
title('evolution de [M] avec ri non constant');
figure;
plot(T/3600,1-C(:,3)/(10^(-3)));
title('evolution du taux de convertion en amorceur');
