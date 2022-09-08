# Modding Guide

## Animation Modding

### Animation Modding - WolvenKit Integration

The REDmod animation import tool can be used as a Plugin in [WolvenKit](https://github.com/WolvenKit/Wolvenkit).

* Add the `.re` animation file you wish to import to your **/Raw** folder in your mod project
* Add the `.anims` animation set file from the game with the *Asset Browser*
* Click View > Import/Export tool
* In the Import/Export tool, navigate to *Import*: a list of all `.re` animation file in your **/Raw** folder will appear
* Double click the entry to change the import options:
  * Select the `.anims` animation set file to import from the dropdown
  * Select the *animation name* you wish to override from the dropdown
* Click *process*

> INFO - It is best to name `.re` animation correctly even if you replace an existing animation, because the imported animation will always have the filename of the `.re` file.

<figure><img src="../../../.gitbook/assets/WolvenKit_animationmodding.jpg" alt=""><figcaption></figcaption></figure>

### Animation Modding - Manually

> See also: **Import Command**

The `import` command imports an `.re` animation file into an existing `.anims` animation set file.

Optional parameters include specifying an existing animation name to rename inside the animset file (otherwise the filename of the `.re` animation file is used) or specifying a different output path (default is overwrite).

> INFO - It is best to name `.re` animation correctly even if you replace an existing animation, because the imported animation will always have the filename of the `.re` file.

## Script Modding

To make a script mod in REDmod:

1. make a new mod and create a new folder here: `<Cyberpunk 2077>/mods/MODNAME/scripts`
2. copy the  `.script` file(s) you want to change from `<Cyberpunk 2077>/tools/redmod/scripts`:exclamation: *preserving the folder structure!*
3. add an `info.json` file to `<Cyberpunk 2077>/mods/MODNAME/scripts` with some mod info

```json
{
    "name": "MODNAME",
    "description": "Description for the script mod.",
    "version": "1.0",
    "customSounds":    [ ]
}
```

:white_check_mark:  Done. To test, launch the game with REDmod.

## TweakDB Modding

To make a tweak mod in REDmod:

1. make a new mod and create a new folder here: `<Cyberpunk 2077>/mods/MODNAME/tweaks`
2. copy the `.tweak` file(s) you want to change from `<Cyberpunk 2077>/tools/redmod/tweaks` :exclamation: *preserving the folder structure*!
3. add a `info.json` file to `<Cyberpunk 2077>/mods/MODNAME/tweaks` with some mod info

```json
{
    "name": "MODNAME",
    "description": "Description for the tweak mod.",
    "version": "1.0",
    "customSounds":    [ ]
}
```

:white_check_mark:  Done. To test, launch the game with REDmod.

## Audio Modding

### Audio Modding - WolvenKit Integration

The REDmod animation import tool can be used as a Plugin in [WolvenKit](https://github.com/WolvenKit/Wolvenkit).

* Add the `.wav` sound files you wish to import to your **/customSounds** folder in your mod project
* Click View > *Sound Modding tool*
* In the Sound Modding tool, choose which to mod from the list of game sound events
* Adjust the parameters
* Click *Save*

<figure><img src="../../../.gitbook/assets/WolvenKit_soundmodding.jpg" alt=""><figcaption></figcaption></figure>

### Audio Modding - Manually

Place raw `.wav` audio files inside `<Cyberpunk 2077>/mods/<name>/customSounds`.
Include a **info.json** file with your mod (`<Cyberpunk 2077>/mods/<name>/customSounds/info.json`) where you sepcify how to use your custom sounds.

#### Example

```json
{
  "name": "newmodtest",
  "version": "1.0",
  "customSounds": [
    {
      "name": "amb_bl_eq_medical_electronics_small",
      "type": "mod_skip"
    },
    {
      "name": "w_gun_revol_power_overture_fire_suppressor",
      "type": "mod_skip"
    },
    {
      "name": "w_gun_npc_dian_reload",
      "type": "mod_sfx_2d",
      "file": "are_you_sure_about_that.wav",
      "gain": 1.0,
      "pitch": 0.1
    }
  ]
}
```

### Parameters

* **name** - the game audio event to override
* **type** - the sound type. Options are:
  * mod_skip: do not play this sound event
  * mod_sfx_2d : will be played without any positions / attenuation
  * mod_sfx_city : has a longer attenuation that is suitable for city sounds
  * mod_sfx_low_occlusion : has a long attenuation that isn't occluded much e.g. a VO or quest sound that you don't want to be muffled
  * mod_sfx_occlusion : medium attenuation with normal occlusion
  * mod_sfx_radio : needs to be tuned to a broadcast channel (e.g. radio)
  * mod_sfx_room : has a shorter attenuation suitable for something that can be heard across a room
  * mod_sfx_street : has a medium attenuation, good for something to be heard down a street
* **file** - the `.wav` file to use (inside `/customSounds`)
* **gain** and **pitch**
