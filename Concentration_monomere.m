function M = Concentration_monomere(t)
ri = 8.36*10^(-9);
k_t = 10^7.8;
R = (ri/k_t)^(1/2);
k_p = 316.23;
M = 9.4*exp(-k_p*R*t);
end