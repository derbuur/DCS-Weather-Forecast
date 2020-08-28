# DCS-Weather-Forecast
Making a forecast of mission weather using the dynamic weather in Digital Combat Simulator

The dynamic weather system in DCS depends on placing pseudo cyclones in mission editor. From these pseudo zyclones the game engine calculate the weather system in game.
This program try to reengineer the variabls with will result in the mission weather.


## Assumptions
All setting about the weather system are stored under `\Saved Games\DCS\MissionEditor\weather\dynamic in lua files.` There we have access to all data.

1. Pseudo cyclones are described by [Gaussian functions](https://en.wikipedia.org/wiki/Gaussian_function) which decribe the derrivation from the standard pressure of 1013.25 hPa.
The pseudo cyclones are described by following variables:
```
cyclones = 
    {
        [1] = 
        {
            pressure_spread = 926611.52796014,
            centerZ = 329105.91683564,
            groupId = 1025,
            ellipticity = 0.92677819465987,
            rotation = 2.4791538842831,
            pressure_excess = -8000,
            centerX = -121194.69980322,
        }, -- end of [1]
```
Plotting them on the map you can see that most of the pseudo cyclones are outside the normal Caucasus map. For this reason the mapsize in these project is 4000x4000km.
![Image pseudo cyclones](https://github.com/derbuur/DCS-Weather-Forecast/blob/master/examplePictures/pseudo_cyclons.png)

2. The addition of each single pseudo cyclone results in a global pressure system with resulting highs and lows.For addition, simply calculated the Gaussian function on a grid and summarize them. The result is a low over Turkey and two highs. Once over Russia and the other one over the Caspian Sea.These resulting weather systems are responsible for the game weather.
![Image pseudo cyclones](https://github.com/derbuur/DCS-Weather-Forecast/blob/master/examplePictures/pressuremap.png)
3. Clouds distributet only in low pressure system. Deeper the pressure, more clouds.
