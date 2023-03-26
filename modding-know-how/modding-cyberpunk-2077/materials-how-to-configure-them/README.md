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

|           |                                                                                             |
| --------- | ------------------------------------------------------------------------------------------- |
| BaseColor | path to your texture.xbm (Diffuse/Albedo)                                                   |
| Roughness | path to your roughnessMap.xbm (if you have one)                                             |
| Metalness | path to your metalnessMap.xbm (if you have one)                                             |
| Normal    | path to your normalMap.xbm ([if you have one](../../3d-modelling/self-made-normal-maps.md)) |

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

## Plastic

The most commonly used material for anything textured is `engine\materials\metal_base.remt`. Despite its name, this material isn't necessarily metallic.

To turn the material into plastic, use the following `CKeyValuePair`s in your material's "values" array:

|                |                                                                                                                                    |
| -------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| BaseColor      | `base\materials\placeholder\white.xbm`                                                                                             |
| Normal         | optional: path to your normal map                                                                                                  |
| Roughness      | optional: path to your roughness map                                                                                               |
| RoughnessBias  | 0.200000003                                                                                                                        |
| BaseColorScale | Colour as x/y/z values (color picker blend file [here](https://mega.nz/file/uE902LDQ#YmrHs0oAQBQqaFPjvYGazxI5s2LUlqzuNG14jU8Vgks)) |

You can find a ready-to-download template [here](https://mega.nz/file/nElTyD6Z#LU5kYrd42ikOvWdWSVu51e0Brg0E-YqymCp5AgQdaLY).

## Emissive Material

You can make `engine\materials\metal_base.remt` glow by adding the correct parameters, or you can poke through the game files and search for `emissive > .mi` to find Cyberpunk material templates to learn from.&#x20;

For a list of such templates, check [here.](../../references-lists-and-overviews/cheat-sheet-materials.md#emissive-materials)&#x20;

|               |                                                                                                                                                               |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Emissive      | <p>path to emissive texture, e.g. <code>engine\textures\editor\white.xbm</code><br><code></code>The texture works like an alpha mask.</p>                     |
| EmissiveEV    | float, e.g. `2.0`: emissive brightness. Brightness varies depending on your colour. Unless you want to actively blind people, you might want to stay below 4. |
| EmissiveColor | Glow colour as RGB (copy from e.g. `mi_neokitsch_fridge_z_emissive.mi`)                                                                                       |

Find a ready-to-use glowing .mi file [here](https://mega.nz/file/jZdCzRzT#7IJD9dQgBT11TCC2ckzD-FFvm0igbVOr19KqhxAx8Ag).

## Glass

Cyberpunk's glass material, such as `base\materials\glass_onesided.mt`

|                  |                                                                                                                           |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------- |
| Opacity          | float, `0.0 - 1.0`: Controls glass transparency.                                                                          |
| GlassTint        | A texture to tint your glass. (TBD: Does it work as a mask?)                                                              |
| TintColor        | Glass tint as RGB (copy from e.g. `mi_neokitsch_fridge_z_emissive.mi`).                                                   |
| IOR              | [Index of refraction](https://pixelandpoly.com/ior.html) as float, `1.0-2.0:` The refraction properties of your material. |
| Refraction Depth | float `0.0-10.0:` Control refraction amount here.                                                                         |
| FresnelBias      | float, `0.0 - 2.0`: How much does the glass behave like a lens (that is, warp the picture behind it)?                     |
| BlurRadius       | float, `0.0 - 1.0`: Blur amount when looking through the glass                                                            |

Find a ready-to-use bottle glass .mi [here](https://mega.nz/file/XJshBTxT#OLiUH1UbZEBJG2izMX2egRxq7vVYzqjg9Tbj-7o2bYQ).&#x20;

### Non-warping glass

For a glass material without view distortion and warping, use `base\vehicles\common\materials\glass_windshield_tinted_black.mi`

|                                                      |                                                                                                          |
| ---------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| Opacity/OpacityBackFace                              | float, `0.0 - 5.0`: Controls glass transparency. OpacityBackFace will only affect inside-facing normals. |
| FrontFacesReflectionPower / BackFacesReflectionPower | float, `0.0-10.0`: How strongly should the glass reflect?                                                |
| TintColor/TintSurface                                | Surface and refraction color as RGB (copy from e.g. `mi_neokitsch_fridge_z_emissive.mi`).                |

Find a ready-to use glass .mi file [here](https://mega.nz/file/3UkRgJRJ#o8uHKkr1-LaHQ6eUwmbs9A08ZAE-pxYvlseQru9EGhg)&#x20;

### Half-transparent glass

`base\environment\decoration\electronics\devices\device_neokitsch\textures\device_neokitsch_glass_black.mi`

### Device screen glass

`base\fx\shaders\parallaxscreen.mt`

|                    |                                                                                      |
| ------------------ | ------------------------------------------------------------------------------------ |
| ParalaxTexture     | Texture that your screen should display, e.g. `base\materials\placeholder\black.xbm` |
| LayersSeparation   | 1                                                                                    |
| ScanlinesIntensity | 0                                                                                    |
| ScanlinesDensity   | 0                                                                                    |
| Emissive           | 0                                                                                    |
| Roughness          | 0.200000003                                                                          |
| Metalness          | 0                                                                                    |

Find a ready-to-use example of a turned-off screen [here](https://mega.nz/file/mMsWlDja#QlZ-jsSHuIJ-E8jYmXRbzrk5wstsDOJXTK3pe7XP89I).

## Liquid

Cyberpunk has its own liquid shader(s) such as `base\materials\fillable_fluid_vertex.mt`. Projecting this material onto a submesh will turn the submesh into a transparent container filled with the liquid you specified. If you flip the container on its head, the fluid will drain to the bottom and fill it up again.

To control the offsets, you need to adjust the vectors FluidBoundingBoxMax and FluidBoundingBoxMin.

It shares various properties (such as IOR, FresnelBias, BlurRadius) with the [glass shader](./#glass).

|                                                   |                                                                                                                                                                                                                                                                                                                          |
| ------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| TintColor                                         | liquid's color as RGB (copy from e.g. `mi_neokitsch_fridge_z_emissive.mi`).                                                                                                                                                                                                                                              |
| FillAmount                                        | float, e.g.`0.0`: Probably works in combination with the bounding box. You'll have to experiment.                                                                                                                                                                                                                        |
| <p>FluidBoundingBoxMin<br>FluidBoundingBoxMax</p> | <p>Vectors (X, Y, Z, W) controlling the maximum distance from the container's walls. Each value is a float (decimal) speficying the axis in question - you'll simply have to play around with them (you can ignore W). <br><br>For a bottle material I've used <br>Max: 0.03, 0.03, 0.155<br>Min: -0.03, -0.03, 0.09</p> |



Find a ready-to use (black) liquid .mi file [here](https://mega.nz/file/bYk2mTpB#MOFHj6P55WepBMiqtO1qJAbchkMEy7pROMLerGgKUS0).

