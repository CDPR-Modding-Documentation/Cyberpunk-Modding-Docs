---
description: PartsOverrides, visual tags, and how to use them
---

# Influencing other items

### Summary <a href="#summary" id="summary"></a>

**Created by @manavortex**\
**Published November 12 2022**

## Requirement: ArchiveXL >= 1.1.6

This guide will explain how to influence meshes by directly in the .app file, overriding whatever is defined for the components in the .ent file which loads them.

## PartsOverrides

{% hint style="info" %}
This section assumes that you're loading appearance parts via [associated .ent file](adding-new-items.md#mesh\_entity.ent) rather than including them as components.
{% endhint %}

In the .app file, each appearance lets you define [PartsOverrides](adding-new-items.md#appearance.app), which — as the name implies — let you override the appearance of parts. An entry looks as follows:

<figure><img src="../../.gitbook/assets/Screenshot 2022-11-14 at 09.35.06.png" alt=""><figcaption><p>Overwrite the component "<code>kimono</code>" and "<code>kimono_filler</code>", which are defined in the file "<code>kimono_meshentity.ent</code>"</p></figcaption></figure>

Where **partsValues** lets you define the individual entity files that you'll load, **partsOverrides** lets you assign properties which take precedence over those defined in the .ent file:

<figure><img src="../../.gitbook/assets/partsOverrides2.png" alt=""><figcaption><p>componentsOverride > .ent file</p></figcaption></figure>

{% hint style="info" %}
Components need to be **unambiguously** identified by their name as defined in the .ent file. For that reason, it's good practice to have globally unique identifiers.&#x20;
{% endhint %}

#### Arms

{% hint style="warning" %}
If you want to affect V's arms (for example, hiding clipping shoulders under a jacket), you might have to override the following components (the male equivalent will be named pma):
{% endhint %}

```
a0_001_pwa_base_hq__full         // gorilla arms
a0_001_pwa_base_hq__full8640     // gorilla arms
left_arm                         // default arms
right_arm                        // default arms
a0_000_pwa_base__fists           // fists (fighting arms)
```

You can find the corresponding entity files in `base\characters\common\player_base_bodies > .ent`, the file names will start with `a0_.`

### ArchiveXL

Normally, you can override only components from .ent files that you include via partsValues **in the same appearance**. ArchiveXL expands this by letting you manipulate **any** components that are loaded as part of the player.ent:

<figure><img src="../../.gitbook/assets/partsOverrides3.png" alt=""><figcaption><p>This is hiding a submesh of the default body, which isn't part of the referenced <code>pants_leggins.ent.</code><br><code></code>This is only possible because of ArchiveXL!</p></figcaption></figure>

To delete an already existing reference, set the numeric value to the right of the depot path to 0: \


<figure><img src="../../.gitbook/assets/archive_xl_remove_reference.png" alt=""><figcaption></figcaption></figure>

## VisualTags

In the .app file, each appearance will contain an array by the name of `visualTags.tags`. These will let you hide parts of other meshes.

{% hint style="info" %}
This mechanism is how e.g. your sunglasses disappear when you put on a helmet.
{% endhint %}

They can be used **additionally** to partsOverrides.

<figure><img src="../../.gitbook/assets/visual_tags_preview.png" alt=""><figcaption></figcaption></figure>

### ArchiveXL

The following tags are used by the base game; however, to make use of them, you require [ArchiveXL](https://github.com/psiberx/cp2077-archive-xl).&#x20;

| Tag             | Effect                                                    |
| --------------- | --------------------------------------------------------- |
| `hide_H1`       | Hides item in the `Head` slot (_hats, caps, headbands_)   |
| `hide_F1`       | Hides item in the `Eyes` slot (_sunglasses, face masks_)  |
| `hide_T1`       | Hides item in the `Chest` slot (_shirts, tops_)           |
| `hide_T2`       | Hides item in the `Torso` slot (_jackets, coats_)         |
| `hide_L1`       | Hides item in the `Legs` slot (_pants, skirts_)           |
| `hide_S1`       | Hides item in the `Feet` slot (_shoes_)                   |
| `hide_T1part`   | Torso item: controls the partial suffix (`&Full`/`&Part`) |
| `hide_Hair`     | Hides hair (_hair_)                                       |
| `hide_Genitals` | Replaces genitals/underwear with blank mesh, angel style. |

{% hint style="warning" %}
`hide_Genitals` will hide **only** the genitals, not the entire body submesh!
{% endhint %}

ArchiveXL additionally defines the following [visual tags](https://github.com/psiberx/cp2077-archive-xl#adding-visual-tags):

| Tag           | Effect                |
| ------------- | --------------------- |
| `hide_Head`   | Hides head.           |
| `hide_Torso`  | Hides torso.          |
| `hide_Arms`   | Hides head.           |
| `hide_Thighs` | Hides thighs.         |
| `hide_Calves` | Hides calves.         |
| `hide_Ankles` | Hides ankles.         |
| `hide_Feet`   | Hides feet.           |
| `hide_Legs`   | Hides the whole legs. |





<div>

<figure><img src="../../.gitbook/assets/body-parts-male.png" alt=""><figcaption><p>male version - image by LadyLea</p></figcaption></figure>

 

<figure><img src="../../.gitbook/assets/bodyparts_female.png" alt=""><figcaption><p>female version - image by LadyLea</p></figcaption></figure>

</div>



