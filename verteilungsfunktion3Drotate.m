function [P] = verteilungsfunktion3Drotate(x,z,pressure_spread,pressure_excess,centerX,centerZ,ellipticity,rotation)
%% These is the Gaussian Distribution Funktion

sigma_X = pressure_spread;
sigma_Z = ellipticity * sigma_X;
theta = rotation;


    c = cos(theta)^2/(2*sigma_X^2) + sin(theta)^2/(2*sigma_Z^2);
    b = -sin(2*theta)/(4*sigma_X^2) + sin(2*theta)/(4*sigma_Z^2);
    a = sin(theta)^2/(2*sigma_X^2) + cos(theta)^2/(2*sigma_Z^2);

 
P = pressure_excess *exp( - (a*(z - centerZ).^2 + 2*b*(z - centerZ).*(x - centerX) + c*(x - centerX).^2));



endfunction