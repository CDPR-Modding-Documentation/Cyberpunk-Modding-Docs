---
description: What do the different files do? How do I mod them?
---

# Cyberpunk file structure explained

**Created by @manavortex**\
**Published April 10 2023**\
**Game version: 1.6.1\_DLSS**

## .app (Appearance definition)

This file contains a list of appearances with their associated **components**. To load them, you require a [root entity](./#root-entity) .ent.

{% content-ref url="appearance-.app-files.md" %}
[appearance-.app-files.md](appearance-.app-files.md)
{% endcontent-ref %}

Holds a list of components.

## .ent (Entity)

### Root entity

The **entry point** for the game to display an [NPC](../../../modding-guides/npcs/appearances-change-the-looks.md#the-.ent-file) or [prop](../../../modding-guides/everything-else/custom-props.md). This kind of entity usually doesn't have components by itself, but only points towards the [.app file](./#.app-appearance-definition) where they are defined.&#x20;

From ArchiveXL item additions, this kind of file is usually called a **root entity**.

### Mesh entity / Component entity

**For player items**, an .ent file can serve as a **wrapper**, splitting components out of the .app file by putting them in their own file.

{% content-ref url="entity-.ent-files.md" %}
[entity-.ent-files.md](entity-.ent-files.md)
{% endcontent-ref %}

## Components

Not a file type but an internal data structure and part of [.ent](./#.ent-entity) or [.app](./#.app-appearance-definition) files. Components are how the game adds anything to the in-game world, from pag3d data over player interaction prompts to explosion sounds.

{% content-ref url="components.md" %}
[components.md](components.md)
{% endcontent-ref %}

## .inkatlas (Texture mapping)



## .mesh (3d object)

A 3d object, holding [appearances](../../../modding-guides/npcs/appearances-change-the-looks.md), [materials](../materials-how-to-configure-them/), and [rigging](../../3d-modelling/meshes-and-armatures-rigging.md).&#x20;

A mesh can have several **submeshes**, which can be displayed or hidden via [chunkmasks](../../../modding-guides/items-equipment/influencing-other-items.md#partsoverrides).&#x20;



## .mi / .mt / .remt

A material definition for a shader. You can assign those to **CMaterialInstance** entries in your mesh and then define their qualities by changing their parameters.&#x20;

{% hint style="info" %}
For further detes on materials, see [here](../materials-how-to-configure-them/). \
For an explanation on .mi files, see [here](../materials-how-to-configure-them/re-using-materials-.mi.md).
{% endhint %}

### Relevant properties:&#x20;

|                                                                       |                                                                                          |
| --------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| Different per material — see parameters/\[2] for a list of properties | <p>e.g. BaseColor, Metalness, NormalStrength<br>or VectorField, FresnelColor, Albedo</p> |
|                                                                       |                                                                                          |

<figure><img src="../../../.gitbook/assets/materials_eye_gradient_mi.png" alt=""><figcaption></figcaption></figure>

## .xbm (Texture)

A regular texture file. Can be exported to .png via WolvenKit, edited, and imported back into the game.

### Normal maps

Can be either blue or yellow (inverted), both exists. For a guide how to make your own, see [here](../../3d-modelling/self-made-normal-maps.md).&#x20;

Cyberpunk normal maps are swizzled (a technique originally employed in DTX-5).&#x20;

* The red channel stores the X axis
* The green channel stores the Y axis
* The blue channel is empty, since the Z-data will be calculated from red and blue.&#x20;

### Relevant properties:&#x20;

|         |                                                                                                                                              |
| ------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| IsGamma | <p>Override in-game gamma (lighting)? <br><br>- Set to "false" for normals<br>- Set to "true" for diffuse/albedo and any parts of the UI</p> |
|         |                                                                                                                                              |
