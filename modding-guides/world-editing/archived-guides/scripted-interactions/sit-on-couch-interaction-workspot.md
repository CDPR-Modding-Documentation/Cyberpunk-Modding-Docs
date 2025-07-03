---
description: Add an "Sit" interaction.
---

# Sit on couch interaction (workspot)

**Published:** Feb 24, 2025 by [Akiway](https://app.gitbook.com/u/2021vbDrMKZ0TbHeIx2wzPyAYtl2 "mention")\
**Last update:** Feb 24, 2025 by [Akiway](https://app.gitbook.com/u/2021vbDrMKZ0TbHeIx2wzPyAYtl2 "mention")\
**Credits:** @**keanuWheeze** for creating 90% of the scripts shared in this pages.

This page is a subsection of the [.](./ "mention") guide. It will teach you how to add an interaction to sit.

The logic shown here also applies to other similar workspot interactions.

## Requirements

<table><thead><tr><th width="430">Tool/Software</th><th>Version</th></tr></thead><tbody><tr><td>Wolvenkit (<a href="https://github.com/WolvenKit/Wolvenkit/issues">stable</a> | <a href="https://github.com/WolvenKit/WolvenKit-nightly-releases/releases">nightly</a>)</td><td>≥ 8.16.1 for Cyberpunk 2.21</td></tr><tr><td>Object Spawner (<a data-mention href="broken-reference">Broken link</a>)</td><td>Most recent from Feb 09, 2025</td></tr><tr><td>Visual Studio Code or any IDE to edit lua files</td><td></td></tr></tbody></table>

**Knowledges required :**&#x20;

* You know how to [**create a mod**](https://wiki.redmodding.org/wolvenkit/getting-started/creating-a-mod) using Wolvenkit.
* You know how to[ **spawn objects**](broken-reference) using entSpawner
* You [downloaded the template](./#download-the-template) that contains all the necessary files

## Define the position

1. Find the place where you want to add the interaction, this can be anything, an existing couch, a new mesh you add, a case, a parapet, or even in the middle of nowhere.
2. Using entSpawner, add and position 2 **Meta** > **Static Marker**:
   1. Position the 1st marker where the Sit icon will be displayed ;
   2. Copy the X Y Z position of the marker ;
   3. Position a 2nd marker where the animation will be played, it is usually placed lower than the icon, almost at the ground level ;
   4. Copy the X Y Z position of the 2nd marker.
   5. _(Optional)_ You can save the markers in a group to more easily change the position later if you're not happy with where the icon appears or where the animation is played. But we won't need to export it.

<figure><img src="../../../../.gitbook/assets/Sit-interaction-static-marker.png" alt=""><figcaption><p>Sit interaction - static markers</p></figcaption></figure>

## Add the interaction

In the `interactions.lua` file, add your new device interaction inside the `interactions.setupInteractions()` function :&#x20;

{% code overflow="wrap" %}
```lua
local couch = require("modules/workspots/couchWorkspot"):new(1, Vector4.new(1803.76, 2260.53, 180.74, 0.0), Vector4.new(1803.76, 2260.53, 180.34, 0.0), EulerAngles.new(0, 0, 160))
couch:init()
table.insert(interactions.workspots, couch)
```
{% endcode %}

The require contains the path to the workspot.\
Its instantiation takes 4 parameters:

1. An ID which must be unique accross all interactions
2. The icon and interaction coordinates
3. The animation coordinates
4. The animation rotation

Paste the X Y Z of the first marker into the first `Vector4`, the fourth parameter must be ignored and set to `0.0`.\
Do the same with the 2nd marker coordinates.\
For the animation rotation, the axe you want to change is the 3rd parameter of the `EulerAngles`. You will have to find the correct angle, this might require multiple tries to get it right.

The last line append the interaction to the workspots list of the file, this will ensure animations work properly.

## Test the result

If you're working with hot reload, you can change the `interactions.lua` file from within your game folder and then directly press **Reload all mods** in the CET menu to see the result, without having to restart your game. Otherwise, redeploy your mod.

{% file src="../../../../.gitbook/assets/Sit interaction - result video.mp4" %}
Sit interaction - result (with french game :flag\_fr:)
{% endfile %}

### Fine tune the interaction

Not happy with the interaction range? or the icon visibility range? or the text label?\
Each interaction workspot comes with some parameters that you can change to your will.

Default couch parameters :&#x20;

```lua
o.interactionPosition = interactionPosition
o.workspotPosition = workspotPosition
o.workspotRotation = workspotRotation

o.devicePath = "base\\gameplay\\devices\\arcade_machines\\couch_rh.ent"
o.name = GetLocalizedText("LocKey#39254")

o.entryText = "[" .. GetLocalizedText("LocKey#39287") .. "]"
o.entryIcon = "ChoiceCaptionParts.SitIcon"
o.exitText = "[" .. GetLocalizedText("LocKey#37918") .. "]"
o.exitIcon = "ChoiceCaptionParts.GetUpIcon"

o.iconRange = 4

o.slideTime = 1.2
o.slideCameraRot = EulerAngles.new(1.5, -37, -0.14)
o.slideCameraPos = Vector4.new(0, -0.17, 0, 0)
o.workspotCameraRot = EulerAngles.new(2.5, 0, 0)

o.entryTime = 6.75
o.exitTime = 3.3

o.maxPitch = 55
o.minPitch = -33
o.maxYaw = 55
o.minYaw = -40

o.enterSounds = {
    {name = "sq021_sc_05_v_sits", delay = 0.1},
    {name = "q005_sc_02_v_sits", delay = 1.85}
}

o.exitSounds = {
    {name = "sq030_sc_10_bathroom_v_stands_up", delay = 0.2},
    {name = "sq032_sc_07_v_stands_up_02", delay = 0.2},
    {name = "sq030_sc_09_pier_v_stands_up", delay = 0.2},
    {name = "sq028_sc_04_v_stands", delay = 0.2},
}
```

To change these, you can set their value before initializing the interaction, like so :&#x20;

```lua
local couch = require("modules/workspots/couchWorkspot"):new(5, Vector4.new(1803.76, 2260.53, 180.74, 0.0), Vector4.new(1803.76, 2260.53, 180.34, 0.0), EulerAngles.new(0, 0, 160))
couch.iconRange = 1.5
couch.name = localized.object.seat
couch:init()
table.insert(interactions.workspots, couch)
```

{% hint style="info" %}
`enterSounds` and `exitSounds` both contain a list of sound effect names, only one will be played each time, the sound is selected ramdomly in the corresponding list.
{% endhint %}

#### Looking for something?

**For localizations** :flag\_gb::flag\_fr::flag\_ru: -> Open the [LocKey browser](https://wiki.redmodding.org/wolvenkit/wolvenkit-app/editor/lockey-browser) inside Wolvenkit.

{% hint style="info" %}
You want to **regroup your localizations**? Use the `utils/localizedText.lua` to give your localizations more meaningful names.
{% endhint %}

{% hint style="info" %}
You want to **add you own translations**? Use the `utils/lang.lua` file and take the time to translate your action in the other languages, all players will appriciate it! :wink:
{% endhint %}

**For icons** :interrobang: -> Open the [Asset browser](https://wiki.redmodding.org/wolvenkit/wolvenkit-app/editor/asset-browser) inside Wolvenkit and search for the `mappin_icons.inkatlas`. The Part Mapping tab will help you choose the appropriate icon, then simply adapt the icon name as such : hide\_weapon -> HideWeaponIcon. (You have a doubt on the name ? Search for it in the [Tweak browser](https://wiki.redmodding.org/wolvenkit/wolvenkit-app/editor/tweak-browser))

**For sounds** :trumpet: -> You can search for it in the [SoundDB](https://sounddb.redmodding.org/), or by using entSpawner **Deco** > **Static Audio Emitter**.
