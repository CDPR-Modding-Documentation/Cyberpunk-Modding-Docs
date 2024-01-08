---
description: PartsOverrides, visual tags, and how to use them
---

# Influencing other items

### Summary <a href="#summary" id="summary"></a>

**Created by @manavortex**\
**Published November 12 2022**

## Requirement: ArchiveXL >= 1.1.6

This guide will explain how to influence meshes by directly in the .app file, overriding whatever is defined for the components in the .ent file which loads them.

For even further customization options for wardrobe items, see [EquipmentEx](https://github.com/psiberx/cp2077-equipment-ex)'s readme.

## PartsOverrides: Hiding chunks

{% hint style="info" %}
You can not use PartsOverrides on components defined in the same .app file. Either use components from other files, or load them via [associated .ent file](adding-new-items/#mesh\_entity.ent).
{% endhint %}

In the .app file, each appearance lets you define [PartsOverrides](adding-new-items/#appearance.app), which — as the name implies — let you hide chunks of previously existing components. An entry looks as follows:

<figure><img src="../../../.gitbook/assets/parts_values_parts_overrides.png" alt=""><figcaption><p>Overwrite the component "<code>kimono</code>" and "<code>kimono_filler</code>", which are defined in the file "<code>kimono_meshentity.ent</code>"<br>This is the reason why Cyberpunk has all the player components stored in .ent files!</p></figcaption></figure>

Where **partsValues** lets you define the individual entity files that you'll load, **partsOverrides** lets you assign properties which take precedence over those defined in the .ent file:

<figure><img src="../../../.gitbook/assets/partsOverrides2.png" alt=""><figcaption><p>componentsOverride > .ent file</p></figcaption></figure>

{% hint style="info" %}
Components need to be **unambiguously** identified by their name as defined in the .ent file. For that reason, it's good practice to have globally unique identifiers.&#x20;
{% endhint %}

Starting with version >= [1.4.0](https://github.com/psiberx/cp2077-archive-xl/releases/tag/v1.4.0-rc2), ArchivXL can understand the following variables for `meshAppearance` in `appearanceOverrides`:

|                |                                                                                      |
| -------------- | ------------------------------------------------------------------------------------ |
| `{gender}`     | m or w depending on V's body gender                                                  |
| `{skin_color}` | [cheat-sheet-head](../../references-lists-and-overviews/cheat-sheet-head/ "mention") |
| `{hair_color}` | [hair.md](../../references-lists-and-overviews/cheat-sheet-head/hair.md "mention")   |

So depending on your PC's body gender and colouring, the meshAppearance `my_app_{gender}`**`{skin_color}_{`**`hair_color}` could translate to `my_app_w__01_ca_pale__blue_red_ombre`.

#### Arms

{% hint style="warning" %}
Due to cyberware, V has more arms than Shiva the Destroyer (although not at the same time). Find the component names on [cheat-sheet-body.md](../../references-lists-and-overviews/cheat-sheet-body.md "mention") -> [#arms](../../references-lists-and-overviews/cheat-sheet-body.md#arms "mention")
{% endhint %}

You can find the corresponding entity files in `base\characters\common\player_base_bodies > .ent`, the file names will start with `a0_.`

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
