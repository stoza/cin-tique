%script qui permet d afficher les differents graphes
%les constantes du problèmes
ri = 8.36*10^(-9);
k_t = 10^7.8;
R = (ri/k_t)^(1/2);
k_p = 316.23;

%fraction converti et Dpn sans aucuns effets
tps = linspace(0,24*3600,1800);
M = Concentration_monomere(tps);
frac_convertie = (1-(M/9.4));
    %evolution de la frac convertie en fct du temps
plot(tps/3600,frac_convertie);
xlabel('Temps [h]');
ylabel('Fraction convertie de monomère');
figure;

dpn = Degre_polymerisation(M,0,'none');
    %evolution du dpn en fct de frac convertie
plot(frac_convertie,dpn);
xlabel('fraction convertie de monomère');
ylabel('DPn');
figure;

%ici on est avec un effet trommdorff
[T,M] = ode45(@dm_trommodorff,tps,1);
    %evolution de la concentration en monomere avec trommdorff
plot(T/3600,1-M/1);
xlabel('Temps [h]');
ylabel('Fraction convertie de monomère');
figure;

dpn = Degre_polymerisation(M,0,'trommdorff');
    %evolution du dpn avec trommdorff
plot(1-M,dpn);
xlabel('taux de conversion du monomère');
ylabel('DPn');
figure;

%avec trommdorff et vitrification
[T,M] = ode45(@dm_tromvitre,tps,1);
plot(T/3600,1-M/1);
ylabel('Fraction convertie de monomère');
xlabel('temps [h]');
figure;

dpn = Degre_polymerisation(M,0,'tromvitre');
    %evolution du dpn en fct du taux de convertion sans agent de transfert
plot(1-M,dpn);
xlabel('taux de convertion du monomère');
ylabel('DPn');
figure;

%avec transfert et trommdorf et vitrification et transfert
[T,C] = ode45(@dm_transfert,tps,[1 10^(-2)]);
M = C(1:end,1);
htr = C(1:end,2);
plot(T/3600,1-C(:,1)/1);
title('evolution de la [M] avec transfert');
figure;

dpn = Degre_polymerisation(M,htr,'transfert');

%avec ri non constant et trommdorff et vitrification et epuisement en
%amorceur
[T,C] = ode45(@dm_all, tps, [1;10^(-2);10^(-3) ]);
    %evolution de [M] avec ri non constant
plot(T/3600,1-C(:,1)/1);
hold on;
[T1,C1] = ode45(@dm_all,tps,[1;10^(-2);10^(-3.5)]);
plot(T1/3600,1-C1(:,1),'g');
hold on;
[T2,C2] = ode45(@dm_all,tps,[1;10^(-2);10^(-4)]);
plot(T2/3600,1-C2(:,1),'r');
legend('10^{-3}','10^{-3.5}','10^{-4}');
xlabel('Temps [h]');
ylabel('Fraction de monomère convertie');
figure;

    %evolution du taux de convertion en amorceur
plot(T/3600,1-C(:,3)/(10^(-3)));
xlabel('Temps [h]');
ylabel('Fraction en amorceur convertie');
figure;






