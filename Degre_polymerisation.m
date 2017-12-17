function dpn = Degre_polymerisation(M,parametre)
%fonction qui calcul le degre de polymerisation
%   Les parametres de cette fonction sont M qui est la concentration en
%   monomere et paramtre qui est un string qui nous dis dans quelle cas on
%   se trouve:
%       1) 'none': pas d effet considérés
%       2) 'trommdorff': effet trommodrff
%       3) 'tromvitre': trommdorff + vitrification
%       4) 'all' : trommdorff + vitrification + epuisement en amorceur
M0 = 1;
kp = 316.23;
kt = 10^7.8;
ri = 8.36*10^(-9);
R = (ri/kt)^(1/2);
switch parametre
    case 'none'
        alpha = kp*R*M./(kp*R*M+kt*R^2);
        dpn = 1./(1-alpha);
    case 'trommdorff'
        log_kt = kt_tromdorff(1-M/M0);
        kt = 10.^log_kt;
        R = sqrt(ri/kt);
        alpha = kp*R*M./(kp*M*R+kt*R^2);
        dpn = 1./(1-alpha);
    case 'tromvitre'
        log_kt = kt_tromdorff(1-M/M0);
        log_kp = kp_vitrification(1-M/M0);
        kp = 10.^log_kp;
        kt = 10.^log_kt;
        R = sqrt(ri./kt);
        alpha = kp.*R.*M./(kp.*M.*R+kt.*R.^2);
        dpn = 1./(1-alpha);
    case 'transfert'
        Cs = 0.66;
        log_kt = kt_tromdorff(1-M/M0);
        log_kp = kp_vitrification(1-M/M0);
        kp = 10.^log_kp;
        kt = 10.^log_kt;
        ks = Cs.*kp;
        R = sqrt(ri./kt);
        alpha = kp.*R.*M./(kp.*R.*M + ks.*R + kt.*R.^2);
        dpn =1./(1-alpha); 
        
        
end