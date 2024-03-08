---
description: Various kinds of materials, and where to find them
---

# Cheat sheet: Materials

#### Summary

Last documented update: 06. Jan 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page contains a brief overview of existing materials. Use the Table of Contents or your browser's search (Hotkey: `Ctrl+F`) to quickly find what you're looking for. Any links will lead you to additional context.

{% hint style="success" %}
&#x20;More and detailed information can be found under [configuring-materials](../materials/configuring-materials/ "mention") and its nested pages!
{% endhint %}

### Wait, this isn't what I'm looking for!

#### General information

* How it works in the abstract: [materials](../materials/ "mention")
* Re-using materials as templates: [re-using-materials-.mi.md](../files-and-what-they-do/re-using-materials-.mi.md "mention")
* How it works in the example: [3d-objects-.mesh-files](../files-and-what-they-do/3d-objects-.mesh-files/ "mention")

#### Multilayered

* General information: [multilayered](../materials/multilayered/ "mention")
* Properties and definition: [multilayered-material-properties-1.md](../materials/configuring-materials/multilayered-material-properties-1.md "mention")
* Preview images: [multilayered-previews.md](../materials/multilayered/multilayered-previews.md "mention")

#### Hands-on:

* [changing-materials-colors-and-textures.md](../modding-guides/items-equipment/editing-existing-items/changing-materials-colors-and-textures.md "mention") (guide)

***

## Simple / Basic materials

### PBR material

The default PBR material used in Cyberpunk 2077 is `metal_base.remt`

If this overfulfills your needs, you can also try out `engine\materials\pbr_simple.mt`\
, which has only color (RGB), Roughness, and Metalness.

### White MultilayerMask

You can find a mlmask with **three** white layers under the following path:

```
base\characters\cyberware\player\a0_005__strongarms\entities\meshes\textures\white.mlmask
```

{% hint style="info" %}
A white mlMask will apply the selected material to the whole surface of the mesh.
{% endhint %}

## Textured Materials

For further details, see [textured-material-properties.md](../materials/configuring-materials/textured-material-properties.md "mention")

|                                                             |                                                                                                                                |
| ----------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `engine\materials\metal_base.remt`                          | Cyberpunk's default textured (or emissive) material. Super versatile, supports glow and transparency                           |
| `base\materials\mesh_decal.mt`                              | For decals etc., supports alpha channel. Can optionally be made half-transparent (for tattoos etc.)                            |
| `base\fx\_shaders\holo_mask.mt`                             | Special effect material that transforms a mesh into an hologram. Can use a custom texture for decal and is color controllable. |
| `base\surfaces\atlases\wood\wood_bare\wood_bare_01_pine.mi` | Basic wood texture, no masks                                                                                                   |

### Plastic (solid, coloured)

Use `engine\materials\metal_base.remt`, the example below has been copied from `base\environment\architecture\watson\japan_town\building\hotel\motel_notell\room\_plastic_black.mi`

<table><thead><tr><th width="232"></th><th></th></tr></thead><tbody><tr><td>BaseColor</td><td><code>base\materials\placeholder\white.xbm</code></td></tr><tr><td>Normal</td><td>optional: path to your normal map</td></tr><tr><td>Roughness</td><td>optional: path to your roughness map</td></tr><tr><td>RoughnessBias</td><td>0.200000003</td></tr><tr><td>BaseColorScale</td><td>Colour as x/y/z values (color picker blend file <a href="https://mega.nz/file/uE902LDQ#YmrHs0oAQBQqaFPjvYGazxI5s2LUlqzuNG14jU8Vgks">here</a>)</td></tr></tbody></table>

### Gradient recolor

`base\environment\decoration\decals\mesh_decal_lines\textures\lines_plain_black.mi`

## Cyberspace Materials

