---
description: How to mod audio using eventmetadata.json
---

# Modding Events Metadata

## Summary

**Published:** May, 2024 **by** Darckray\
**Last documented update:** June 8, 2024 **by** Zhincore

This guide explains ways to edit game's sounds by changing `eventsmetdata.json` file. Such changes are incompatible with other mods that modify sounds but is the most powerful way.

If you need to make compatible changes like muting a sound or adding a custom one see the REDmod guide instead:

{% content-ref url="../../for-mod-creators-theory/modding-tools/redmod/audio-modding.md" %}
[audio-modding.md](../../for-mod-creators-theory/modding-tools/redmod/audio-modding.md)
{% endcontent-ref %}

## Replacing a sound with other sound that already exists in-game

This is by far the easiest edit as long as you know what you want to change, and all you need is wolvenkit and notepad. Right click eventsmetadata.json in wolvenkit and click on 'convert to json', this will make the file readable. Now, open up eventsmetadata.json.json in notepad and look for the events that have the sound that you need, for example, you can press CTRL+F and search for `w_melee_blunt_impact_bat.` You'll see `isLooping`, `maxAttenuation`, `maxDuration`, `minDuration` (see below for information on these) and the event name, as well as the WWise ID right at the end. Copy this ID.&#x20;

```
    {
              "$type": "audioAudioEventMetadataArrayElement",
              "isLooping": 0,
              "maxAttenuation": 30,
              "maxDuration": 0.669667006,
              "minDuration": 0.550104022,
              "redId": {
                "$type": "CName",
                "$storage": "string",
                "$value": "w_melee_blunt_impact_bat"
              },
              "stopActionEvents": [],
              "tags": [
                {
                  "$type": "CName",
                  "$storage": "string",
                  "$value": "Melee"
                },
                {
                  "$type": "CName",
                  "$storage": "string",
                  "$value": "w_melee_blunt"
                }
              ],
              "wwiseId": 1572487742
            }
```

Now, say that you want another melee weapon to sound like a baseball bat, all you have to do is to look for the event that has the sound you want to change for that weapon as outlined above and replace the ID with the one you copied earlier for all the events with that name. Save your changes and right click on eventsmetadata.json.json in wolvenkit and click on convert from json, pack your mod, install it and your melee weapon should now sound like a baseball bat!!

## **Muting a sound**

{% hint style="warning" %}
Note that you should prefer using [the REDmod method](../../for-mod-creators-theory/modding-tools/redmod/audio-modding.md) instead for this task.
{% endhint %}

Add eventsmetadata.json to your wolvenkit project, right click on it inside your project and click on 'convert to json', then open the resulting eventsmetadata.json.json in notepad and look for the event that has the sounds you want to mute with CTRL+F. After you've found it, look for its WWise ID and set it to 0, save the file, right click on it in your project again, click on convert from json and pack your mod. Any sounds associated to the event you edited should now be muted.

## Event properties

The information that follows is the result of what was observed during testing and has not been fully confirmed as of February 16, 2024.

`isLooping`: whether or not the sound will loop, can be set to 0 or 1.

`maxAttenuation`: controls the loss of energy a sound will experience the further it travels. It is not known whether this property has an impact on how loud a sound is or how different environments make it behave, but it is speculated that the higher the maxAttenuation the further the sound can travel before it can't be heard anymore. Can be set to any value from 0 to 1000.

`maxDuration`: the amount of time a sound plays for before it stops.

`minDuration`:  the minimum amount of time a sound has to be played for before the game can stop it.

