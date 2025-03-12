---
icon: sparkles
---

# Boe6's vehicles: What you need to know

### Some familiarity with WolvenKit is required.&#x20;

I go into as much detail as I can, but try to be familiar with the project explorer, asset browser, and other windows.&#x20;

### Mod file types

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

### Understanding of different Data Types

* **Int/Integer** : whole numbers
* **Float** : fractional numbers, decimal places
* **String** : sequence of characters
* **Boolean** : true or false
* **Array** : collection or list of items of the same data type
* **Nothing** : “null”

### Some understanding of blender is assumed.

* Object/edit mode
* Object management
* Object edits
* Joining  and separating models
* Know the difference between object origin, world origin, and the blender cursor
* [Cyberpunk 2077 glTF Importer plugin](https://github.com/WolvenKit/Cyberpunk-Blender-add-on) / Wolvenkit resources plugin\
  (View Options > plugins to install)

### Knowledge of a photo editor of your choice.&#x20;

* Must have support for `.tga` files
* Must have support for alpha channels
* Photoshop, [Photopea](https://www.photopea.com/), [Krita](https://krita.org/), [Paint.net](https://getpaint.net/), and [Gimp](https://gimp.org/) are all good options

### Some Python familiarity

* Not necessary for most changes

### Mod requirements

Install these to your game before starting:

* [Virtual Car Dealer](https://www.nexusmods.com/cyberpunk2077/mods/4454)
* [TweakXL](https://github.com/psiberx/cp2077-tweak-xl) (required, without it you won't be able to load Vehicle tweak at all)
* [ArchiveXL](https://www.nexusmods.com/cyberpunk2077/mods/4198)
* [Material and Texture override](https://www.nexusmods.com/cyberpunk2077/mods/5266) (unknown if required after 2077 version 2.0+)

### A 3D model to use

* Have a 3D vehicle model ready to use for converting into cyberpunk.
* Important features are details parts, doors, trunk, etc. and textures.
* Higher face/vertice count is better. Modeled interiors are a must.
* [Sketchfab](https://sketchfab.com/3d-models/categories/cars-vehicles?features=downloadable\&sort_by=-likeCount\&cursor=cD0xMzE5) is one great option for finding models, but [Google](https://letmegooglethat.com/?q=3d+model+car+download+free) is also useful.
