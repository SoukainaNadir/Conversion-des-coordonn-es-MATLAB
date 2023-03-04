function [lat,long]= coordonnees_cartographies_geographies(a,inv_f,K0,lat0,long0,Xproj,Yproj)
[f,b,e,e_prime,alpha,c]= calcul_parametres_ellipsoides(a,inv_f);
lat0=dms2degrees(lat0);
lat0=deg2rad(lat0);
long0=dms2degrees(long0);
long0=deg2rad(long0);
N0=a/(sqrt(1-e*e*sin(lat0)*sin(lat0)));
e0=K0*N0*cot(lat0);
U_bar=(1/(2*sin(lat0)))*log(e0*e0/(Xproj*Xproj+(e0-Yproj)^2));
U0=log(tan((pi/4)+(lat0/2)))-(e*e/2)*log((1+e*sin(lat0))/(1-e*sin(lat0)));
U=U_bar+U0;
E0=(e*e/2)*log((1+e*sin(lat0))/(1-e*sin(lat0)));
lat1=2*atan((exp(U+E0)-1)/(exp(U+E0)+1));
E1=(e*e/2)*log((1+e*sin(lat1))/(1-e*sin(lat1)));
erreur=abs(lat1-lat0);
long=(1/sin(lat0))*atan(Xproj/(e0-Yproj))+long0;
while(erreur>=(pi*10^(-8))/200)
    lat0=lat1;
    E0=E1;
    lat1=2*atan((exp(U+E0)-1)/(exp(U+E0)+1));
    E1=(e*e/2)*log((1+e*sin(lat1))/(1-e*sin(lat1)));
    erreur=abs(lat1-lat0)
end
lat=lat1;
long=rad2deg(long);
long=degrees2dms(long);
lat=rad2deg(lat);
lat=degrees2dms(lat);

    