{% hint style="info" %}
[Search the asset browser](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files) for `cyberspace|blackwall > .mt|.remt`, then right-click the file and select [Find files using this](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/asset-browser#find-files-using-this "mention")to find files using this kind of shader.
{% endhint %}

|                                                                          |                                                                                                                                                                                               |
| ------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `base\characters\common\cyberspace\silverhand_overlay_cyberspace_mml.mi` | A multilayered material for cyberspace appearances. You can use this as base material to get the Johnny effect.                                                                               |
| `base\fx_shaders\blackwall_blendable_metal_base.mt`                      | [metal\_base](cheat-sheet-materials.md#textured-materials), but with that fancy blackwall effect that we all know and love. There are blackwall variants of most shaders, check the hint box. |



### Metal Materials

|                                                                            |                                 |
| -------------------------------------------------------------------------- | ------------------------------- |
| `base\environment\decoration\containers\cases\coffin\textures\m_z_gold.mi` | a shiny gold (metal\_base.remt) |

## Decal materials

{% hint style="info" %}
[Search the asset browser](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files) for `decal > .mt`, then right-click the file and select [Find files using this](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/asset-browser#find-files-using-this "mention")to find files using this kind of shader.
{% endhint %}

|                                                             |                                                                                                                                                                                             |
| ----------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `base\materials\mesh_decal_gradientmap_recolor_emissive.mt` | no animation support. Supports recolouring (via color picker), emissive (EV) and gradientMaps as well as transparency via masking.                                                          |
| `base\materials\mesh_decal_emissive.mt`                     | animation support. Supports emissive (via EV), recolouring (numeric), and tiling.                                                                                                           |
| `base\materials\decal_tintable.mt`                          | no animation support, no emissive, but Diffuse, Normal, Roughness and Metalness, and allows different color assignments for R, G and B channels of `TintMaskTexture`. Not used by anything. |
| `base\materials\mesh_decal_multitinted.mt`                  | unfortunately not used by anything, but supports up to 10 tints! If anyone finds out how the `TintMaskTexture` needs to look, please document!                                              |

## Emissive Materials

{% hint style="info" %}
[Search the asset browser](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files) for `emissive > .mt|.remt`, then right-click the file and select [Find files using this](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/asset-browser#find-files-using-this "mention")to find files using this kind of shader.
{% endhint %}

See [emissive-material-properties.md](../materials/configuring-materials/emissive-material-properties.md "mention")for how it works and how to configure it.

| material                                                                                                    | description                                                                                                                                                        |
| ----------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `base\environment\decoration\furniture\kitchen\neokitsch_fridge\textures\mi_neokitsch_fridge_z_emissive.mi` | White emissive bright glow (from a fridge)                                                                                                                         |
| `base\materials\screen\screen_fluff_blue.mi`                                                                | blue/pinkish oscillating glow (from the collar of the jacket V wears in the trailer)                                                                               |
| `base\fx\shaders\neon_tubes.mt`                                                                             | A glowing shader with color parameter                                                                                                                              |
| `base\fx\shaders\signages.mt`                                                                               | The standard neon for advertising fonts in Night City. Comes in many colours, can be customized via textures and gradients. Check "city\_deco\_font" for examples. |
| `base\fx\shaders\hologram_two_sided.mt`                                                                     | half-transparent holo material, allows three colours to tint it                                                                                                    |
| `base\vehicles\standard\v_standard3_militech_hellhound\entities\meshes\textures\max_tac_stripe_01.mi`       | Use it with any texture for a cool rotating glow shader (it's fun)                                                                                                 |
| `base/fx/shaders/device_diode.mt`                                                                           | A glowing shader with RGB color attribute and up to three glowing shades                                                                                           |

### Holo Shaders

| material                        | description                                                                                                                   |
| ------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `base\fx\_shaders\hologram.mt`  | Holo material ([example .mi](../../\_example\_mods\_and\_templates/material\_templates/holo/hologram\_material\_template.mi)) |
| `base\fx\_shaders\holo_mask.mt` | Special effect material that transforms a mesh into a hologram. Can use a custom texture for decal and is color controllable. |

### Blackbody Shaders

{% hint style="info" %}
[Search the asset browser](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files) for `blackbody > .mt|.remt`, then right-click the file and select [Find files using this](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/asset-browser#find-files-using-this "mention")to find files using this kind of shader.
{% endhint %}

Blackbody shaders are used for **heat**. Their colour can be adjusted via the `temperature` parameter.

| material                                         | description                                                                                                       |
| ------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------- |
| `base\fx\shaders\metal_base_blackbody.mt`        | A PBR temperature shader for numeric values, can be used in e.g glowing coal (find files using this for examples) |
| `base\fx\shaders\blackbodyradiation.mt`          | A temperature shader with smoke effects                                                                           |
| `base\fx_shaders\multilayer_blackbody_inject.mt` | A temperature shader with mlmask and -setup                                                                       |
| `base\fx\shaders\blackbody_simple.mt`            | A temperature shader with a texture and a numeric temperature value                                               |

### FX Shaders

{% hint style="info" %}
[Search the asset browser](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files) for `fx > .mt|.remt`, then right-click the file and select [Find files using this](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/asset-browser#find-files-using-this "mention")to find files using this kind of shader.
{% endhint %}

FX shaders are animated effect shaders.

| material                                  | description                                                                                                                  |
| ----------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `base\fx\shaders\metal_base_glitter.mt`   | A PBR temperature shader. Configured with numeric values.                                                                    |
| `base\fx\shaders\metal_base_blackbody.mt` | A blackbody shader for e.g. glowing coal. Copy from `base\environment\decoration\misc\foliage\burnt_wood\burnt_wood_ab.mesh` |

Something else to dig into: `emitters/particleDrawer/meshes`

## Transparent

### Glass

{% hint style="info" %}
[Search the asset browser](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files) for `glass > .mt|.remt`, then right-click the file and select [Find files using this](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/asset-browser#find-files-using-this "mention")to find files using this kind of shader.
{% endhint %}

For more details on glass materials and instructions on how to configure them, see [here](../materials/#glass).&#x20;

<table><thead><tr><th width="344"></th><th></th></tr></thead><tbody><tr><td>Basic glass, with warping properties, simple tint as color, simple opacity</td><td><code>base\materials\glass_onesided.mt</code></td></tr><tr><td>Non-warping glass, destructible, tintable via colors</td><td><code>base\vehicles\common\materials\glass_windshield_tinted_black.mi</code></td></tr><tr><td>Device screen glass </td><td><code>base\fx\shaders\parallaxscreen.mt</code></td></tr></tbody></table>

### Plastic (see-through)

For a full documentation of this material, check [glass-material-properties.md](../materials/configuring-materials/glass-material-properties.md "mention") -> [#transparent-plastic](../materials/configuring-materials/glass-material-properties.md#transparent-plastic "mention")

<table><thead><tr><th width="344"></th><th></th></tr></thead><tbody><tr><td>base\materials\glass_onesided.mt</td><td>take from Hanako's dress, <code>localMaterialBuffer.materials.transparent</code> <code>base\characters\main_npc\hanako\t1_001_wa_dress__hanako.mesh</code></td></tr></tbody></table>

### See-through cloth

For a full documentation of this material, check [glass-material-properties.md](../materials/configuring-materials/glass-material-properties.md "mention") -> [#see-through-cloth](../materials/configuring-materials/glass-material-properties.md#see-through-cloth "mention")

<table><thead><tr><th width="344"></th><th></th></tr></thead><tbody><tr><td>base\materials\glass_onesided.mt</td><td>take from mana's <a href="https://www.nexusmods.com/cyberpunk2077/mods/13447">Barong Tagalog</a> mod,  <code>manavortex\clothing\torso\barong_tagalog\meshes\pma__barong__base_body.mesh</code> or <a href="../../_example_mods_and_templates/material_templates/transparent/transparent_cloth.mi">download the .mi file</a></td></tr></tbody></table>

## Liquid materials

Use `base\materials\fillable_fluid_vertex.mt` to fill vessels, or see [here ](../materials/#liquid)for details.

## Other materials

Cyberpunk 2077 uses materials cleverly, and often you can save a lot of work by simply re-using something CDPR has already defined

### Zipper

You can find a ready-to-use zipper material by copying `dec_zipper` from `base\characters\garment\player_equipment\torso\t1_057_tankbra\t1_057_pwa_tankbra.mesh`

### Stitches

Find a ready-to use stitches material by copying `dec_stitches` from `base\characters\garment\player_equipment\torso\t1_057_tankbra\t1_057_pwa_tankbra.mesh`

This material uses `metal_base.remt` and can be recoloured via `BaseColorScale` attribute (color picker blend file [here](https://mega.nz/file/uE902LDQ#YmrHs0oAQBQqaFPjvYGazxI5s2LUlqzuNG14jU8Vgks))
