function [Rn,Rm]=calcul_rayon_courbure(a,inv_f,phi)
[f,b,e,e_prime,alpha,c]=calcul_parametres_ellipsoides(a,inv_f);
% Rm:Rayon de courbure de section normale du méridien
% Rn:Rayon de courbure de section normale du premier verticale
phi=dms2degrees(phi);
w=sqrt(1-e*e*sind(phi)*sind(phi));
Rm=a*(1-e*e)/(w^3);
Rn=a/w;
end
