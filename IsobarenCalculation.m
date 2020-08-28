function [PgesR,X,Z] = IsobarenCalculation(gridsize, xdim_unten, xdim_oben, zdim_links, zdim_rechts,pressure_spread,pressure_excess,centerX,centerZ,ellipticity,rotation)
 % This function generates the grid and calculates the sum of the single Gaussian Distributions
  x = xdim_unten : gridsize : xdim_oben;
  z = zdim_links : gridsize : zdim_rechts;


  [Z, X] = meshgrid (z, x);
  PgesR = ones(size(X,1),size(X,2))*101325;

    for i = 1:size(pressure_spread,2 )
 
      [PR] = verteilungsfunktion3Drotate(Z,X,pressure_spread(i),pressure_excess(i),centerX(i),centerZ(i),ellipticity(i),rotation(i));
      PgesR = PgesR + PR;
    end
  
endfunction
