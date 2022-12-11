---
description: Overview over different kinds of files and their purpose
---

# Folder structure and files

**Created by @manavortex**\
**Published December 11 2022**\
**Game version: 1.6.1**

**Status: TBD**

## .app (Appearance definition)



## .ent (Entity)



## .inkatlas (Texture mapping)



## .mesh (3d object)

A 3d object, holding appearances, materials, and rigging.&#x20;

For details about **appearances**, see [here](../../modding-guides/items/editing-existing-items/recoloring-and-changing-materials.md).



## .mi / .mt / .remt

A material definition for a shader. You can assign those to **CMaterialInstance** entries in your mesh and then define their qualities by changing their parameters.&#x20;

### Relevant properties:&#x20;

|                                                                       |                                                                                          |
| --------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| Different per material — see parameters/\[2] for a list of properties | <p>e.g. BaseColor, Metalness, NormalStrength<br>or VectorField, FresnelColor, Albedo</p> |
|                                                                       |                                                                                          |

<figure><img src="../../.gitbook/assets/materials_eye_gradient_mi.png" alt=""><figcaption></figcaption></figure>

## .xbm (Texture)

A regular texture file. Can be exported to .png via WolvenKit, edited, and imported back into the game.

### Relevant properties:&#x20;

|         |                                                                                                                                              |
| ------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| IsGamma | <p>Override in-game gamma (lighting)? <br><br>- Set to "false" for normals<br>- Set to "true" for diffuse/albedo and any parts of the UI</p> |
|         |                                                                                                                                              |
