---
description: Adding stuff to the game, for the major-leagues
---

# ArchiveXL

## Summary

Published in August 23 by [manavortex](http://127.0.0.1:5000/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

{% hint style="success" %}
As suggested by psiberx, the general usage documentation for ArchiveXL will be kept in this wiki for ease of use. You can find the [readme](https://github.com/psiberx/cp2077-archive-xl) on github or check the repository's [wiki section](https://github.com/psiberx/cp2077-archive-xl/wiki).
{% endhint %}

## OK, so what is this?

ArchiveXL ([nexus](https://www.nexusmods.com/cyberpunk2077/mods/4198) | [github](https://github.com/psiberx/cp2077-archive-xl/)) is one of the [core frameworks](./) of Cyberpunk 2077 modding. Together with **TweakXL**, It allows you to add things to the game, such as

* [equipment](../modding-guides/items-equipment/adding-new-items/) and [weapons](../modding-guides/items-equipment/adding-new-items/weapons/)
* [photo mode poses](../modding-guides/animations/archivexl-adding-photo-mode-poses.md)
* world sectors ([deletions](../modding-guides/world-editing/world-editing-deleting-objects.md) and additions)
* custom lipsync maps

This page will document how to **set item properties** via **tags & suffixes** (the vanilla way)**,** or via **dynamic switching** (new, cool, version >= 1.5).

Let's dive right in.

## Variants and suffixes

### What are variants, what do I need them for?

When adding items, you will normally offer multiple [**mesh appearances**](../files-and-what-they-do/3d-objects-.mesh-files.md#step-1-appearances) (variants), for example, the same shirt in black, white, and red. This is what you're modding for, after all: making cool things.

### And what are suffixes?

Sometimes, you want to load different meshes/appearances under different circumstances. Until ArchiveXL 1.5, the process was extremely tedious, but thanks to psiberx, [**suffixes**](../files-and-what-they-do/entity-.ent-files.md#what-are-suffixes) have been replaced with **conditions** (read up on [dynamic variants](archivexl.md#dynamic-variants) to learn how to make use of that).&#x20;

While the solution has changed (and improved), the problem remains:

#### Body genders

There are two body genders with different proportions, and you can't make them wear the same shirt (at least not without clipping). To solve that, you can do what CDPR did and have one variant per rig.

The suffix for the body is `Male` / `Female`, the ArchiveXL string substitution is `{gender}` and resolves to `m` or `w`.

#### Body types

On top of that, you can add **body mods** (mostly chest size, but occasionally full refits). Starting with 1.5, these will be [supported by ArchiveXL](https://github.com/psiberx/cp2077-archive-xl/wiki/Dynamic-Appearances#conditions)! That means, no more compatibility archives, since AXL can simply load different meshes for you…

#### Camera modes

Sometimes, you need to hide parts of the item in first person. – for example helmets, since you don't want to have half a helmet floating in front of your face (unless you consider that immersive; most people don't).

{% hint style="info" %}
To hide an item in first person perspective, you can add the following tag to the root entity:

`EmptyAppearance:FPP`

or add an `&FPP` variant pointing at

`base\characters\appearances\player\items\empty_appearance.app` \
`default`
{% endhint %}

#### Arm states

The arm states represent the different cyberware. For example, since you can't hire the forearms for mantis blades, you can roll up the sleeves just for this. The definitions are:

| Cyberware           | Suffix                |
| ------------------- | --------------------- |
| None                | `&BaseArms`           |
| Mantis Blades       | `&MantisBlades`       |
| Monowire            | `&Monowire`           |
| Projectile Launcher | `&ProjectileLauncher` |

#### Foot states

To achieve gender equality in regard to foot states, you need to use [Toggleable Feet](https://www.nexusmods.com/cyberpunk2077/mods/7049).

| Character | Footwear                      | Suffix       |
| --------- | ----------------------------- | ------------ |
| Female    | Unequipped                    | `&Flat`      |
| Female    | Equipped without tags         | `&Lifted`    |
| Female    | Equipped with `HighHeels` tag | `&HighHeels` |
| Female    | Equipped with `FlatShoes` tag | `&FlatShoes` |
| Male      | Any                           | (empty)      |

## Tags

Tags are a way to tell Cyberpunk that an item has certain properties and should behave in a certain way. Thanks to ArchiveXL's extended tag system, you can for example force flat feet for female V, or un-hide hair from a head item.

{% hint style="warning" %}
Please keep in mind that you need to add those to the [.app file](../files-and-what-they-do/appearance-.app-files.md)'s **appearance definition** rather than the root or mesh entity.&#x20;
{% endhint %}

### Base game tags

| Tag             | Effect                                                                      |
| --------------- | --------------------------------------------------------------------------- |
| `hide_H1`       | Hides an item in the `Head` slot.                                           |
| `hide_F1`       | Hides an item in the `Eyes` slot.                                           |
| `hide_T1`       | Hides an item in the `Chest` slot.                                          |
| `hide_T2`       | Hides an item in the `Torso` slot.                                          |
| `hide_L1`       | Hides an item in the `Legs` slot.                                           |
| `hide_S1`       | Hides an item in the `Feet` slot.                                           |
| `hide_T1part`   | Toggles the partial suffix (`&Full` →`&Part`) when applied to `Torso` item. |
| `hide_Hair`     | Hides hair.                                                                 |
| `hide_Genitals` | Hides genitals in uncensored mode and underware in censored mode.           |

### Custom tags

| Tag                 | Effect                                  |
| ------------------- | --------------------------------------- |
| `hide_Head`         | Hides head.                             |
| `hide_Torso`        | Hides the whole torso.                  |
| `hide_LowerAbdomen` | Hides lower abdomen.                    |
| `hide_UpperAbdomen` | Hides upper abdomen.                    |
| `hide_CollarBone`   | Hides collar bone area.                 |
| `hide_Arms`         | Hides head.                             |
| `hide_Thighs`       | Hides thighs.                           |
| `hide_Calves`       | Hides calves.                           |
| `hide_Ankles`       | Hides ankles.                           |
| `hide_Feet`         | Hides feet.                             |
| `hide_Legs`         | Hides the whole legs.                   |
| `force_Hair`        | Forces visible hair for head items.     |
| `force_FlatFeet`    | Forces flat feet for female characters. |

### Hiding body parts: diagram

<div>

<figure><img src="../../.gitbook/assets/archiveXl_bodyparts_cheatsheet_ref_ladylea_mV.png" alt=""><figcaption><p>male version - image by LadyLea</p></figcaption></figure>

 

<figure><img src="../../.gitbook/assets/archiveXl_bodyparts_cheatsheet_ref_ladylea_fV.png" alt=""><figcaption><p>female version - image by LadyLea</p></figcaption></figure>

</div>

## Dynamic appearances

If you have ever tried to make ten colour variants of an item for two body genders with four different states of feet, then you're familiar with the struggle. Version 1.5.0 of ArchiveXL solves this problem by introducing dynamic variants, allowing you to define **rules** to hook up your yaml straight to the mesh entity. picking components and even appearances dynamically.&#x20;

{% hint style="success" %}
For a tutorial about this, check [archivexl-dynamic-variants.md](../modding-guides/items-equipment/adding-new-items/archivexl-dynamic-variants.md "mention")
{% endhint %}

### Substitutions

Since 1.8.0, ArchiveXL supports substitutions for [#dynamic-appearances](archivexl.md#dynamic-appearances "mention") inside the mesh entity for the fields `name`, `depotPath` and `appearance`.

{% hint style="info" %}
Substitution will only become active if the property name starts with an asterisk (`*`).
{% endhint %}

Any placeholders will be replaced with the correct value for your current state — at run-time!

| Placeholder    | Substitution                                                    |
| -------------- | --------------------------------------------------------------- |
| `{camera}`     | `fpp` or `tpp`                                                  |
| `{gender}`     | `m` or `w`                                                      |
| `{body}`       | `base_body` or body mod name in snake case                      |
| `{arms}`       | `base_arms`, `mantis_blades`, `monowire`, `projectile_launcher` |
| `{feet}`       | `flat`, `lifted`, `high_heels`, `flat_shoes`                    |
| `{sleeves}`    | `full`, `part`                                                  |
| `{skin_color}` | skin color name from customization, e.g. `03_senna`             |
| `{hair_color}` | hair color name from customization. e.g. `black_liquorice`      |

### Conditional switching

For dynamic appearances, you can conditionally switch out components or entire appearances **by name**. You can switch on any of the  known [#substitutions](archivexl.md#substitutions "mention").

The order works as follows:

<table><thead><tr><th width="332.3333333333333">Appearance/Component</th><th width="67" align="center">Priority</th><th>Description</th></tr></thead><tbody><tr><td><code>my_item!variant&#x26;camera=tpp</code></td><td align="center">1</td><td>Has the highest priority because it requires a specific variant and one state condition.</td></tr><tr><td><code>my_item!variant</code></td><td align="center">2</td><td>Has second priority because it requires a specific variant.</td></tr><tr><td><code>my_item&#x26;gender=w&#x26;camera=tpp</code></td><td align="center">3</td><td>Has third priority because it has two state conditions.</td></tr><tr><td><code>my_item&#x26;camera=tpp</code></td><td align="center">4</td><td>Has fourth priority because it has one state condition.</td></tr><tr><td><code>my_item</code></td><td align="center">5</td><td>Has the lowest priority and will be used when no other elements match the criteria.</td></tr></tbody></table>

## Overview

Here's an overview of how the dynamic variants work. By comparison, [this](../modding-guides/items-equipment/adding-new-items/#diagram) is the old diagram. \
Especially for items with many appearances, the new way is **much** faster.

<figure><img src="https://i.imgur.com/k1CWIMk.png" alt=""><figcaption></figcaption></figure>
