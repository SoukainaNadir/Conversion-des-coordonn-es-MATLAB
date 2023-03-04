function [lat,long,h]=coordonnees_cartesiennes_geographiques_indirect(a,inv_f,X,Y,Z,erreur_donne)
[f,b,e,e_prime,alpha,c]= calcul_parametres_ellipsoides(a,inv_f);
% lat_0:Premiere valeur approché da la latitude
lat_0=atan((Z/sqrt(X*X+Y*Y))*(1/(1-e*e)));
% N0:Premiere valeur approché du rayon de courbure
N0=a/(sqrt(1-e*e*sin(lat_0)*sin(lat_0)));
lat_1=atan((Z/(sqrt(X*X+Y*Y)))*(1+(N0*e*e*sin(lat_0))/Z));
N1=a/(sqrt(1-e*e*sin(lat_1)*sin(lat_1)));
erreur=abs(lat_0 - lat_1)
while(erreur > erreur_donne)
    lat_0=lat_1;
    N0=N1;
    lat_1=atan((Z/(sqrt(X*X+Y*Y)))*(1+(N0*e*e*sin(lat_0))/Z));
    N1=a/(sqrt(1-e*e*sin(lat_1)*sin(lat_1)));
    erreur=abs(lat_0-lat_1)
end
lat=lat_1;
long=atan(Y/X);
h=(Z/sin(lat))-N1*(1-e*e);
long=rad2deg(long);
long=degrees2dms(long);
lat=rad2deg(lat);
lat=degrees2dms(lat);
end