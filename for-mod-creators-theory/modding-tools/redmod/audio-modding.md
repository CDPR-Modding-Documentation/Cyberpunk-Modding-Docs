---
description: Redmod allows you to add new and edit existing audio events.
---

# Audio Modding: Redmod

## Summary <a href="#summary" id="summary"></a>

**Last documented update:** July 18 2025 by [Lizzie Kieser](https://app.gitbook.com/u/T87dp3CmmkfQfjAnlwvPxLhqCnV2)

REDmod allows you to add new and override existing audio events. Note that any events added or overridden will use a different Wwise event, removing any special parameters and Wwise logic attached (e.g. overriding a gun sound event will result in it no longer receiving time-dilation effects processing).

This will not override `.wem` files; it will instead override audio events, which are what use `.wem` files.  That way, you can override events that layer or randomize between multiple sounds without manually altering each sound.

### Audio Modding - WolvenKit Integration

The REDmod sound import tool can be used in a [WolvenKit](https://github.com/WolvenKit/Wolvenkit) project.

* Add the `.wav` sound files you wish to import to your `/customSounds` folder in your mod project
* Click Tools > _Sound Modding Tool_
* In the Sound Modding Tool, choose which event to mod from the list of game sound events
* Adjust the [parameters](audio-modding.md#parameters) in the bottom right
* Click _Save_

<figure><img src="../../../.gitbook/assets/WolvenKit_soundmodding.jpg" alt=""><figcaption></figcaption></figure>

### Audio Modding - Manually

Place raw `.wav` audio files inside `<Cyberpunk 2077>/mods/<name>/customSounds`. Include a **info.json** file with your mod (`<Cyberpunk 2077>/mods/<name>/info.json`) where you sepcify how to use your custom sounds. You may use nested folders with `\\` (see last entry in example).

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
    {
      "name": "my_new_sound",
      "type": "mod_sfx_room",
      "file": "mysounds\\new_sound.wav",
      "gain": 0.4,
      "pitch": 0.05
    },
  ]
}
```

### Parameters

* **name** - `String` The game audio event to override.&#x20;
* **type** - `String` The sound type. Options are:
  * **mod\_skip**: Do not play this sound event
  * **mod\_sfx\_2d**: Will be played without any positions / attenuation
  * **mod\_sfx\_city**: Has a longer attenuation that is suitable for city sounds
  * **mod\_sfx\_low\_occlusion**: Has a long attenuation that isn't occluded much e.g. a VO or quest sound that you don't want to be muffled
  * **mod\_sfx\_occlusion**: Medium attenuation with normal occlusion
  * **mod\_sfx\_radio**: Needs to be tuned to a broadcast channel (e.g. radio)
  * **mod\_sfx\_room**: Has a shorter attenuation suitable for something that can be heard across a room
  * **mod\_sfx\_street**: Has a medium attenuation, good for something to be heard down a street
  * **mod\_sfx\_ui**: For menu and UI sound replacement
* **file** - `String` The `.wav` file to use (inside `/customSounds`)
* **gain** - `Float` How loud the sound is; ranges from 0 to 1.
* **pitch** - `Float` The amount of pitch variance applied to the sound; ranges from 0 to 1.

