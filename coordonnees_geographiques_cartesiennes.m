function [X,Y,Z]=coordonnees_geographiques_cartesiennes(a,inv_f,lat,long,h)
[f,b,e,e_prime,alpha,c]=calcul_parametres_ellipsoides(a,inv_f);
[Rn,Rm]=calcul_rayon_courbure(a,inv_f,lat);
lat=dms2degrees(lat);
long=dms2degrees(long);
X=(Rn+h)*cosd(lat)*cosd(long);
Y=(Rn+h)*cosd(lat)*sind(long);
Z=(Rn*(1-e*e)+h)*sind(lat);
end