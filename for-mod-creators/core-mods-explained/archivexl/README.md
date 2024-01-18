---
description: Adding stuff to the game, for the major-leagues
---

# ArchiveXL

## Summary

Published in August 23 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

{% hint style="success" %}
As suggested by psiberx, the general usage documentation for ArchiveXL will be kept in this wiki for ease of use. You can find the [readme](https://github.com/psiberx/cp2077-archive-xl) on github or check the repository's [wiki section](https://github.com/psiberx/cp2077-archive-xl/wiki).
{% endhint %}

## OK, so what is this?

ArchiveXL ([nexus](https://www.nexusmods.com/cyberpunk2077/mods/4198) | [github](https://github.com/psiberx/cp2077-archive-xl/)) is one of the [core frameworks](../) of Cyberpunk 2077 modding. Together with **TweakXL**, It allows you to add things to the game, such as

* [equipment](../../modding-guides/items-equipment/adding-new-items/) and [weapons](../../modding-guides/items-equipment/adding-new-items/weapons/)
* [photo mode poses](../../modding-guides/animations/archivexl-adding-photo-mode-poses.md)
* world sectors ([deletions](../../modding-guides/world-editing/world-editing-deleting-objects.md) and additions)
* custom lipsync maps
* Translations (check [#how-does-the-game-assign-display-names](../../modding-guides/items-equipment/adding-new-items/weapons/new-iconic-weapon-tutorial-for-dummies.md#how-does-the-game-assign-display-names "mention")for a guide)
* If you want to look up garment appearance slots: The princess is in another castle. Check [different-equipment-slots.md](../../modding-guides/items-equipment/adding-new-items/different-equipment-slots.md "mention") instead.

This page will document how to **set item properties** via **tags & suffixes** (the vanilla way)**,** or via **dynamic switching** (new, cool, version >= 1.5).

Let's dive right in.

## Variants and suffixes

### What are variants, what do I need them for?

When adding items, you will normally offer multiple [**mesh appearances**](../../files-and-what-they-do/3d-objects-.mesh-files/#step-1-appearances) (variants), for example, the same shirt in black, white, and red. This is what you're modding for, after all: making cool things.

### And what are suffixes?

Sometimes, you want to load different meshes/appearances under different circumstances. Until ArchiveXL 1.5, the process was extremely tedious, but thanks to psiberx, [**suffixes**](../../files-and-what-they-do/entity-.ent-files/#what-are-suffixes) have been replaced with **conditions** (read up on [dynamic variants](./#dynamic-variants) to learn how to make use of that).&#x20;

For more detail on this, please see the sub-page [archivexl-suffixes-and-substitutions.md](archivexl-suffixes-and-substitutions.md "mention")

## Tags

Tags are a way to add extra information to entities or individual appearances. They are defined on their own sub-page: [archivexl-tags.md](archivexl-tags.md "mention")

## Dynamic appearances

If you have ever tried to make ten colour variants of an item for two body genders with four different states of feet, then you're familiar with the struggle. Version 1.5.0 of ArchiveXL solves this problem by introducing dynamic variants, allowing you to define **rules** to hook up your yaml straight to the mesh entity. picking components and even appearances dynamically.&#x20;

{% hint style="success" %}
For a tutorial about this, check [archivexl-dynamic-variants.md](../../modding-guides/items-equipment/adding-new-items/archivexl-dynamic-variants.md "mention")

If you are a mod user and want to dynamically recolour an item, check the [recolours-and-refits](../../modding-guides/items-equipment/recolours-and-refits/ "mention") guide -> sub-page Emissive -> [#switching-existing-colours](../../modding-guides/items-equipment/recolours-and-refits/r-and-r-emissive.md#switching-existing-colours "mention")
{% endhint %}

### Substitutions

Since 1.8.0, ArchiveXL supports substitutions for [#dynamic-appearances](./#dynamic-appearances "mention") inside the mesh entity for the fields `name`, `depotPath` and `appearance`.

{% hint style="info" %}
Substitution will only become active if the property name starts with an asterisk (`*`).
{% endhint %}

Any placeholders will be replaced with the correct value for your current state — at run-time!

If any of the placeholders aren't working the way you expect them, check if the table below is outdated by referring [directly to the source](https://github.com/psiberx/cp2077-archive-xl/blob/027aab7139689ee8d14163682ab6d506fbccea2a/src/App/Extensions/GarmentOverride/Dynamic.cpp#L29).

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

For dynamic appearances, you can conditionally switch out components or entire appearances **by name**. You can switch on any of the  known [#substitutions](./#substitutions "mention").

The order works as follows:

<table><thead><tr><th width="332.3333333333333">Appearance/Component</th><th width="67" align="center">Priority</th><th>Description</th></tr></thead><tbody><tr><td><code>my_item!variant&#x26;camera=tpp</code></td><td align="center">1</td><td>Has the highest priority because it requires a specific variant and one state condition.</td></tr><tr><td><code>my_item!variant</code></td><td align="center">2</td><td>Has second priority because it requires a specific variant.</td></tr><tr><td><code>my_item&#x26;gender=w&#x26;camera=tpp</code></td><td align="center">3</td><td>Has third priority because it has two state conditions.</td></tr><tr><td><code>my_item&#x26;camera=tpp</code></td><td align="center">4</td><td>Has fourth priority because it has one state condition.</td></tr><tr><td><code>my_item</code></td><td align="center">5</td><td>Has the lowest priority and will be used when no other elements match the criteria.</td></tr></tbody></table>

## Overview

Here's an overview of how the dynamic variants work. By comparison, [this](../../modding-guides/items-equipment/adding-new-items/#diagram) is the old diagram. \
Especially for items with many appearances, the new way is **much** faster.

<figure><img src="https://i.imgur.com/k1CWIMk.png" alt=""><figcaption></figcaption></figure>
