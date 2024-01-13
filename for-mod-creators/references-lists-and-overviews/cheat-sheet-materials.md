---
description: Various kinds of materials, and where to find them
---

# Cheat sheet: Materials

{% hint style="info" %}
&#x20;More information is on the following pages:&#x20;
{% endhint %}

#### Summary

Last documented update: 06. Jan 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page contains a brief overview of existing materials. Use the Table of Contents or your browser's search (Hotkey: `Ctrl+F`) to quickly find what you're looking for. Any links will lead you to additional context.

### Wait, this isn't what I'm looking for!

#### General information

* How it works in the abstract: [materials](../materials/ "mention")
* Re-using materials as templates: [re-using-materials-.mi.md](../files-and-what-they-do/re-using-materials-.mi.md "mention")
* How it works in the example: [3d-objects-.mesh-files](../files-and-what-they-do/3d-objects-.mesh-files/ "mention")

#### Multilayered

* General information: [multilayered](../materials/multilayered/ "mention")
* Properties and definition: [multilayered-material-properties.md](../materials/multilayered/multilayered-material-properties.md "mention")
* Preview images: [multilayered-previews.md](../materials/multilayered/multilayered-previews.md "mention")

#### Hands-on:

* [changing-materials-colors-and-textures.md](../modding-guides/items-equipment/editing-existing-items/changing-materials-colors-and-textures.md "mention") (guide)

***

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

## Decal materials

|                                                             |                                                                                                                                     |
| ----------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `base\materials\mesh_decal_gradientmap_recolor_emissive.mt` | no animations support. Supports recolouring (via color picker), emissive (EV) and gradientMaps as well as transparency via masking. |
| `base\materials\mesh_decal_emissive.mt`                     | animation support. Supports emissive (via EV), recolouring (numeric), and tiling.                                                   |

## Emissive Materials

See [here](../materials/#emissive-material) how it works and how to configure it.

| material                                                                                                    | description                                                                                                                                                        |
| ----------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `base\environment\decoration\furniture\kitchen\neokitsch_fridge\textures\mi_neokitsch_fridge_z_emissive.mi` | White emissive bright glow (from a fridge)                                                                                                                         |
| `base\materials\screen\screen_fluff_blue.mi`                                                                | blue/pinkish oscillating glow (from the collar of the jacket V wears in the trailer)                                                                               |
| `base\fx\shaders\neon_tubes.mt`                                                                             | A glowing shader with color parameter                                                                                                                              |
| `base\fx\shaders\signages.mt`                                                                               | The standard neon for advertising fonts in Night City. Comes in many colours, can be customized via textures and gradients. Check "city\_deco\_font" for examples. |
| `base\fx\shaders\hologram_two_sided.mt`                                                                     | half-transparent holo material, allows three colours to tint it                                                                                                    |

### Holo Shaders

| material                       | description                                                                                                   |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------- |
| `base\fx_shaders\holo_mask.mt` | Holo mask material (check [this mod](https://www.nexusmods.com/cyberpunk2077/mods/12170) to see it in action) |

### Blackbody Shaders

Blackbody shaders are used heat. Their colour can be adjusted via the `temperature` parameter.

| material                                         | description                             |
| ------------------------------------------------ | --------------------------------------- |
| `base\fx\shaders\metal_base_blackbody.mt`        |                                         |
| `base\fx\shaders\blackbodyradiation.mt`          |                                         |
| `base\fx_shaders\multilayer_blackbody_inject.mt` | A glowing shader with mlmask and -setup |
| `base\fx\shaders\blackbody_simple.mt`            |                                         |

## Glass

For more details on glass materials and instructions on how to configure them, see [here](../materials/#glass).&#x20;

<table><thead><tr><th width="344"></th><th></th></tr></thead><tbody><tr><td>Basic glass, with warping properties, simple tint as color, simple opacity</td><td><code>base\materials\glass_onesided.mt</code></td></tr><tr><td>Non-warping glass, destructible, tintable via colors</td><td><code>base\vehicles\common\materials\glass_windshield_tinted_black.mi</code></td></tr><tr><td>Device screen glass </td><td><code>base\fx\shaders\parallaxscreen.mt</code></td></tr></tbody></table>

### Gradient recolor

`base\environment\decoration\decals\mesh_decal_lines\textures\lines_plain_black.mi`

### Coloured Plastic

Use `engine\materials\metal_base.remt`, the example below has been copied from `base\environment\architecture\watson\japan_town\building\hotel\motel_notell\room\_plastic_black.mi`

<table><thead><tr><th width="232"></th><th></th></tr></thead><tbody><tr><td>BaseColor</td><td><code>base\materials\placeholder\white.xbm</code></td></tr><tr><td>Normal</td><td>optional: path to your normal map</td></tr><tr><td>Roughness</td><td>optional: path to your roughness map</td></tr><tr><td>RoughnessBias</td><td>0.200000003</td></tr><tr><td>BaseColorScale</td><td>Colour as x/y/z values (color picker blend file <a href="https://mega.nz/file/uE902LDQ#YmrHs0oAQBQqaFPjvYGazxI5s2LUlqzuNG14jU8Vgks">here</a></td></tr></tbody></table>

Use `base\materials\fillable_fluid_vertex.mt` or see [here ](../materials/#liquid)for details.
