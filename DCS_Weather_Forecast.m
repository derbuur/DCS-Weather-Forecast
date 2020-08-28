% Main file to start with

% DCS World dimensions
xdim_unten = -600000;
xdim_oben = 380000;
zdim_links = -559096;
zdim_rechts = 1129096;

gridsize = 10000;


[ellipticity,centerZ,pressure_spread,rotation,pressure_excess,centerX,WeatherName] = DCSWeather_importdata();

x = xdim_unten : gridsize : xdim_oben;
z = zdim_links : gridsize : zdim_rechts;


[X, Z] = meshgrid (x, z);



PictureBigPressureInput(pressure_spread,pressure_excess,centerZ,centerX,xdim_unten,xdim_oben,zdim_links,zdim_rechts,ellipticity,rotation,WeatherName);

PictureBigRotate(pressure_spread,pressure_excess,centerZ,centerX,xdim_unten,xdim_oben,zdim_links,zdim_rechts,ellipticity,rotation,WeatherName);

[PgesR] = clouds(pressure_spread,pressure_excess,centerZ,centerX,xdim_unten,xdim_oben,zdim_links,zdim_rechts,ellipticity,rotation,WeatherName);

