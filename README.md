# DCS-Weather-Forecast
Making a forecast of mission weather using the dynamic weather in Digital Combat Simulator

The dynamic weather system in DCS depends on placing pseudo cyclones in mission editor. From these pseudo zyclones the game engine calculate the weather system in game.
This program try to reengineer the variabls with will result in the mission weather.


## Assumptions
1. Pseudo cyclones are described by Gaussian functions which decribe the derrivation from the standard pressure of 1013.25 hPa.
2. The addition of each single pseudo cyclone results in a global pressure system with resulting highs and lows.
3. Clouds distributet only in low pressure system. Deeper the pressure, more clouds.
