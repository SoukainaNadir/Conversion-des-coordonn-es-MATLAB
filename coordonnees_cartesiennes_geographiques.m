function [lat,long,h]=coordonnees_cartesiennes_geographiques(a,inv_f,X,Y,Z)
[f,b,e,e_prime,alpha,c]=calcul_parametres_ellipsoides(a,inv_f);
r=sqrt(X*X+Y*Y+Z*Z);
u=atan(Z/(sqrt(X*X+Y*Y))*((1-f)+a*e*e/r));
u=rad2deg(u);
lat=atan((Z*(1-f)+e*e*a*sind(u)^3)/((1-f)*(sqrt(X*X+Y*Y)-e*e*a*cosd(u)^3)))
long=atan(Y/X);
lat=rad2deg(lat);
h=sqrt(X*X+Y*Y)*cosd(lat)+Z*sind(lat)-a*sqrt(1-e*e*sind(lat)*sind(lat));
long=rad2deg(long);
long=degrees2dms(long);
lat=degrees2dms(lat);
end
