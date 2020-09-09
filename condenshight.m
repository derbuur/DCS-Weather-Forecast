function [h] = condenshight(T_G)
h_fix = 11000; %hoehe Fixtemperatur
T_fix = -56.5; %Fixtemperatur

T_C = -40; % Kondensstreifenbildungstemperatur

h = h_fix + h_fix./(T_G - T_fix) * (T_fix - T_C);
endfunction