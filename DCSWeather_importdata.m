function [ellipticity,centerZ,pressure_spread,rotation,pressure_excess,centerX,WeatherName] = DCSWeather_importdata()
[fname, fpath, fltidx] = uigetfile ("*.lua",'open DCS weather file','C:\Users\buur\Saved Games\DCS\MissionEditor\weather\dynamic\');

% This function import the values from the saved games weather folder

fid = fopen([fpath fname],'rt');

WeatherName = fname;

C = textscan(fid, '%s', ...
    'Delimiter','', 'Whitespace','\n', 'CommentStyle','*');
fclose(fid);

ellipticity = [];
centerZ = [];
groupId = [];
pressure_spread = [];
rotation = [];
pressure_excess = [];
centerX = [];

beginCyclones = strfind(C{1},'cyclones =');
Index_beginCyclones = find(not(cellfun('isempty',beginCyclones)));
endCyclones = strfind(C{1},'end of cyclones');
Index_endCyclones = find(not(cellfun('isempty',endCyclones)));
C = C{1}(Index_beginCyclones+2:Index_endCyclones-1);

number_cyclones = size(C,1)/10;
j=1;
  for i = 1: 10 : size(C,1)
   A = C(i:i+9);
   ellipticity(j) = textscan(A(find(not(cellfun('isempty',strfind(A,'ellipticity ='))))){1,1},'%s %f','Delimiter','='){1,2};
   centerZ(j) = textscan(A(find(not(cellfun('isempty',strfind(A,'centerZ ='))))){1,1},'%s %f','Delimiter','='){1,2};
   groupId(j) = textscan(A(find(not(cellfun('isempty',strfind(A,'groupId ='))))){1,1},'%s %f','Delimiter','='){1,2};
   pressure_spread(j) = textscan(A(find(not(cellfun('isempty',strfind(A,'pressure_spread ='))))){1,1},'%s %f','Delimiter','='){1,2};
   rotation(j) = textscan(A(find(not(cellfun('isempty',strfind(A,'rotation ='))))){1,1},'%s %f','Delimiter','='){1,2};
   pressure_excess(j) = textscan(A(find(not(cellfun('isempty',strfind(A,'pressure_excess ='))))){1,1},'%s %f','Delimiter','='){1,2};
   centerX(j) = textscan(A(find(not(cellfun('isempty',strfind(A,'centerX ='))))){1,1},'%s %f','Delimiter','='){1,2};
   
   j=j+1;
  endfor
endfunction