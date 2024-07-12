---
description: How do effects work? How do I mod them?
---

# Effects and particles

## Summary

**Published**: Feb 11 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented edit**: Feb 11 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

### Wait, this is not what I want!

* See [effect-components.md](components/documented-components/effect-components.md "mention") for effect explanations by component
* See [fx-material-properties.md](../materials/configuring-materials/fx-material-properties.md "mention") for animated _materials_
* While explosions are definitely effects, lights are something else => [lights-explained.md](lights-explained.md "mention")
* To **position** effects, see [amm-light-components.md](../core-mods-explained/amm/custom-props/amm-light-components.md "mention") -> [#placing-your-light-components](../core-mods-explained/amm/custom-props/amm-light-components.md#placing-your-light-components "mention")

{% hint style="info" %}
This page is a stub, but this wiki is a community project! Please [sign up](https://app.gitbook.com/invite/-MP5ijqI11FeeX7c8-N8/H70HZBOeUulIpkQnBLK7) and [start editing](#user-content-fn-1)[^1], we'd love to have you!
{% endhint %}

## Effect registry

All effect files are registered in `static_effects.csv`.  Since that file can only be edited once, you have to merge your own .es files by script.

For instructions on how to do that, check [Scripting Cyberpunk](https://app.gitbook.com/o/-MP5ijqI11FeeX7c8-N8/s/fwsaoju1TBAUvMpI6NIw/ "mention") -> [Effects](https://app.gitbook.com/s/fwsaoju1TBAUvMpI6NIw/how-do-i/effects "mention")

## Effect duration

An effect's **duration** is defined in the .effects file:

<figure><img src="../../.gitbook/assets/effect_duration.png" alt=""><figcaption></figcaption></figure>

## Particle lifetime

You can find a particle's lifetime for the individual entries in the `modules` array:

These are probably (?) overwritten by effect durations?

<figure><img src="../../.gitbook/assets/particle_durations.png" alt=""><figcaption></figcaption></figure>

## To select and identify effect files used in different ways

As we progress through the game, we encounter many effects, such as those seen in Cyberspace. Since I don't yet know everything, I'll show you the process of creating a mod.

Firstly, we choose the effect we want to import. I found an effect I want to use for overclocking during the Somewhat Damaged quest, and the quest code is Q305\_bunker. Navigate to the asset browser and search for related items, focusing on extracting the effect files.

<figure><img src="../../.gitbook/assets/image (383).png" alt=""><figcaption><p>fxLibrary.lua</p></figcaption></figure>

To confirm if this effect is what I'm looking for, I need the [FX player](https://www.nexusmods.com/cyberpunk2077/mods/8194) mod. Based on the Cyberpunk installation folder, go to bin\x64\plugins\cyber\_engine\_tweaks\mods\FxPlayer\modules and confirm that fxLibrary.lua operates in the same format. Copy the file path of the desired effect to play these files in-game using CET (Cyber Engine Tweaks).

<figure><img src="../../.gitbook/assets/image (384).png" alt=""><figcaption></figcaption></figure>



## How to see effect file worked

Firstly, we choose the effect we want to import. I found an effect I want to use for overclocking during the "Somewhat Damaged" quest, and the quest code is Q305\_bunker. Navigate to the asset browser and search for related items, focusing on extracting the effect files.

{% hint style="info" %}
TODO: This could use an image
{% endhint %}

To confirm if this effect is what I'm looking for, I need the [FX player](https://www.nexusmods.com/cyberpunk2077/mods/8194) mod. Based on the Cyberpunk installation folder, go to bin\x64\plugins\cyber\_engine\_tweaks\mods\FxPlayer\modules and confirm that fxLibrary.lua operates in the same format. Copy the file path of the desired effect to play these files in-game using CET (Cyber Engine Tweaks).

{% hint style="info" %}
TODO: This could use an image
{% endhint %}

[^1]: Don't worry, you can't break anything. Each change has to be reviewed by an admin before it is merged back.

