---
description: PartsOverrides, visual tags, and how to use them
---

# Influencing other items

### Summary <a href="#summary" id="summary"></a>

**Published:** November 12 2022 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** January 21 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page will teach you how your clothing can influence other clothing items, for example hiding the sleeves under a jacket. You have to do this manually for every item that you want to affect, a much better way to address the problem is the game's [Garment Support](../../3d-modelling/garment-support-how-does-it-work/) system.&#x20;

## Requirement: ArchiveXL >= 1.1.6

This guide will explain how to influence meshes by directly in the .app file, overriding whatever is defined for the components in the .ent file which loads them.

For even further customization options for wardrobe items, see [EquipmentEx](https://github.com/psiberx/cp2077-equipment-ex)'s readme.

## GarmentSupport: Layering your item on top

Cyberpunk 2077 uses a clever system to layer clothes on top of each other while minimizing clipping. It's called GarmentSupport, and as of 2024, it's almost completely functional.&#x20;

To use it with your clothing item, you need to change the component names to use the right prefixes. Check the [#component-prefixes](../../3d-modelling/garment-support-how-does-it-work/#component-prefixes "mention") section on [garment-support-how-does-it-work](../../3d-modelling/garment-support-how-does-it-work/ "mention") for details.

## PartsOverrides: Changing other meshes

To learn how to hide things via PartsOverrides, check [#chunkmasks-partially-hiding-meshes](../../files-and-what-they-do/3d-objects-.mesh-files/submeshes-materials-and-chunks.md#chunkmasks-partially-hiding-meshes "mention")

{% hint style="info" %}
You can't use PartsOverrides on components defined in the same .app file. Either use components from other files, or load them [#mesh-component-entity-simple-entity](../../files-and-what-they-do/entity-.ent-files/#mesh-component-entity-simple-entity "mention")
{% endhint %}

In the .app file, each appearance lets you define [#partsoverrides](../../files-and-what-they-do/appearance-.app-files/#partsoverrides "mention"), which — as the name implies — let you **override** previously defined components. An entry looks as follows:

<figure><img src="../../../.gitbook/assets/parts_values_parts_overrides.png" alt=""><figcaption><p>Overwrite the component "<code>kimono</code>" and "<code>kimono_filler</code>", which are defined in the file "<code>kimono_meshentity.ent</code>"<br>This is the reason why Cyberpunk has all the player components stored in .ent files!</p></figcaption></figure>

Where **partsValues** lets you define the individual entity files that you'll load, **partsOverrides** lets you assign properties which take precedence over those defined in the .ent file:

<figure><img src="../../../.gitbook/assets/partsOverrides2.png" alt=""><figcaption><p>componentsOverride > .ent file</p></figcaption></figure>

{% hint style="warning" %}
Components need to be **unambiguously** identified by their name as defined in the .ent file. For that reason, it's good practice to have globally unique identifiers.&#x20;
{% endhint %}

{% hint style="info" %}
You can make use of [archivexl-suffixes-and-substitutions.md](../../core-mods-explained/archivexl/archivexl-suffixes-and-substitutions.md "mention") for your components.
{% endhint %}

#### Arms

{% hint style="warning" %}
Due to cyberware, V has more arms than Shiva the Destroyer (although not at the same time). Arms are why we can't have nice things.
{% endhint %}

You can find arm component names on [cheat-sheet-body.md](../../references-lists-and-overviews/cheat-sheet-body.md "mention") -> [#arms](../../references-lists-and-overviews/cheat-sheet-body.md#arms "mention"). Alternatively, you can browse the corresponding entity files in the [Asset Browser](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/asset-browser) by [searching for](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files) `base\characters\common\player_base_bodies > .ent`, the file names will start with `a0_.`

#### Body

The player base body component name is

```
t0_000_pwa_base__full
t0_000_pma_base__full
```

### ArchiveXL

Normally, you can override only components from .ent files that you include via partsValues **in the same appearance**. ArchiveXL expands this by letting you manipulate **any** components that are loaded as part of the player.ent:

<figure><img src="../../../.gitbook/assets/partsOverrides3.png" alt=""><figcaption><p>This is hiding a submesh of the default body, which isn't part of the referenced <code>pants_leggins.ent.</code><br>This is only possible because of ArchiveXL!</p></figcaption></figure>

To delete an already existing reference, set the numeric value to the right of the depot path to 0: \


<figure><img src="../../../.gitbook/assets/archive_xl_remove_reference.png" alt=""><figcaption></figcaption></figure>

## VisualTags: GarmentSupport

These can be used **in addition** to PartsOverrides and will let you influence your item even further. To learn more about [garment-support-how-does-it-work](../../3d-modelling/garment-support-how-does-it-work/ "mention"), read [#the-algorithm](../../3d-modelling/garment-support-how-does-it-work/#the-algorithm "mention").

{% hint style="info" %}
This mechanism is how e.g. your sunglasses disappear when you put on a helmet.
{% endhint %}

{% hint style="warning" %}
Visual tags in the root entity will get applied to every appearance in the app.&#x20;

**However:**\
Due to technical limitations, any visual tags that **hide** parts of the mesh **must** go into the .app file to take effect. [File Validation](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/file-validation "mention") will warn you about this.
{% endhint %}



<figure><img src="../../../.gitbook/assets/visual_tags_preview.png" alt=""><figcaption></figcaption></figure>

### ArchiveXL

The following tags are used by the base game; however, to make use of them, you require [ArchiveXL](https://github.com/psiberx/cp2077-archive-xl).&#x20;

{% hint style="info" %}
With visual tags, you can force-show hair, hide an item in first person, or turn body parts on and off. Find the full list under [archivexl-tags.md](../../core-mods-explained/archivexl/archivexl-tags.md "mention")
{% endhint %}

## Custom tags: un-hiding chunks

If you want to un-hide chunks rather than hiding them, you need to define a custom tag via ArchiveXL. See [#adding-custom-tags](../../core-mods-explained/archivexl/archivexl-tags.md#adding-custom-tags "mention") for details.
