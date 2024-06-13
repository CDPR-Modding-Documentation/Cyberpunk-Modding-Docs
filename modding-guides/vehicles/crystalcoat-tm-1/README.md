---
description: >-
  This tutorial provides a brand new way to implement CrystalCoat for any kind
  of vehicle and to make any part of a vehicle customizable by the user during
  runtime. The only limit is your imagination !
cover: ../../../../.gitbook/assets/banner.png
coverY: 0
layout:
  cover:
    visible: true
    size: full
  title:
    visible: true
  description:
    visible: true
  tableOfContents:
    visible: true
  outline:
    visible: true
  pagination:
    visible: true
---

# ⛱️ CrystalCoat™ & Advanced Customization

## Summary

**Created:** Jun ?? 2024 by [@hgyi56](https://next.nexusmods.com/profile/hgyi56/mods)\
**Last documented update:** -

{% hint style="info" %}
**Modification policy**

The author of this tutorial does not allow other users to modify it without his permission. Instead users shall contact the author using the links provided above and post comments on the relevant pages.
{% endhint %}

## What is CrystalCoat

From the in-game perspective, this is a technology developed by Rayfield manufacturer that enables a vehicle to get colored dynamically. You can think of it either as a huge matrix composed of tiny LEDs that would cover most parts of the vehicle allowing its user to select a color at any time.

Or it could also be a holographic technology that would cover the vehicle with some kind of 3D projection of a new color.

Now from the modder's perspective, this feature is made possible by applying InkWidgets onto mesh components.

InkWidgets were initially developed in order to display animated content for TVs, computer monitors or vehicle UI. From game v2.11 they are now also used to display colored shapes wrapped on a mesh dynamically.

## Required mod dependencies

In order for your mod to work you need to install dependencies from Nexusmods:

* [Codeware](https://www.nexusmods.com/cyberpunk2077/mods/7780)
* [ArchiveXL](https://www.nexusmods.com/cyberpunk2077/mods/4198)
* [TweakXL](https://www.nexusmods.com/cyberpunk2077/mods/4197)
* [redscript](https://www.nexusmods.com/cyberpunk2077/mods/1511)
* [RED4ext](https://www.nexusmods.com/cyberpunk2077/mods/2380)
* [Mod Settings](https://www.nexusmods.com/cyberpunk2077/mods/4885)
* Either [Crystal Coat Fix v2.12](https://www.nexusmods.com/cyberpunk2077/mods/13907) **or** [Enhanced Vehicle System](https://www.nexusmods.com/cyberpunk2077/mods/11765)

{% hint style="success" %}
Keep in mind that this is my way of implementing CrystalCoat and there may be other ways to do it.
{% endhint %}

{% hint style="danger" %}
This tutorial assumes that you and your users will install either [Crystal Coat Fix v2.12](https://www.nexusmods.com/cyberpunk2077/mods/13907) **or** [Enhanced Vehicle System](https://www.nexusmods.com/cyberpunk2077/mods/11765).

Either of these mods contain a script part that is currently required for CrystalCoat mods based on this tutorial to work perfectly.

They will still run without one of them but the result will be degraded.
{% endhint %}

## Required tools and skills

Well it depends on what you intend to do. This tutorial is incremental. It means that you start at the beginning and you can eventually stop at some point if what you have created satisfies your goal.

Although I explain things step by step it may not be exhaustive otherwise this tutorial would become very long. Here is a list of skills that will help you to go through this tutorial.

* Usage of [WolvenKit](https://wiki.redmodding.org/wolvenkit). Using its tools, adding game files into your project, modifying array elements, knowing how to pack and install a mod, importing and exporting files from WolvenKit.
* Usage of [MlsetupBuilder](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators/modding-tools/mlsetup-builder) (MLSB). Installing and [preparing the tool](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators/modding-tools/mlsetup-builder#configuration), importing and exporting mlsetup files, modifying a material layer.
* Usage of [Blender](https://www.blender.org/). Installing the [Cyberpunk related extension](https://github.com/WolvenKit/Cyberpunk-Blender-add-on/releases). Importing and exporting a entity or mesh file, creating a submesh.
* Usage of Adobe Photoshop (or another image editor). Have a basic knowledge of layers, channels, know how to use some tools like the magic wand, gradient tool, fill a selection, create a selection, create a layer style, apply a filter.
* Scripting basics. Know how to navigate into a JSON file, YAML file, REDS file, perform a replacement of a string, append a block by copy-pasting it from the tutorial.
* Usage of a good text editor. I recommend using [Visual Studio Code](https://code.visualstudio.com/) and installing the [redscript-ide](https://github.com/jac3km4/redscript-ide-vscode) extension and the [redscript syntax highlight](https://marketplace.visualstudio.com/items?itemName=jackhumbert.redscript-syntax-highlighting) extension.

## What can I do with this tutorial ?

You can test my mod [Crystal Coat for Rayfield Caliburn](https://www.nexusmods.com/cyberpunk2077/mods/14749) to have an idea of what can be done.

<figure><img src="../../../../.gitbook/assets/caliburn_cc_mod.png" alt=""><figcaption><p>Customizable Rayfield Caliburn</p></figcaption></figure>

Things you will be able to do after learning this tutorial:

* Add CrystalCoat to any kind of vehicle.
* Define a secondary color.
* Customize the color picker widget with your brand and vehicle image.
* Create multiple paint aspects and use any of them during runtime.
* Create multiple appearances for all the vehicle parts and use any of them during runtime.
* Clean the rust and dust from your vehicle parts and windows.
* Modify window glass.
* Create any amount of customizable components on your vehicle. They can be sub-parts of existing component.
* Customize the vehicle appearance when CrystalCoat is ON and when it is OFF during runtime.
* Allow anyone to add translations to your mod.
* Display vehicle part images in the mod settings menu.
* Create a default settings package for your mod settings to allow mod community admins to customize the mod's default settings for their users.
