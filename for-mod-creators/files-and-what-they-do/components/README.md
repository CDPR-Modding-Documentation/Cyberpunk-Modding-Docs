---
description: This page contains documentation for the most common component types. WIP.
---

# Components

{% content-ref url="documented-components.md" %}
[documented-components.md](documented-components.md)
{% endcontent-ref %}

{% hint style="info" %}
See the [Comprehensive Component Hierarchy List](../../../modding-know-how/files-and-what-they-do/components/comprehensive-components-list.md) for all possible components used in the game, organized by hierachy. Use for researching and documenting components.

For a json dump of all existing components and their properties, check [DrPresto's github repository.](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/lists/entComponent\_types.json)

For a hands-on guide on how to safely change components in .app files, look [here](../../modding-guides/npcs/appearances-change-the-looks.md#safely-adding-components).
{% endhint %}

Components are not a file type but an internal data structure and part of [.ent](./#.ent-entity) or [.app](./#.app-appearance-definition) files.&#x20;

Components are how the game adds anything to the in-game world, from pag3d data over player interaction prompts to explosion sounds.\
Entities and Appearances use **components** in order to slim down what data each game object has to carry, adding or removing them as needed.

## Component names

{% hint style="warning" %}
In general, these should be **globally unique** so you can target them via [partsOverrides](../../modding-guides/items-equipment/influencing-other-items.md#partsoverrides). Feel free to ignore this (almost everyone else does), but **do** read the next section.
{% endhint %}

### Body and clothing component prefixes

Body component prefixes affect how the game calculates [garment support](../../3d-modelling/garment-support-how-does-it-work.md) and you're strongly encouraged to stick to those naming conventions to make use of it. \
Please see the [corresponding wiki page](../../3d-modelling/garment-support-how-does-it-work.md#component-prefixes) for a list.

## Component Properties

Common component properties explained. For a more detailed list, please see [Documented Components](documented-components.md).

#### chunkMask

Only used for meshes: Determines which parts of a mesh will be displayed or hidden. Numeric indices correspond with the submeshes by index.

Set this to 0 to completely hide all parts of a mesh.

<figure><img src="../../../.gitbook/assets/chunkmask.png" alt=""><figcaption></figcaption></figure>

#### depotPath

Relative path to a resource within the game files. Used to load dependencies — meshes, rigs, animations, effects.

