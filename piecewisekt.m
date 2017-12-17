function y = piecewisekt(x)
% PIECEWISEKT - Cette fonction MATLAB retourne la constante de propagation
% k_t en fonction de la conversion en monomeres x, sur base des donnees du
% professeur Hamielec.
if x <= .1
xxx = [0, .05, .1];
yyy = [7.66668, 7.6, 7.4611];
pp = polyfit(xxx,yyy,2);
y = polyval(pp,x);
else
xx = [ones(1,10)*0.1, 0.2, 0.3, 0.4, 0.528, 0.6, 0.688, 0.8, ones(1,10)];
yy = [ones(1,10)*7.46666667, 6.666667, 5.888889, ...
5.777778, 5.22222, 4.4444, 3.8888, 3.22222, ones(1,10)*1.9];
p = polyfit(xx,yy,1);
t = linspace(0.4001,0.848,100);
y = polyval(p,x);
end
