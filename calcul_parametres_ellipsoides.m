function [f,b,e,e_prime,alpha,c]= calcul_parametres_ellipsoides(a,inv_f)
% f:Aplatissement
% e:Premiere excentricité
% e_prime:Deuxieme excentricité
% alpha:Excentricité angulaire
% c:La courbure au pole
f=1/inv_f;
b=a-a*f;
e=sqrt(2*f-f*f);
e_prime=sqrt((a*a-b*b)/(b*b));
alpha=acos(a/b);
c=(a*a)/b;
end
