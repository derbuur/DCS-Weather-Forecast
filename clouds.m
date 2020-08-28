function [PgesR] = clouds(pressure_spread,pressure_excess,centerZ,centerX,xdim_unten,xdim_oben,zdim_links,zdim_rechts,ellipticity,rotation,WeatherName)
% This function generates the map with the clouds


figure('Name',WeatherName)
t = linspace(0,2*pi,100)'; 

gridsize = 100000;
%--------------- Hintergrundbild einfügen

  img = imread('CaucasusSatellite.png');
 

  min_x = -2000000;
  max_x = 2000000;
  min_y = -2000000;
  max_y = 2000000;
  
  
  imagesc([min_y max_y],[  max_x  min_x], img);

  hold on
  set(gca,'ydir','normal');

  %--------------- Hintergrundbild einfügen ende
  cmap = [1 1 1 %white
          0 0 0]; % black
        
  hold on


[PgesR,Z,X] = IsobarenCalculation(gridsize,-2000000,  2000000, -2000000, 2000000,pressure_spread,pressure_excess,centerX,centerZ,ellipticity,rotation);
set(gca,'ydir','normal');


PgesR(PgesR>101325)=NaN;

P_scalde=( max(max(PgesR)) - PgesR ) ./ ( max(max(PgesR)) - min(min(PgesR)) );


Xrand = X+(rand(size(X))-0.5)*gridsize;
Zrand = Z+(rand(size(Z))-0.5)*gridsize;

  scatter (Zrand, Xrand, (P_scalde+0.0001)*350,"w","filled")

set(gca,'DataAspectRatio',[1000000 1000000 1])
colormap('gray');



drawnow ()

hold off

caxis([913 1113])

set(gca,'xtick',[])
  set(gca,'xticklabel',[])
  set(gca,'ytick',[])
  set(gca,'yticklabel',[])
  

%print ('clouds.png', "-S819,819")
endfunction