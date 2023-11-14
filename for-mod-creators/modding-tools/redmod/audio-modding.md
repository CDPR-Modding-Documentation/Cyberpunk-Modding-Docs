# Audio Modding

### Audio Modding - WolvenKit Integration

The REDmod sound import tool can be used in a [WolvenKit](https://github.com/WolvenKit/Wolvenkit) project.

* Add the `.wav` sound files you wish to import to your **/customSounds** folder in your mod project
* Click Tools > _Sound Modding Tool_
* In the Sound Modding Tool, choose which event to mod from the list of game sound events
* Adjust the [parameters](audio-modding.md#parameters) in the bottom right
* Click _Save_

<figure><img src="../../../.gitbook/assets/WolvenKit_soundmodding.jpg" alt=""><figcaption></figcaption></figure>

### Audio Modding - Manually

Place raw `.wav` audio files inside `<Cyberpunk 2077>/mods/<name>/customSounds`. Include a **info.json** file with your mod (`<Cyberpunk 2077>/mods/<name>/customSounds/info.json`) where you sepcify how to use your custom sounds.

#### Example

```json
{
  "name": "newmodtest",
  "version": "1.0.0",
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
  * **mod\_skip**: do not play this sound event
  * **mod\_sfx\_2d**: will be played without any positions / attenuation
  * **mod\_sfx\_city**: has a longer attenuation that is suitable for city sounds
  * **mod\_sfx\_low\_occlusion**: has a long attenuation that isn't occluded much e.g. a VO or quest sound that you don't want to be muffled
  * **mod\_sfx\_occlusion**: medium attenuation with normal occlusion
  * **mod\_sfx\_radio**: needs to be tuned to a broadcast channel (e.g. radio)
  * **mod\_sfx\_room**: has a shorter attenuation suitable for something that can be heard across a room
  * **mod\_sfx\_street**: has a medium attenuation, good for something to be heard down a street
  * **mod\_sfx\_ui**: for menu and ui sound replacement
* **file** - the `.wav` file to use (inside `/customSounds`)
* **gain** and **pitch**
