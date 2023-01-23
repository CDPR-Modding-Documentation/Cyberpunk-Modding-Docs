---
description: An overview and introduction
---

# Materials: How to configure them

{% hint style="info" %}
If you just want a material instance or file to copy, check [here](../../references-lists-and-overviews/cheat-sheet-materials.md).
{% endhint %}

## Multilayered Material

For a full documentation, check the corresponding [page](multilayered.md).&#x20;

To set it up, use these keys for the "values" array of your material:

|                 |                                                                                                                        |
| --------------- | ---------------------------------------------------------------------------------------------------------------------- |
| GlobalNormal    | path\to\normal.xbm                                                                                                     |
| MultilayerMask  | path\to\mask.mlmask ([white file](../../references-lists-and-overviews/cheat-sheet-materials.md#white-multilayermask)) |
| MultilayerSetup | path\to\material.mlsetup                                                                                               |

<figure><img src="../../../.gitbook/assets/material_docu_multilayered_example.png" alt=""><figcaption><p>an example multilayered material</p></figcaption></figure>

## Textured Material

The most commonly used material for anything textured is `engine\materials\metal_base.remt`. Despite its name, this material isn't necessarily metallic.

To make your mesh load a texture, use the following `CKeyValuePair`s in your material's "values" array:

|           |                                                                                           |
| --------- | ----------------------------------------------------------------------------------------- |
| BaseColor | path to your texture.xbm (Diffuse/Albedo)                                                 |
| Roughness | path to your roughnessMap.xbm (if you have one)                                           |
| Metalness | path to your metalnessMap.xbm (if you have one)                                           |
| Normal    | path to your normalMap.xbm ([if you have one](../../3d-modelling/self-made-normal-maps/)) |

<figure><img src="../../../.gitbook/assets/textured material example.png" alt=""><figcaption><p>example use of metal_base.remt as a textured material</p></figcaption></figure>

{% hint style="info" %}
The .xbm is a container around the texture. Export the xbm to png via WolvenKit.
{% endhint %}

{% hint style="warning" %}
If your texture has any brightness issues in-game, toggle around the isGamma flag during import.

The expected `isGamma` settings are:

normals: **false**\
diffuse/albedo: **true**\
anything that is used in .inkatlas files: **true**
{% endhint %}

## Emissive Material

You can turn `engine\materials\metal_base.remt` emissive by adding the correct parameters:

|               |                                                                   |
| ------------- | ----------------------------------------------------------------- |
| Emissive      | path to emissive texture, e.g. `engine\textures\editor\white.xbm` |
| EmissiveEV    | float, e.g. `4.0`                                                 |
| EmissiveColor | Color (copy from e.g. `mi_neokitsch_fridge_z_emissive.mi`)        |

Of course you can combine the two.
