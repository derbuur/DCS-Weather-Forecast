# DCS-Weather-Forecast
Making a forecast of mission weather using the dynamic weather in Digital Combat Simulator.
This programm is in an alpha status!!!!!!!!!!!

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
![Image pressure map](https://github.com/derbuur/DCS-Weather-Forecast/blob/master/examplePictures/pressuremap.png)
3. Clouds distributet only in low pressure system. Deeper the pressure, more clouds. This allows to calculate a simple cloud distribution.
![Image clouds](https://github.com/derbuur/DCS-Weather-Forecast/blob/master/examplePictures/clouds.png)

## Installation
The code is based on [GNU Octave](https://www.gnu.org/software/octave/), you have to install it to run the programm. It should also run under [Matlab](https://de.mathworks.com/products/matlab.html). For exporting the pictures, [Image Magick](https://imagemagick.org/) is foreseen.
For installation simply download the files in a folder.

## Notes
Here some points intressting for the development

- Therefore the matematicl notation in DCS is not as normal and everthing in a clockwise coordinate system here a picture how to count the rotation and the ellipticity.

![clockwise coordinat system](https://github.com/derbuur/DCS-Weather-Forecast/blob/master/examplePictures/rotation.png)

- Making some short test about the movement of the pressuresystem over time. Found for a single system there is a general movement (whatever if low or high) of round about 135km/h to the east. Straight to the east with no varianz.

## To Do

- [ ] Verify the exact values for the Gaussian Distribution
- [ ] check if the pressure field correct in the game
- [ ] check if the pressure field changes over the time
- [ ] search for the relation between pressure and rain
- [ ] add the possibility to change the pseudo cyclones by mous and export it to the game
- [ ] bring the programm to a more suitible programming language
