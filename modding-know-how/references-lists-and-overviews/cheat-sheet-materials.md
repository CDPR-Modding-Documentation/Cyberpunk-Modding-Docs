---
description: Various kinds of materials, and where to find them
---

# Cheat sheet: Materials

{% hint style="info" %}
This page contains a brief overview of existing materials. **For a more in-depth explanation as well as downloadable example files, check** [**this page**](../materials/)**.**



If you don't know how to edit material properties, check [here](../materials/).
{% endhint %}

## Simple / Basic materials

### PBR material

You can find a material with Color (RGB), Roughness and Metalness under&#x20;

```
engine\materials\pbr_simple.mt
```

### White MultilayerMask

You can find a mlmask with **three** white layers under the following path:

```
base\characters\cyberware\player\a0_005__strongarms\entities\meshes\textures\white.mlmask
```

{% hint style="info" %}
A white mlMask will apply the selected material to the whole surface of the mesh.
{% endhint %}

## Textured Materials

For further details, see [here](../materials/#textured-material).

|                                                             |                                                                                                                                |
| ----------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `engine\materials\metal_base.remt`                          | Cyberpunk's default textured (or emissive) material. Super versatile.                                                          |
| `base\materials\mesh_decal.mt`                              | For decals etc., supports alpha channel. Can optionally be made half-transparent (for tattoos etc.)                            |
| `base\fx_shaders\holo_mask.mt`                              | Special effect material that transforms a mesh into an hologram. Can use a custom texture for decal and is color controllable. |
| `base\surfaces\atlases\wood\wood_bare\wood_bare_01_pine.mi` | Basic wood texture, no masks                                                                                                   |

## Cyberspace Material

Works exactly like multilayered, but uses `base\characters\common\cyberspace\silverhand_overlay_cyberspace_mml.mi` instead.

## Metal Materials

|                                                                            |                                 |
| -------------------------------------------------------------------------- | ------------------------------- |
| `base\environment\decoration\containers\cases\coffin\textures\m_z_gold.mi` | a shiny gold (metal\_base.remt) |

## Emissive Materials

See [here](../materials/#emissive-material) how it works and how to configure it.

| material                                                                                                    | description                                                                                                                                                        |
| ----------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `base\environment\decoration\furniture\kitchen\neokitsch_fridge\textures\mi_neokitsch_fridge_z_emissive.mi` | White emissive bright glow (from a fridge)                                                                                                                         |
| `base\materials\screen\screen_fluff_blue.mi`                                                                | blue/pinkish oscillating glow (from the collar of the jacket V wears in the trailer)                                                                               |
| `base\fx_shaders\multilayer_blackbody_inject.mt`                                                            | A glowing shader with mlmask and -setup                                                                                                                            |
| `base\fx\shaders\neon_tubes.mt`                                                                             | A glowing shader with color parameter                                                                                                                              |
| base\fx\shaders\signages.mt                                                                                 | The standard neon for advertising fonts in Night City. Comes in many colours, can be customized via textures and gradients. Check "city\_deco\_font" for examples. |
| base\fx\shaders\hologram\_two\_sided.mt                                                                     | half-transparent holo material, allows three colours to tint it                                                                                                    |

## Glass

For more details on glass materials and instructions on how to configure them, see [here](../materials/#glass).&#x20;

<table><thead><tr><th width="344"></th><th></th></tr></thead><tbody><tr><td>Basic glass, with warping properties, simple tint as color, simple opacity</td><td><code>base\materials\glass_onesided.mt</code></td></tr><tr><td>Non-warping glass, destructible, tintable via colors</td><td><code>base\vehicles\common\materials\glass_windshield_tinted_black.mi</code></td></tr><tr><td>Device screen glass </td><td><code>base\fx\shaders\parallaxscreen.mt</code></td></tr></tbody></table>

### Gradient recolor

`base\environment\decoration\decals\mesh_decal_lines\textures\lines_plain_black.mi`

### Coloured Plastic

Use `engine\materials\metal_base.remt`, the example below has been copied from `base\environment\architecture\watson\japan_town\building\hotel\motel_notell\room\_plastic_black.mi`

<table><thead><tr><th width="232"></th><th></th></tr></thead><tbody><tr><td>BaseColor</td><td><code>base\materials\placeholder\white.xbm</code></td></tr><tr><td>Normal</td><td>optional: path to your normal map</td></tr><tr><td>Roughness</td><td>optional: path to your roughness map</td></tr><tr><td>RoughnessBias</td><td>0.200000003</td></tr><tr><td>BaseColorScale</td><td>Colour as x/y/z values (color picker blend file <a href="https://mega.nz/file/uE902LDQ#YmrHs0oAQBQqaFPjvYGazxI5s2LUlqzuNG14jU8Vgks">here</a>)</td></tr></tbody></table>

## Liquid

Use `base\materials\fillable_fluid_vertex.mt` or see [here ](../materials/#liquid)for details.
