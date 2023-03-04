function [Xproj,Yproj]= coordonnees_geographiques_cartographiques(a,inv_f,lat0,long0,K0,lat,long)
[f,b,e,e_prime,alpha,c]= calcul_parametres_ellipsoides(a,inv_f);
lat=dms2degrees(lat);
lat=deg2rad(lat);
lat0=dms2degrees(lat0);
lat0=deg2rad(lat0);
long=dms2degrees(long);
long=deg2rad(long);
long0=dms2degrees(long0);
long0=deg2rad(long0);
U0=log(tan((pi/4)+(lat0/2)))-(e*e/2)*log((1+e*sin(lat0))/(1-e*sin(lat0)));
U=log(tan((pi/4)+(lat/2)))-(e*e/2)*log((1+e*sin(lat))/(1-e*sin(lat)));
U_bar=U-U0;
N0=a/(sqrt(1-e*e*sin(lat0)*sin(lat0)));
e0=K0*N0*cot(lat0);
Xproj=e0*exp(-U_bar*sin(lat0))*sin(sin(lat0)*(long-long0));
Yproj=-e0*(exp(-U_bar*sin(lat0))*cos(sin(lat0)*(long-long0))-1);

