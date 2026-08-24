---
description: >-
  How to place a sound system driving any number of speakers, with a computer  
  the player uses to change what plays, without any scripting.
icon: speaker
---

# Sound Systems and Speakers

### Summary

**Published: 24/08/2026 by** [@Spuddeh](https://discord.com/users/124447344279158784)

**Last documented update: 24/08/2026 by** [@Spuddeh](https://discord.com/users/124447344279158784)

This guide shows you how to place a working sound system in the world: one hidden controller driving any number of speakers, all playing the same thing, with a computer terminal the player uses to change it.

It is entirely data driven. There is no Redscript and no CET, and nothing here needs a line of code written.

Everything used here is a base game system. The sound system and speakers are the same ones Cyberpunk uses in its own bars and apartments.

***

### Requirements

* [**WolvenKit 8.14+**](https://github.com/WolvenKit/WolvenKit)
* [**World Builder**](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/world-editing/object-spawner)
* [**ArchiveXL**](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/core-mods-explained/archivexl)
* [**TweakXL**](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/core-mods-explained/tweakxl)
* A [Wolvenkit Project](https://wiki.redmodding.org/wolvenkit/wolvenkit-app/usage/wolvenkit-projects)
* Knowledge of adding world objects with World Builder and merging them via ArchiveXL

***

### Before you start: what a sound system can play

Each entry on a sound system is one of two things, and which one decides whether this guide fits what you are building:

* **A radio station**, picked from the fourteen in the base game
* **A sound event**, named by its WWise event name

So it is not limited to radio. Which sound events work is still being worked out, and there is a section on it below, but the ones that do cover a great deal more than music.

**What will not work is a radio station added by a mod.** The station setting only understands the base game's fourteen, and there is no way to write a modded one into it. If you need custom stations to play, you want an approach built on radios rather than speakers: [Syncing Multiple Radios](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/world-editing/devices/syncing-multiple-radios) covers one.

***

### How it works

**The sound system is the brain and it is invisible.** It has no model at all. You place it anywhere, and it holds the list of things the player can choose from.

**The speakers are the sound.** Each one is a separate object you place wherever you want the sound coming from. They have models, so they can stand in for real speakers in your scene.

**They are connected in a parent and child relationship.** The sound system is the parent, and every speaker is a child. When the player picks an entry, it tells every child to switch to it. The speakers cannot do this on their own.

**The computer is the interface.** A computer connected to the sound system shows its entries on screen as buttons the player can press.

```
computer  ->  sound system  ->  speaker
                            ->  speaker
                            ->  speaker
```

The sound system starts itself when the area loads. You do not need a quest, a trigger, or anything else to switch it on.

**The entry list has to come from your own copy of the entity.** World Builder places a device and edits its simple settings, but it cannot create the `musicSettings` handle an entry needs, so a device placed straight from the base game file has nothing to play. Steps 1 to 3 make that copy and put it on World Builder's menu.

***

{% stepper %}
{% step %}
### 1. Copy the sound system into your project

{% hint style="info" %}
**World Builder cannot build the entry list.** Add an entry to `soundSystemSettings` there and you cannot create the `musicSettings` handle underneath it, so the entry has nothing to play. The list has to already exist in the entity file.
{% endhint %}

The first three steps make your own copy of the sound system, fill in its entries in WolvenKit, and put it on World Builder's menu. Every copy you place then arrives with those entries as its defaults.

In WolvenKit, open the **Asset Browser** and search for:

```
sound_system.ent
```

Find `base\gameplay\devices\home_appliances\radio_sets\sound_system.ent` in the results, right click it, and choose **Add to project**.

<figure><img src="../../../.gitbook/assets/sound system - 01 - asset browser search.png" alt="SCREENSHOT: WolvenKit Asset Browser with &#x22;sound_system.ent&#x22; typed in the search box, the result highlighted, right-click menu open showing &#x22;Add to project&#x22;"><figcaption><p><em>Finding the base game sound system</em></p></figcaption></figure>

Now right click your copy in the **Project Explorer**, choose **Copy**, then right click your mod folder and choose **Paste**. Rename the result:

```
yourmod\entities\sound_system.ent
```

<figure><img src="../../../.gitbook/assets/sound system - 02 - sound system copy.png" alt="SCREENSHOT: Project Explorer showing sound_system.ent under a mod folder"><figcaption><p><em>Your own copy</em></p></figcaption></figure>

Use your own mod's folder name in place of `yourmod`. Everything in your archive should sit under a folder unique to you, or you will overwrite another mod's files.
{% endstep %}

{% step %}
### 2. Add your entries

Open your copy by double clicking it. In the tree on the left, expand:

```
components  ->  controller (SoundSystemController)  ->  persistentState
```

Set:

```
deviceState        ON
defaultAction      0
```

{% hint style="info" %}
`defaultAction` is which entry plays when the area first loads. It counts from 0.
{% endhint %}

Now find **soundSystemSettings** and click **+** once for each entry you want to offer. Every entry has the same three fields:

```
interactionName        Interactions.YourRecordName
canBeUsedAsQuickHack   false
musicSettings          -> pick PlayRadio or PlaySoundEvent
```

`musicSettings` starts empty and it is a handle, so click **Add Handle ( + )** on it and pick the kind you want. That is the part World Builder cannot do.

For a radio station:

```
musicSettings          PlayRadio
    radioStation         ATTITUDE_ROCK
    statusEffect         NONE
```

For a sound event:

```
musicSettings          PlaySoundEvent
    soundEvent           dev_pachinko_music_loop
    statusEffect         NONE
```

`dev_pachinko_music_loop` is a known-good entry to start from. **Not every event in the game works here** - see [Which sound events work](sound-systems-and-speakers.md#which-sound-events-work).

<figure><img src="../../../.gitbook/assets/sound system - 03 - sound system settings.png" alt="SCREENSHOT: soundSystemSettings expanded with three entries, one open showing interactionName and the PlayRadio musicSettings"><figcaption><p><em>One entry per thing the player can pick</em></p></figcaption></figure>

{% hint style="info" %}
You can mix both kinds in one list. The speaker keeps track of which sort is playing and stops it the right way before starting the next, so switching between a station and an event works in either direction.
{% endhint %}

{% hint style="info" %}
`statusEffect` applies something to anyone nearby while that entry plays. `NONE` for most things; the base game uses `DEAFENED` on a loud one.
{% endhint %}

{% hint style="danger" %}
**An empty `soundSystemSettings` makes the whole device do nothing.** It has nothing to offer, and it will not even start itself.
{% endhint %}

{% hint style="warning" %}
**Do not leave `musicSettings` empty on an entry.** If you do, pressing that button stops the sound, changes nothing, starts it again, and then quietly fails. It looks like a dead button rather than a broken one, which is much harder to work out.
{% endhint %}

For an "off" button, do not leave it empty either. Give it a **PlaySoundEvent** naming an event that produces no sound. The music stops, the silent event plays over the top, and picking something else afterwards recovers properly.

**The off entry needs no record of its own.** Point its `interactionName` at the base game's:

```
interactionName        Interactions.Off
```

The screen labels it _Turn OFF_, in every language the game ships, with nothing for you to create.

Every other entry names a record that does not exist yet - [step 10](sound-systems-and-speakers.md#id-10.-name-the-entries-properly) creates them. Type the name you intend to use.

{% hint style="danger" %}
**Keep the list short.** See [Notes and limits](sound-systems-and-speakers.md#notes-and-limits).
{% endhint %}
{% endstep %}

{% step %}
### 3. Make it spawnable in World Builder

World Builder lists paths it already knows about, and it does not know about your copy. There are two ways round that, and either is fine.

{% hint style="warning" %}
**Install your mod before trying either.** World Builder is only handing the game a path, and the game still has to be able to load a file at it.
{% endhint %}

{% hint style="info" %}
**Only your own file needs this.** `speaker.ent`, `speaker_virtual.ent` and `computer_1.ent` are all on World Builder's list already.
{% endhint %}

#### Option A: paste the path in

In World Builder's **Spawn New** tab, pick the **Device** category and type or paste the full path into the search box:

```
yourmod\entities\sound_system.ent
```

Nothing will match. Underneath the empty list you get **No match found...** and **Spawn "your path" anyways?** with a **Spawn** button. Click it and the device spawns.

Nothing checks the path first, so a typo spawns nothing and says nothing. If you get an empty group entry, check the spelling.

#### Option B: add it to the list

If you are going to place a lot of these, or you want it to show up like any other device, give World Builder a list to read.

Create a plain text file in your mod at this path:

```
bin\x64\plugins\cyber_engine_tweaks\mods\entSpawner\data\spawnables\entity\device\yourmod.txt
```

Put one line in it:

```
SoundSystemControllerPS yourmod\entities\sound_system.ent
```

World Builder reads every `.txt` file in that folder, so the file name does not matter as long as it is unique to you.
{% endstep %}

{% step %}
### 4. Place the sound system

Launch the game and open World Builder. Create a new group for your setup.

Spawn your new sound system **Device** that you created above

{% hint style="warning" %}
**Spawn it as an `Entity` object, `Device` variant.** World Builder offers the same `.ent` file under other variants and they will not work here. Only **Device** spawns it as a `worldDeviceNode`, which is the kind device connections join. **Entity Template** spawns a `worldEntityNode` instead, and nothing will wire to it. The same goes for the speakers and the computer.
{% endhint %}

**You will not see anything appear.** This entity has no model. Put it somewhere you will remember, near your speakers or the computer.

In the **World Node** section for this device, click the **generate** button beside the **Node Ref** field.

In the **Device** section, tick **Persistent**.

<figure><img src="../../../.gitbook/assets/sound system - 04 - sound system node ref.png" alt="SCREENSHOT: World Node section showing a generated Node Ref and Persistent ticked"><figcaption><p><em>Every device needs a Node Ref</em></p></figcaption></figure>

{% hint style="danger" %}
**A device with no Node Ref will not work.** Devices without one all share the same internal id and overwrite each other.
{% endhint %}
{% endstep %}

{% step %}
### 5. Place the speakers

Spawn the speakers. Place as many as you want sound coming from. Below are two speaker entities to choose from:

```
base\gameplay\devices\home_appliances\radio_sets\speaker.ent
base\gameplay\devices\home_appliances\radio_sets\speaker_virtual.ent
```

Give **each one** its own generated **Node Ref**, the same as you did for the sound system.

{% hint style="info" %}
**The speakers do not need Persistent ticked.** Only the device that has state worth remembering does, which here is the sound system.
{% endhint %}

**`speaker_virtual.ent` has no model at all.** Use it when your scene already has something that looks like a speaker, or when the sound should come from somewhere with nothing visible there. It behaves exactly like the visible one otherwise.

{% hint style="info" %}
**`range` in the speaker's settings is not how far the sound carries.** The only thing that reads it is the radius of the deafen effect, if you have set `statusEffect` to `DEAFENED`. Leave it alone otherwise.
{% endhint %}

#### If you want a visible speaker

`speaker.ent` has models. Pick one per speaker from the **Appearance** dropdown:

| Appearance            | What it is                                                               |
| --------------------- | ------------------------------------------------------------------------ |
| `speaker_set_small`   | a single small square box                                                |
| `speaker_set_big`     | a tall rectangular box with two woofers and a tweeter                    |
| `speaker_array_a`     | four horizontal rectangular speakers stacked vertically, in a slight arc |
| `speaker_array_b`     | four horizontal rectangular speakers stacked vertically, flat            |
| `speaker_single`      | one horizontal rectangular speaker                                       |
| `speaker_single_gold` | the same, in a gold finish                                               |
{% endstep %}

{% step %}
### 6. Connect the speakers to the sound system

Select the **sound system** device and find the **Device Connections** section. Click **+** once for each speaker.

For each entry, fill in both fields:

```
Device Class Name     SpeakerControllerPS
Node Ref              (pick the speaker's Node Ref from the dropdown)
```

<figure><img src="../../../.gitbook/assets/sound system - 05 - sound system device connections.png" alt="SCREENSHOT: Device Connections on the sound system with two entries, each showing SpeakerControllerPS and a speaker Node Ref"><figcaption><p><em>Wiring the speakers as children</em></p></figcaption></figure>

{% hint style="danger" %}
`SpeakerControllerPS` has to be spelled exactly. **The sound system ignores any child that is not a speaker**, so a typo here means that speaker is silently skipped and nothing tells you.
{% endhint %}

{% hint style="info" %}
Rather than typing it, select the speaker and use the copy button beside its **Device Class Name** in the **Device** section, then paste it into the connection.
{% endhint %}
{% endstep %}

{% step %}
### 7. Place the computer

Spawn any computer **Device**, the below is the one we are using for the example, but a laptop will work as well:

```
base\gameplay\devices\masters\computers\computer_1.ent
```

Give it a generated **Node Ref** and tick **Persistent**.
{% endstep %}

{% step %}
### 8. Connect the computer to the sound system

Select the **computer** and open its **Device Connections**. Add one entry:

```
Device Class Name     SoundSystemControllerPS
Node Ref              (the sound system's Node Ref)
```

<figure><img src="../../../.gitbook/assets/sound system - 06 - computer device connections.png" alt="SCREENSHOT: Device Connections on the computer with one SoundSystemControllerPS entry"><figcaption><p><em>The computer is the parent this time</em></p></figcaption></figure>

{% hint style="info" %}
Note the direction. The computer is the parent of the sound system, and the sound system is the parent of the speakers.
{% endhint %}
{% endstep %}

{% step %}
### 9. Set up the computer screen

Still on the computer, open **Instance Data** and find:

```
controller (ComputerController)  ->  persistentState  ->  computerSetup
```

Set these:

```
startingMenu           SYSTEM
systemMenu             true
hideTopNavigationBar   true
mailsMenu              false
filesMenu              false
internetMenu           false
newsFeedMenu           false
```

<figure><img src="../../../.gitbook/assets/sound system - 07 - computer setup.png" alt="SCREENSHOT: computerSetup expanded showing the menu switches set"><figcaption><p><em>A computer reduced to a device list</em></p></figcaption></figure>

`SYSTEM` is the menu that lists connected devices, which is where your entries will appear.

{% hint style="info" %}
**Only the system menu is required**, you can configure the computer with any menus you like. This example just sets up the computer to only control the sound system.
{% endhint %}

{% hint style="warning" %}
**The SYSTEM menu only appears when the computer actually has a child device.** If your screen is empty, check [step 8](sound-systems-and-speakers.md#id-8.-connect-the-computer-to-the-sound-system) first.
{% endhint %}
{% endstep %}

{% step %}
### 10. Name the entries properly

Your buttons need labels. These come from a TweakDB interaction record, named in `interactionName` back in step 2.

{% hint style="info" %}
**These records need TweakXL to load**, so your mod now requires it and so does anyone who installs your mod.
{% endhint %}

Create a record for each entry in a `.tweak` file:

```
Interactions.YourMod_StationRock:
  $type: gamedataInteractionBase_Record
  action: Choice1
  name: YourMod_StationRock
  captionIcon: ChoiceCaptionParts.None
  caption: LocKey#<the game's own station name key>
```

**`Interactions.*` is shared with every installed mod.** Put something unique to you in place of `YourMod`, in the record path and in `name` both.

{% hint style="info" %}
The base game already has a name and frequency for all fourteen stations, translated into every language it ships in. Point your `caption` at one of these and the button reads exactly like the game's own radio, in whatever language the player is using, without you writing a single string.
{% endhint %}

Prefix the key with `LocKey#`, so `ATTITUDE_ROCK` becomes `caption: LocKey#Gameplay-Devices-Radio-RadioStationAttRock`.

<table data-header-hidden data-search="false"><thead><tr><th>radioStation</th><th>Station in game</th><th>LocKey for caption</th></tr></thead><tbody><tr><td><code>ATTITUDE_ROCK</code></td><td>107.3 Morro Rock Radio</td><td><code>Gameplay-Devices-Radio-RadioStationAttRock</code></td></tr><tr><td><code>AGGRO_INDUSTRIAL</code></td><td>89.3 Radio Vexelstrom</td><td><code>Gameplay-Devices-Radio-RadioStationAggroIndie</code></td></tr><tr><td><code>ELECTRO_INDUSTRIAL</code></td><td>92.9 Night FM</td><td><code>Gameplay-Devices-Radio-RadioStationElectroIndie</code></td></tr><tr><td><code>HIP_HOP</code></td><td>101.9 The Dirge</td><td><code>Gameplay-Devices-Radio-RadioStationHipHop</code></td></tr><tr><td><code>POP</code></td><td>98.7 Body Heat Radio</td><td><code>Gameplay-Devices-Radio-RadioStationPop</code></td></tr><tr><td><code>MINIMAL_TECHNO</code></td><td>95.2 Samizdat Radio</td><td><code>Gameplay-Devices-Radio-RadioStationMinimalTechno</code></td></tr><tr><td><code>AGGRO_TECHNO</code></td><td>103.5 Radio PEBKAC</td><td><code>Gameplay-Devices-Radio-RadioStationAggroTechno</code></td></tr><tr><td><code>JAZZ</code></td><td>91.9 Royal Blue Radio</td><td><code>Gameplay-Devices-Radio-RadioStationJazz</code></td></tr><tr><td><code>DOWNTEMPO</code></td><td>88.9 Pacific Dreams</td><td><code>Gameplay-Devices-Radio-RadioStationDownTempo</code></td></tr><tr><td><code>LATINO</code></td><td>106.9 30 Principales</td><td><code>Gameplay-Devices-Radio-RadioStationLatino</code></td></tr><tr><td><code>METAL</code></td><td>96.1 Ritual FM</td><td><code>Gameplay-Devices-Radio-RadioStationMetal</code></td></tr><tr><td><code>GROWL</code></td><td>89.7 Growl FM</td><td><code>Gameplay-Devices-Radio-RadioStationGrowlFm</code></td></tr><tr><td><code>DARK_STAR</code></td><td>107.5 Dark Star</td><td><code>Gameplay-Devices-Radio-RadioStationDarkStar</code></td></tr><tr><td><code>IMPULSE_FM</code></td><td>99.9 Impulse</td><td><code>Gameplay-Devices-Radio-RadioStationImpulseFM</code></td></tr></tbody></table>

The first column is the same value you set as `radioStation` back in [step 2](sound-systems-and-speakers.md#id-2.-add-your-entries).

<figure><img src="../../../.gitbook/assets/sound system - 08 - computer UI.png" alt="SCREENSHOT: the computer screen in game showing station names and frequencies as buttons"><figcaption><p><em>The finished screen</em></p></figcaption></figure>

{% hint style="info" %}
Every base game `Interactions.` record leaves `caption` empty, so this looks like a dead end when you go looking. It works fine, the base game just never uses it.
{% endhint %}

{% hint style="info" %}
Station icons, if you want them for a custom interface, are in `gui\common\icons\radiostations_icons.inkatlas`. There are fifteen, one per station plus a "no station" icon.
{% endhint %}

**If nothing the game ships says what you need**, add your own key. Put an entry in an onscreens `.json` in your archive, register it in your `.xl` under `localization`, and point `caption` at `LocKey#Your-Key`. That one is yours to translate, unlike the game's.

#### A file to start from

`SoundSystem.yaml` is attached to this guide. It holds a record for all fourteen stations, captioned from the keys in the table above, plus one for a sound event entry. Rename `YourMod` throughout, delete the stations you are not offering, and drop it in your mod's `r6\tweaks\` folder.

{% file src="../../../.gitbook/assets/SoundSystem.yaml" %}
{% endstep %}

{% step %}
### 11. Export and test

Export your World Builder group, bring the sector into your WolvenKit project, pack your archive, and install the mod.

Load your save.

Walk up to the computer. You should see your entries listed on the screen, and pressing one should start it playing from every speaker at once.
{% endstep %}
{% endstepper %}

### Common mistakes

| Mistake                           | What happens                                    | Fix                                                                                                                                                                                                                      |
| --------------------------------- | ----------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| A device ignores your changes     | Old settings, or the device does nothing at all | Devices store their settings inside the save. Click the **reload** button next to the **Persistent** checkbox in that device's panel, and if that does not clear it, try an older save that has not been to the location |
| No Node Ref on a device           | Only one device works                           | Every device needs its own. Persistent is separate, and only the sound system and the computer need it                                                                                                                   |
| `SpeakerControllerPS` misspelled  | That speaker is silent, no error                | The sound system skips any child that is not a speaker                                                                                                                                                                   |
| Empty `soundSystemSettings`       | The device does nothing at all                  | It needs at least one entry to even start itself                                                                                                                                                                         |
| Empty `musicSettings` on an entry | Button looks dead                               | Give it a real `PlayRadio`, or a silent `PlaySoundEvent` for an off switch                                                                                                                                               |
| Computer screen is blank          | No SYSTEM menu                                  | The menu only shows when the computer has a connected child. Check the connection                                                                                                                                        |

### Notes and limits

**Mod-added radio stations will not work.** The station setting only understands the base game's fourteen. Sound events are a separate route with its own limits, below.

**Keep the list short.** Fourteen entries render as fourteen buttons crammed into a single row on the computer screen, overlapping each other by about half a line, with click areas that no longer line up with what you can see. Three or four is comfortable.

**The speakers can play without a sound system at all.** A lone speaker has its own `defaultMusic` setting and will play it as soon as it is loaded. If you only want background music, on a single speaker, and never need the player to change it, you can skip the sound system and the computer entirely.

**The sound system starts itself.** As soon as the area loads it picks the entry at `defaultAction` and pushes it to every speaker. No quest, no trigger, and no interaction is needed to get music playing.

### Which sound events work

**Some do and some do not, and the reason is not yet understood.** An event that looks perfect can be silent, with nothing logged and no error anywhere, so treat this as an area still being explored rather than a settled rule.

What has been tested so far, by putting each on a sound system entry and by posting it on the player from the CET console:

| Event                              | Result                   |
| ---------------------------------- | ------------------------ |
| `dev_pachinko_music_loop`          | plays, from the speakers |
| `ui_loot_ammo`                     | plays                    |
| `radio_club_default_small_emitter` | silent                   |
| `radio_sq025_sythwave_emitter`     | silent                   |
| `police_radio_noise_01`            | silent                   |

The three that fail all live in the game's `radio.bnk` soundbank; the two that work live in `sfx_container.bnk`. That is the only pattern found so far, and five events is not many, so it is a lead rather than a rule. Nothing about the events themselves predicts it: the failing ones are built exactly like the working ones.

**Test an event before you build around it.** Open the CET console and post it on yourself:

```
GameObject.PlaySoundEvent(Game.GetPlayer(), "dev_pachinko_music_loop")
```

If you hear it there, it should work on a speaker. If you hear nothing, pick another event rather than hunting for a setting that will fix it. `GameObject.StopSoundEvent` with the same name stops a loop.

**A quest music event is the wrong tool.** Names beginning `mus_` belong to the interactive music system, which plays on the music bus rather than from a position, so even where one sounds it will not come from your speakers.
