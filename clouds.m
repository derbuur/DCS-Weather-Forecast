function [PgesR] = clouds(pressure_spread,pressure_excess,centerZ,centerX,xdim_unten,xdim_oben,zdim_links,zdim_rechts,ellipticity,rotation,WeatherName)
figure('Name',WeatherName,'visible','off')
t = linspace(0,2*pi,100)'; 

gridsize = 100000;

##  cmap = [1 1 1 %white
##          0 0 0]; % black
 [PgesR,Z,X] = IsobarenCalculation(gridsize,-2000000,  2000000, -2000000, 2000000,pressure_spread,pressure_excess,centerX,centerZ,ellipticity,rotation);
       
 
  [WZ,WX] = gradient(PgesR);
dabf= sqrt(WZ.^2 + WX.^2);
relC = PgesR < 101325;
%colormap('gray');
[h]=pcolor(Z,X,dabf.*relC);

shading interp;
 axis tight;


set(gca,'DataAspectRatio',[1000000 1000000 1])
colormap('gray');

%set(h,'EdgeAlpha',0,'FaceAlpha',0.7);
%set(h,'facealpha',0.3)
drawnow ()


%caxis([913 1113])

  set(gca,'xtick',[]);
  set(gca,'xticklabel',[]);
  set(gca,'ytick',[]);
  set(gca,'yticklabel',[]);
  

print ('clouds.png', "-S819,819")
system("magick convert clouds.png -crop 635x634+106+79 -resize 819x819 cloudscrop.png");

system("magick convert cloudscrop.png -background black -alpha copy -type truecolormatte PNG32:cloudscropT.png");

system ("magick composite -compose atop cloudscropT.png CaucasusSatellite.png CaucasusOverClouds.png");
system ("magick composite -compose atop CaucasusBorders.png CaucasusOverClouds.png CaucasusOverCloudsBoarders.png");
system("CaucasusOverCloudsBoarders.png");
endfunction

