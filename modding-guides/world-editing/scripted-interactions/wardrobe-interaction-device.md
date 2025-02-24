---
description: Add an "Open wardrobe" interaction.
---

# 👗 Wardrobe interaction (device)

**Published:** Feb 24, 2025 by [Akiway](https://app.gitbook.com/u/2021vbDrMKZ0TbHeIx2wzPyAYtl2 "mention")\
**Last update:** Feb 24, 2025 by [Akiway](https://app.gitbook.com/u/2021vbDrMKZ0TbHeIx2wzPyAYtl2 "mention")

This page is a subsection of the [.](./ "mention") guide. It will teach you how to add an interaction to open the wardrobe menu.

The logic shown here also applies to other device _like_ interactions.

## Requirements

<table><thead><tr><th width="430">Tool/Software</th><th>Version</th></tr></thead><tbody><tr><td>Wolvenkit (<a href="https://github.com/WolvenKit/Wolvenkit/issues">stable</a> | <a href="https://github.com/WolvenKit/WolvenKit-nightly-releases/releases">nightly</a>)</td><td>≥ 8.16.1 for Cyberpunk 2.21</td></tr><tr><td>Object Spawner (<a data-mention href="../world-editor-entspawner.md">world-editor-entspawner.md</a>)</td><td>Most recent from Feb 09, 2025</td></tr><tr><td>Visual Studio Code or any IDE to edit lua files</td><td></td></tr></tbody></table>

**Knowledges required :**&#x20;

* You know how to [**create a mod**](https://wiki.redmodding.org/wolvenkit/getting-started/creating-a-mod) using Wolvenkit.
* You know how to[ **spawn objects**](../world-editor-entspawner.md) using entSpawner
* You [downloaded the template](./#download-the-template) that contains all the necessary files

## Define the position

1. Find the place where you want to add the interaction, this can be anything, an existing wardrobe, a new mesh you add, a secret compartment in the wall, or even in the middle of nowhere.
2. Using entSpawner, add and position a **Meta** > **Static Marker** where the Wardrobe icon will be displayed.
   1. Copy the X Y Z position of the marker
   2. _(Optional)_ You can save the marker in a group to more easily change the position later if you're not happy with where the icon appears. But we won't need to export it.

<div data-full-width="false"><figure><img src="../../../.gitbook/assets/Wardrobe-interaction-static-marker.png" alt=""><figcaption><p>Wardrobe interaction - static marker</p></figcaption></figure></div>

## Add the interaction

In the `interactions.lua` file, add your new device interaction inside the `interactions.setupInteractions()` function :&#x20;

```lua
local wardrobe = require("modules/devices/wardrobeDevice"):new(1, Vector4.new(1779.53, 2257.57, 183.47, 0.0))
wardrobe:init()
```

The require contains the path to the device.\
Its instantiation takes 2 parameters: an ID which must be unique, and the location.\
Paste the X Y Z copied before into the `Vector4`, the fourth parameter must be ignored and set to `0.0`.



## Test the result

If you're working with hot reload, you can change the `interactions.lua` file from within your game folder and then directly press Reload all mods in the CET menu to see the result, without having to restart your game. Otherwise, redeploy you mod.

<figure><img src="../../../.gitbook/assets/Wardrobe-interaction-result.png" alt=""><figcaption><p>Wardrobe interaction - result (with french game <span data-gb-custom-inline data-tag="emoji" data-code="1f1eb-1f1f7">🇫🇷</span>)</p></figcaption></figure>

### Fine tune the interaction

Not happy with the interaction range? or the icon visibility range? or the text label?\
Each interaction device comes with options that you can change to your will.

Default wardrobe parameters :&#x20;

```lua
self.detectionAngle = 80
self.iconRange = 5
self.interactionRange = 1.5
self.iconRecord = "ChoiceIcons.OpenWardrobeIcon"
self.iconColor = HDRColor.new({ Red = 0.15829999744892, Green = 1.3033000230789, Blue = 1.4141999483109, Alpha = 1.0 })
self.name = GetLocalizedText("LocKey#35138")
```

To change these, you can set their value before initializing the interaction, like so :&#x20;

```lua
local wardrobe = require("modules/devices/wardrobeDevice"):new(1, Vector4.new(1779.53, 2257.57, 183.47, 0.0))
wardrobe.iconRange = 1
wardrobe.interactionRange = 0.5
wardrobe:init()
```

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
