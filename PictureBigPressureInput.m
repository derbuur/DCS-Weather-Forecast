function [c,h] = PictureBigPressureInput(pressure_spread,pressure_excess,centerZ,centerX,xdim_unten,xdim_oben,zdim_links,zdim_rechts,ellipticity,rotation,WeatherName)
% This function generates the map witch shows the input value

figure('Name',WeatherName)
t = linspace(0,2*pi,100)'; 

gridsize = 100000;
%--------------- Hintergrundbild einfügen

  img = imread('CaucasusBig.png');


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
for i = 1 : numel(centerZ) %// x and y are the same lengths
    text(centerZ(i),centerX(i),['' num2str((pressure_excess(i)),'%4.0f') '']);

  
circsx = pressure_spread(i).*sin(t) + centerX(i); 
circsz = ellipticity(i) * pressure_spread(i).*cos(t) + centerZ(i); 
plot(circsz,circsx); 
    
    end

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