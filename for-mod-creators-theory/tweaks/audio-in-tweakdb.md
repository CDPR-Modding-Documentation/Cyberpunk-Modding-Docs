---
description: Description of how audio is linked in tweaks
---

# Audio in TweakDB

## Summary

**Created:** Feb 23 2025 by [Zhincore](https://app.gitbook.com/u/OsI9JXgCSSbt40hb327iBDif7Xv1 "mention")\
**Last documented update:** Feb 23 2025 by [Zhincore](https://app.gitbook.com/u/OsI9JXgCSSbt40hb327iBDif7Xv1 "mention")

Tweaks can contain `CName` fields related to audio, these CNames refer to entries defined in the `cooked_metadata.audio_metadata` file, entries there have a name field that's used in the tweaks, multiple entries can have the same name. Fields of these entries can be numbers, objects, lists, but most importantly CNames, those can refer to other entries in the file OR event names defined in `eventsmetadata.json` (and searchable in [SoundDB](https://sounddb.redmodding.org/sfx)).

{% hint style="warning" %}
This page is probably incomplete and only contains a dump of findings. If you find a discrepancy or know more, please edit it.
{% endhint %}



## Vehicles

Vehicles have two audio fields, `playerAudioResource` - settings for player-driven vehicles, and `trafficAudioResource` - settings for NPC-driven vehicles. A vehicle tweak can have both, none, or just one of these defined. Their values refer to complex cooked\_metadata structures, which define various settings including engine sounds, wheel sounds, bump sounds for each side of vehicle, sounds for detaching doors, etc. etc. Traffic audio resource is usually simpler than player one.

## Weapons

Weapons have also two audio fields, `audioName` - probably the main audio settings, and `audioWeaponConfiguration` which seems to be base settings, usually in melee weapons, where audioName overwrites some of the base settings. The cooked\_metadata entries they refer to contain separately settings for player and for NPCs, but also for body types and material types for bullet impacts etc. They can get deeply nested and even recursive infinitely, watch out for that when processing them programatically.

Additionaly, weapons can have `audioSwitchName` and `audioSwitchValue`, both of which are defined in `eventsmetadata.json`. This is used to tell the audio engine what weapon type this weapon is, so that maybe different sounds are played. For example `Items.Preset_Burya_Default` has `audioSwitchName: w_pistol_type` and `audioSwitchValue: w_pistol_power`, which means in the engine the switch `w_pistol_type` gets assigned the value `w_pistol_power` when playing the weapon's sounds.

## Radios

Radios are defined in `RadioStation.*` tweaks, those contain `displayName`, `icon` and an `index`. That index refers to an item in `radioStations` array of cooked\_metadata entry named `radio_stations_config`, that item then contains name of other entry within cooked\_metadata, which then contains the tracks (event names) and blips (also event names).

Names of all radio tracks are defined in the `radio_tracks_metadata` entry of cooked\_metadata, mapped by `trackEventName`.
