# Default Audio Switcher

### Purpose: 
Created for switching default sound source between my monitor speakers and headphones with 1 click.

### Prerequisites:
* Windows OS
* Download and copy NirCmd to your windows directory
[NirCmd](https://www.nirsoft.net/utils/nircmd.html)

### Setup Switch Sound Source:
1. Find the names of your sound sources for your PC 

```sh
nircmd showsounddevices
```

2. Pick the two you want to switch between
3. Edit the SwitchSoundSource+.bat file with the names of your sound sources
(replace exampleSource1 and exampleSource2 with the 2 sound source names on your pc)
```sh
SET defaultSoundSource="exampleSource1"
SET soundSource0="exampleSource1"
SET soundSource1="exampleSource2"
```

4. Save the SwitchSoundSource+.bat 
5. Run SwitchSoundSource.vbs

### Optional:
* Create shortcut to the .vbs file and set icon location to ico file in this folder (or your own custom icon)
* Set hotkey via shortcut properties

@author [Glenn Chon](https://github.com/glennchon)
Contact me if you know someone that's hiring!
