---
icon: sparkles
---

# Boe6's vehicles: What you need to know

## Summary

**Created:** Oct 19 2023 by [Meta Pixel](https://app.gitbook.com/u/9PYjUBpLrFhif4MmMN1WyrRuFFG3 "mention")\
**Last documented edit:** March 29 2025 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page will give you an overview about the skills you should have, and info on how to acquire them if you don't.&#x20;

{% hint style="danger" %}
Due to the high complexity, this is **not** a good first mod. Keep reading to save a lot of time and frustration later on!
{% endhint %}

A new standalone car is about **the most complex Cyberpunk mod** you can make.&#x20;

While this tutorial **has** been completed by newbies, they spent most of their time on the [discord](https://discord.com/invite/redmodding) asking for help and support instead of making a car.

If you are a new modder, **please** listen and complete the **tutorials in the green boxes**. They may seem unrelated, but I promise you, each tutorial will teach you a skill that you will need in the process of making your car.

## Prerequirements

* [ ] You have Wolvenkit [installed](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/getting-started/eli5-getting-started) and set up
* [ ] You have the [wolvenkit-blender-io-suite](../../../for-mod-creators-theory/modding-tools/wolvenkit-blender-io-suite/ "mention") installed
* [ ] You have a text editor such as [Notepad++](https://notepad-plus-plus.org/downloads/)

### Mod requirements

Install these to your game before starting:

* [TweakXL](https://github.com/psiberx/cp2077-tweak-xl) (required, without it you won't be able to load Vehicle tweak at all)
* [ArchiveXL](https://www.nexusmods.com/cyberpunk2077/mods/4198)
* [Virtual Car Dealer](https://www.nexusmods.com/cyberpunk2077/mods/4454)
* [Material and Texture override](https://www.nexusmods.com/cyberpunk2077/mods/5266) (you can remove it once you've fully custompathed your car)

## Some familiarity with WolvenKit is required.&#x20;

I go into as much detail as I can, but you should be able to find your way around.&#x20;

{% hint style="success" %}
Check the [Creating a Mod](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/getting-started/creating-a-mod "mention") tutorial on the Wolvenkit wiki to learn your way around.
{% endhint %}

## You should know (most of) your mod file types

{% hint style="success" %}
To understand how those files hang together, complete the [adding-new-items](../../items-equipment/adding-new-items/ "mention") guide.
{% endhint %}

If you want to know more about the file types below, you can check [files-and-what-they-do](../../../for-mod-creators-theory/files-and-what-they-do/ "mention"). This doesn't count as a tutorial.

* `.ent` file is the base file of a vehicle. It contains all settings and child files.
* `.app` is the vehicle’s appearances settings.
* `.mesh` is a 3d file, used for vehicle body parts.
* `.xbm` are raw texture files.
* `.mlsetup` has settings for texture sets
* `.mlmask` is zipped mask texture/finish layers, normal maps, etc.
* `.inkatlas` contain reference texture information
* `.inkwidget` configures texture layering, position, & animations
* `.rig` has 3D information for how the `.mesh` files are linked and move.
* `.yaml` files configure **TweakDB** items.
* `.json` files list string localization information.
* `.phys` is used to set vehicle collision/interaction bounds

### Different Data Types

Putting the wrong data type will break your mod or make the game crash. Here is a list of what's what:

* **Int/Integer** : whole numbers
* **Float** : fractional numbers, decimal places
* **String** : sequence of characters
* **Boolean** : true or false
* **Array** : collection or list of items of the same data type
* **Nothing** : “null”

## You know your way around blender

{% hint style="success" %}
Unless you are comfortable in Blender already, check out [blender-getting-started](../../../for-mod-creators-theory/3d-modelling/blender-getting-started/ "mention") and complete at least the donut tutorial.&#x20;
{% endhint %}

You should know your way around at least the following parts:

* Object/edit mode
* Object management
* Object edits
* Joining  and separating models
* Know the difference between object origin, world origin, and the blender cursor
* [Cyberpunk 2077 glTF Importer plugin](https://github.com/WolvenKit/Cyberpunk-Blender-add-on) / Wolvenkit resources plugin\
  (View Options > plugins to install)

## Knowledge of a photo editor of your choice.&#x20;

If you don't have one, check out [Photopea](https://www.photopea.com/) - it's photoshop, in your browser, for free.

* Must have support for `.tga` files
* Must have support for alpha channels
* Photoshop, [Krita](https://krita.org/), [Paint.net](https://getpaint.net/), and [Gimp](https://gimp.org/) are all good options

## Some Python familiarity

Only necessary for advanced workflows - you can probably do without. if you want to learn a cool new skill, check out&#x20;

* [running-python-scripts.md](../../../for-mod-creators/modding-guides/everything-else/running-python-scripts.md "mention")&#x20;
* [blender-running-python-scripts.md](../../../for-mod-creators-theory/3d-modelling/blender-getting-started/blender-running-python-scripts.md "mention")

These do not count as a tutorial.

## You have a 3D model to use

{% hint style="info" %}
If you don't, check [custom-props](../../everything-else/custom-props/ "mention") -> [#where-to-find-models](../../everything-else/custom-props/#where-to-find-models "mention") for sources.
{% endhint %}

Your model should be high-quality and include the following:

* doors and a trunk (the chassis should not be one piece)
* a modelled interior
* textures

You can create each of these things yourself, but it will be extra work (and probably make you hate yourself).

### High or low poly?

Vanilla game cars range between 80k and 120k vertices. If you can, try finding car models within that range.

That being said, it is easier to simplify a high-poly model than to fix up a low-poly one. Still, if your car has over a million vertices, you will spend around a full workweek (40 hours) just making the model game-ready. Unless you enjoy that particular kind of suffering, you should stick to lower poly counts.

## That was a lot of text!

Yes! And now that you have read it all, we can move on to [create-base-files.md](create-base-files.md "mention")
