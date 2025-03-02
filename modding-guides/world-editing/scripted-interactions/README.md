---
icon: gear-code
description: This page will gather knowledge and guides about scripted interactions in Lua.
---

# Scripted interactions

### Summary

**Published:** Feb 24, 2025 by [Akiway](https://app.gitbook.com/u/2021vbDrMKZ0TbHeIx2wzPyAYtl2 "mention")\
**Last update:** Feb 24, 2025 by [Akiway](https://app.gitbook.com/u/2021vbDrMKZ0TbHeIx2wzPyAYtl2 "mention")\
**Credits:** @**keanuWheeze** for creating 90% of the scripts shared in this pages.

This page and its subpages contain ressources to guides about making scriped interactions for the player, for Cyberpunk 2077.

For the following, we can distinguish 2 types of interactions : devices and workspots.

**Device&#x20;**_**like**_**&#x20;interaction** will trigger a more-or-less simple code, eg : Open the wardrobe menu, Toggle a streamingsector variant, Open the Appearance menu, etc...

**Workspot interaction** involve animations and/or props, eg : Sleep on a bed, Sit on a chair, Smoke a cigarette, Drink a beer, etc...

### Wait, this is not what I want!

* You want to add workspots for NPCs ? Check this guide : [placing-aispot-nodes.md](../placing-aispot-nodes.md "mention")
* You want to change V's animations ? Check this section : [animations](../../animations/ "mention")  -> [creating-animations-editing-vs-actual-in-game-animations.md](../../animations/creating-animations-editing-vs-actual-in-game-animations.md "mention")

## Get into scripting

The next tutorials will show you how to get interactions to work without Lua or CET knowledge, but if you want to understand more about it, you can find a dedicated wiki about [Cyber Engine Teaks here](https://wiki.redmodding.org/cyber-engine-tweaks/).

{% hint style="success" %}
If you're using Visual Studio Code, you can get proper information on the games / CETs functions and methods using the [CET Lua Lib](https://wiki.redmodding.org/cyber-engine-tweaks/resources/vs-code).
{% endhint %}

## Download the template

For the following tutorials, you will need this template. It provides a bunch of utilities to make diverses things, beyond just interaction scripts.\
You will probably not use all those files, but they can be usefull depending on your needs.

{% file src="../../../.gitbook/assets/interaction_script_template.zip" %}

Thanks to @**keanuWheeze** for making most of the scripts.

Here is a breakdown of the its content:&#x20;

```
archive
 └─ base
     └─ gameplay
         └─ devices
             └─ arcade_machines // Contains entities used to play workspot animations
resources
 └─ bin
     └─ x64
         └─ plugins
             └─ cyber_engine_tweaks
                 └─ mods
                     └─ {YourModName}
                         └─ init.lua                    // Your main file
                             └─ tween                   // Library used to ease transitions between animations (https://github.com/kikito/tween.lua)
                             └─ modules
                                 └─ devices             // Device interactions "ready-to-use"
                                     └─ template        // Device template that can be extended
                                 └─ external            // Game related utilities maintained in external repositories
                                 └─ utils               // Lua/CET utilities
                                 └─ workspots           // Workspot interactions "ready-to-use"
                                     └─ template        // Workspot template that can be extended
                                 └─ interactions.lua    // List of interactions you add to the world
                                 └─ variants.lua        // Variants and settings logic
                                 └─ variantSettings.lua // List of settings and variants
```

### Interactions available

Device interactions :&#x20;

* Apprearance
* [Wardrobe](wardrobe-interaction-device.md)
* Mesh swap _(template)_
  * Custom door

Workspot interactions :&#x20;

* Sit _(template)_
  * Bench
  * [Couch](sit-on-couch-interaction-workspot.md)
  * Lean (rail)
* Sleep
* Coffee
* Drink
* Shower

### External resources

* Lua kit for CET : [Cron,  GameUI and more](https://github.com/psiberx/cp2077-cet-kit/tree/main) by @psiberx
* [Tween library](https://github.com/kikito/tween.lua) for smooth transitions by @kikito
