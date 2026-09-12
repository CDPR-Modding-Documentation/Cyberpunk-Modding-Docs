---
description: >-
  How to place a sound system driving any number of speakers, with a computer  
  the player uses to change what plays, without any scripting.
icon: speaker
---

# Sound Systems and Speakers

### Summary

**Published: August 24 2026 by** [@Spuddeh](https://discord.com/users/124447344279158784)

**Last documented update: Sept 06 2026 by** [Akiway](https://github.com/Akiway)

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

## Before you start: what a sound system can play

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

## Creating the sound system

{% hint style="info" icon="code-branch" %}
[Akiway's fork of World Builder](https://github.com/Akiway/CP77_entSpawner/releases/latest) is a more advanced version that put the focus on **Quality of Life**.

The version **a.1.5.0** brings a new **Quick Sound System Setup** feature to help you create one in minutes, without the headache of searching in properties.
{% endhint %}

{% tabs %}
{% tab title="Quick Setup (Akiway's WB ≥ a.1.5.0)" icon="bolt" %}
### Quick Sound System Setup in video

{% embed url="https://youtu.be/bEmKu0AziEM" %}

#### What the quick setup does for you

* The quick setup writes each entry **whole**
* It spawns the appropriate devices
* Master devices are automatically configured
* It handles the links between masters ↔ sound system ↔ speakers

{% stepper %}
{% step %}
### 1. Spawning the sound system

1. In the [<mark style="color:purple;">Asset Browser</mark>](#user-content-fn-1)[^1] <i class="fa-square-plus" style="color:purple;">:square-plus:</i>, search for an object of type <mark style="background-color:blue;">**Entity**</mark> and variant <mark style="background-color:blue;">**Device**</mark>.
2. Filter the results by [<mark style="color:purple;">Device Class Name</mark>](#user-content-fn-2)[^2] and select <mark style="background-color:blue;">**SoundSystemControllerPS**</mark>.
3. Spawn `base\gameplay\devices\home_appliances\radio_sets\sound_system.ent` and place it somewhere you will remember.

{% hint style="warning" icon="eye-slash" %}
**You will not see anything appear.** The sound system has no model at all, it is the brain, not the sound. Put it near the speakers or the computer so it is easy to find again in the object list.
{% endhint %}
{% endstep %}

{% step %}
### 2. Opening the panel

In the sound system's properties, click the <mark style="color:purple;">Quick Sound System Setup</mark> button.

Two things are handled the moment it opens:

* A unique [<mark style="color:purple;">node ref</mark>](#user-content-fn-3)[^3] is generated for the sound system if it does not have one (masters connect to it by NodeRef and the `.psrep` entry is keyed on it).
* The sound system **Persistent** property is set to `true`.

{% hint style="warning" icon="hashtag" %}
**A node reference is an unique identifier**, but **it is not a path**. <mark style="color:purple;">Auto-generation</mark> <i class="fa-rotate-exclamation" style="color:purple;">:rotate-exclamation:</i> uses the current group structure to create it. To avoid modding conflicts, you might want to set a custom value instead.

<img src="../../../.gitbook/assets/image (267).png" alt="" data-size="original">
{% endhint %}

Two settings sit above the graph:

| Setting            | What it does                                                                         |
| ------------------ | ------------------------------------------------------------------------------------ |
| **Device State**   | `ON` or `OFF`. `OFF` leaves the system silent until something switches it on         |
| **Starting Entry** | Which entry plays when the area loads. Stored as `defaultAction`, a zero-based index |

#### The chain graph

The graph is the whole setup in one picture, three rows deep :

```
   masters   →  laptop / computer / switch / access point
       ↕
   system    →  this sound system, and its entry count
       ↕
   speakers  →  every speaker that follows it
```

<figure><img src="../../../.gitbook/assets/WB sound system empty graph.png" alt=""><figcaption><p>Empty graph at creation</p></figcaption></figure>

{% hint style="info" icon="computer-mouse" %}
Click any box to select it.

Right-click anywhere to access a context menu, to add / remove a device.
{% endhint %}

{% hint style="danger" icon="volume-xmark" %}
**No speaker connected, nothing will be audible.** The graph says this in place of the speaker row when the row is empty. The sound system is only a controller, it never makes sound itself.
{% endhint %}


{% endstep %}

{% step %}
### 3. Adding entries

Each entry is one button the player can press. Add one from the system box, then fill in three rows:

**Caption** is a TweakDB `Interactions.*` record, picked from a search dropdown. The vanilla records CDPR uses on its own sound systems come first, and each option's tooltip is that record's **live localized caption,** the button text itself, not a description of it. Under the field, the panel shows what the current pick resolves to :

* the caption, if the record has one
* _Record has no caption_ → the record exists but its caption flat is empty, so the button renders blank
* Record not in TweakDB → nothing by that name exists. Ship a `.tweak` defining it, or pick another

You can also create your own interaction button, for this check out : [#create-your-own-interaction-button](sound-systems-and-speakers.md#create-your-own-interaction-button "mention").

{% hint style="success" icon="circle-check" %}
If every entry uses a vanilla caption record, **your mod doesn't need TweakXL**. The picker shows each record's real localized caption, so you can see the button text before you pick it.
{% endhint %}

**Source** picks between the two things an entry can be:

| Source            | Then set                                                                |
| ----------------- | ----------------------------------------------------------------------- |
| **Radio station** | One of the game's fourteen stations, listed by their real in-game names |
| **Sound event**   | A WWise event name, chosen through the audio selector                   |

{% hint style="danger" %}
**A mod-added radio station cannot be selected.** `radioStation` is an engine enum, not a record reference, so it only understands the fourteen the base game ships. For custom stations see [Syncing Multiple Radios](syncing-multiple-radios.md).
{% endhint %}

{% hint style="warning" icon="music" %}
**An event whose name begins `mus_` plays on the music bus.** It is not positional: it comes out at full volume everywhere and ignores your speakers entirely. The panel warns when you pick one.
{% endhint %}

**Status Effect** applies something to anyone nearby while that entry plays : `NONE`, `DEAFENED` or `SUPRESS_NOISE`. **Quickhack** exposes the entry as a quickhack instead of a normal interaction, which is what vanilla pairs with `Interactions.HackVolume`.

{% hint style="warning" %}
Status effect and quickhack aren't always working as expected. More testing is required.
{% endhint %}

Entries are reordered with the arrow buttons, and the order in the list is the button order in game.

{% hint style="info" icon="list" %}
**Keep the list to about six.** Past that the buttons overlap each other on the computer screen and their click areas stop lining up with what you can see.
{% endhint %}

{% hint style="info" icon="power-off" %}
For an "off" button, do not leave the entry empty, give it a **Sound event** that makes no sound, and point its caption at the vanilla `Interactions.Off` record, which the game already translates as _Turn OFF_.
{% endhint %}
{% endstep %}

{% step %}
### 4. Adding speakers

The **+** on the speakers row offers two entities:

| Option                        | Notes                                                                                                    |
| ----------------------------- | -------------------------------------------------------------------------------------------------------- |
| **Speaker**                   | `speaker.ent`, with six mesh appearances to choose from                                                  |
| **Virtual Speaker (no mesh)** | `speaker_virtual.ent`, invisible. Use it when your scene already has something that looks like a speaker |

Picking one spawns the speaker into your project, generates its NodeRef, and writes the `SpeakerControllerPS` connection on the sound system for you. Then move it where you want the sound coming from.

| Row                     | What it does                                                                   |
| ----------------------- | ------------------------------------------------------------------------------ |
| **Appearance**          | Mesh variant, on the visible speaker only                                      |
| **Range**               | Audible radius, 10 m as shipped. Also the radius a status-effect entry reaches |
| **Default Station**     | What this speaker plays on its own, before any system pushes anything to it    |
| **Glitch SFX**          | Played during the Malfunction quickhack                                        |
| **Use Only Glitch SFX** | Skip the distraction station during Malfunction and play only the glitch       |
| **Distraction Station** | The station Malfunction switches to                                            |

{% hint style="danger" icon="triangle-exclamation" %}
**Only `SpeakerControllerPS` devices follow a sound system.** `RefreshSlaves` casts every immediate child to that class and silently skips anything else, so a radio or a jukebox wired here is ignored. The panel names the reason on any connection that will not work.
{% endhint %}

<figure><img src="../../../.gitbook/assets/WB sound system graph with speakers.png" alt=""><figcaption><p>Graph with speakers</p></figcaption></figure>
{% endstep %}

{% step %}
### 5. Adding a master

A master is what the player uses. The **+** on the masters row offers four:

| Option                             | What it is                                                   |
| ---------------------------------- | ------------------------------------------------------------ |
| **Laptop**                         | CDPR's own choice on three of the four shipped sound systems |
| **Computer**                       | Desk computer, same controller as the laptop                 |
| **Virtual Switch (no mesh)**       | Plain on/off with no UI, used on the q115 ambient systems    |
| **Virtual Access Point (no mesh)** | Puts the system on a network so it can be quickhacked        |

Adding one spawns it, generates its NodeRef, marks it persistent, and writes its connection **to** the sound system; note the direction: the master owns the connection, not the system.

For a laptop or a computer, the terminal preset is applied at the same time, so the machine opens straight onto the device page instead of the desktop. The **Terminal Preset** row's <mark style="color:purple;">Apply</mark> button re-applies it if you change the menus by hand and want to go back.

{% hint style="warning" icon="desktop" %}
**The SYSTEM menu only appears when the computer actually has a child device.** If your screen is empty in game, the connection is what to check first.
{% endhint %}

<figure><img src="../../../.gitbook/assets/WB sound system complete graph.png" alt=""><figcaption><p>Complete graph</p></figcaption></figure>
{% endstep %}

{% step %}
### 6. Export and test

Export your World Builder group, bring the sector into your WolvenKit project, pack, install, and load a save that has never been to the location.

Walk up to the computer: your entries should be listed on screen, and pressing one should start it playing from every speaker at once.

{% hint style="warning" icon="floppy-disk" %}
A sound system stores its entries in the save. If a device ignores your changes, use the **reload** button beside its **Persistent** checkbox, or test on an older save.
{% endhint %}
{% endstep %}
{% endstepper %}
{% endtab %}

{% tab title="Manual (official WB)" icon="hand" %}
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

Using the [Tweak Browser](../../../for-mod-creators-theory/tweaks/tweaks/browsing-the-tweak-database.md), you can find existing interactions starting with `Interactions.`

<figure><img src="../../../.gitbook/assets/sound system - 08 - computer UI.png" alt="SCREENSHOT: the computer screen in game showing station names and frequencies as buttons"><figcaption><p><em>The finished screen, using custom interactions</em></p></figcaption></figure>

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
{% endtab %}
{% endtabs %}

### Create your own interaction button

To have your own interaction button, create a record for each button in a tweak `.xl` file :

```
Interactions.YourMod_StationRock:
  $type: gamedataInteractionBase_Record
  action: Choice1
  name: YourMod_StationRock
  captionIcon: ChoiceCaptionParts.None
  caption: LocKey#<the game's own station name key>
```

{% hint style="info" %}
**These records need** [**TweakXL**](../../../for-mod-creators-theory/core-mods-explained/tweakxl/) **to load**, so your mod now requires it and so does anyone who installs your mod.
{% endhint %}

**`Interactions.*` is shared with every installed mod.** Put something unique to you in place of `YourMod`, in the record path and in `name` both.

#### Using radio station names

{% hint style="info" %}
The base game already has a name and frequency for all fourteen stations, translated into every language it ships in. Point your `caption` at one of these and the button reads exactly like the game's own radio, in whatever language the player is using, without you writing a single string.
{% endhint %}

Prefix the key with `LocKey#`, so `ATTITUDE_ROCK` becomes `caption: LocKey#Gameplay-Devices-Radio-RadioStationAttRock`.

<table data-header-hidden data-search="false"><thead><tr><th>radioStation</th><th>Station in game</th><th>LocKey for caption</th></tr></thead><tbody><tr><td><code>ATTITUDE_ROCK</code></td><td>107.3 Morro Rock Radio</td><td><code>Gameplay-Devices-Radio-RadioStationAttRock</code></td></tr><tr><td><code>AGGRO_INDUSTRIAL</code></td><td>89.3 Radio Vexelstrom</td><td><code>Gameplay-Devices-Radio-RadioStationAggroIndie</code></td></tr><tr><td><code>ELECTRO_INDUSTRIAL</code></td><td>92.9 Night FM</td><td><code>Gameplay-Devices-Radio-RadioStationElectroIndie</code></td></tr><tr><td><code>HIP_HOP</code></td><td>101.9 The Dirge</td><td><code>Gameplay-Devices-Radio-RadioStationHipHop</code></td></tr><tr><td><code>POP</code></td><td>98.7 Body Heat Radio</td><td><code>Gameplay-Devices-Radio-RadioStationPop</code></td></tr><tr><td><code>MINIMAL_TECHNO</code></td><td>95.2 Samizdat Radio</td><td><code>Gameplay-Devices-Radio-RadioStationMinimalTechno</code></td></tr><tr><td><code>AGGRO_TECHNO</code></td><td>103.5 Radio PEBKAC</td><td><code>Gameplay-Devices-Radio-RadioStationAggroTechno</code></td></tr><tr><td><code>JAZZ</code></td><td>91.9 Royal Blue Radio</td><td><code>Gameplay-Devices-Radio-RadioStationJazz</code></td></tr><tr><td><code>DOWNTEMPO</code></td><td>88.9 Pacific Dreams</td><td><code>Gameplay-Devices-Radio-RadioStationDownTempo</code></td></tr><tr><td><code>LATINO</code></td><td>106.9 30 Principales</td><td><code>Gameplay-Devices-Radio-RadioStationLatino</code></td></tr><tr><td><code>METAL</code></td><td>96.1 Ritual FM</td><td><code>Gameplay-Devices-Radio-RadioStationMetal</code></td></tr><tr><td><code>GROWL</code></td><td>89.7 Growl FM</td><td><code>Gameplay-Devices-Radio-RadioStationGrowlFm</code></td></tr><tr><td><code>DARK_STAR</code></td><td>107.5 Dark Star</td><td><code>Gameplay-Devices-Radio-RadioStationDarkStar</code></td></tr><tr><td><code>IMPULSE_FM</code></td><td>99.9 Impulse</td><td><code>Gameplay-Devices-Radio-RadioStationImpulseFM</code></td></tr></tbody></table>

The first column is the same value you set as `radioStation` back in [step 2](sound-systems-and-speakers.md#id-2.-add-your-entries).

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

[^1]: The Asset Browser allows to spawn new assets. you can access it from the [Spawn New tab](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/world-editing/object-spawner/ui-tabs-explained/tab-spawn-new).

[^2]: A device class defines the entity's properties as well as its behavior and connections to the game's systems.

[^3]: **A node reference is an unique identifier**, it is not a path.\
    To avoid modding conflicts, make sure to set a ref that follows a pattern of your own.\
    Example : `#/author/modName/group/#myObjectidentifier`
