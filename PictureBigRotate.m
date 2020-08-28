function [c,h] = PictureBigRotate(pressure_spread,pressure_excess,centerZ,centerX,xdim_unten,xdim_oben,zdim_links,zdim_rechts,ellipticity,rotation,WeatherName)
% This function generates the pressure map



figure('Name',WeatherName)
t = linspace(0,2*pi,100)'; 

gridsize = 100000;
%--------------- Hintergrundbild einf�gen

  img = imread('CaucasusBig.png');


  min_x = -2000000;
  max_x = 2000000;
  min_y = -2000000;
  max_y = 2000000;
  
  
  imagesc([min_y max_y],[  max_x  min_x], img);

  hold on
  set(gca,'ydir','normal');

  %--------------- Hintergrundbild einf�gen ende
  cmap = [1 1 1 %white
          0 0 0]; % black
        
  hold on

[PgesR,Z,X] = IsobarenCalculation(gridsize,-2000000,  2000000, -2000000, 2000000,pressure_spread,pressure_excess,centerX,centerZ,ellipticity,rotation);
set(gca,'ydir','normal');

  v =1013-100 : 5 : 1013+100;
  [c,h]=contour(Z,X,PgesR./100,v,'ShowText','on','LevelStep',5);

set(gca,'DataAspectRatio',[1000000 1000000 1])
set(gca,'xtick',[])
  set(gca,'xticklabel',[])
  set(gca,'ytick',[])
  set(gca,'yticklabel',[])
colormap('gray');
drawnow ()


hold off

caxis([913 1113])
endfunction