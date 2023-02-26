---
description: Various kinds of materials, and where to find them
---

# Cheat sheet: Materials

{% hint style="info" %}
This page contains example materials that you can copy and change. If you don't know how to do that yet, check [here](../modding-cyberpunk-2077/materials-how-to-configure-them/).
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

## Textured Material

|                                                             |                                                                                                                                |
| ----------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `engine\materials\metal_base.remt`                          | Cyberpunk's default textured (or emissive) material. Super versatile.                                                          |
| `base\materials\mesh_decal.mt`                              | For decals etc., supports alpha channel. Can optionally be made half-transparent (for tattoos etc.)                            |
| `base\fx_shaders\holo_mask.mt`                              | Special effect material that transforms a mesh into an hologram. Can use a custom texture for decal and is color controllable. |
| `base\surfaces\atlases\wood\wood_bare\wood_bare_01_pine.mi` | Basic wood texture, no masks                                                                                                   |

## Cyberspace Material

Works exactly like multilayered, but uses `base\characters\common\cyberspace\silverhand_overlay_cyberspace_mml.mi` instead.

## Metal Materials

|                                                                            |                                                                            |
| -------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| `base\characters\main_npc\hanako\t0_001_wa_body__hanako_dec_straps.mesh`   | Gold: Hanako's heatsinks (only one entry in preloadLocalMaterialInstances) |
| `base\environment\decoration\containers\cases\coffin\textures\m_z_gold.mi` | a shiny gold                                                               |

## Emissive Materials

See [here](../modding-cyberpunk-2077/materials-how-to-configure-them/#emissive-material) how it works and how to configure it.

| material                                                                                                    | description                                                                                                                                                        |
| ----------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `base\environment\decoration\furniture\kitchen\neokitsch_fridge\textures\mi_neokitsch_fridge_z_emissive.mi` | White emissive bright glow (from a fridge)                                                                                                                         |
| `base\materials\screen\screen_fluff_blue.mi`                                                                | blue/pinkish oscillating glow (from the collar of the jacket V wears in the trailer)                                                                               |
| `base\fx_shaders\multilayer_blackbody_inject.mt`                                                            | A glowing shader with mlmask and -setup                                                                                                                            |
| `base\fx\shaders\neon_tubes.mt`                                                                             | A glowing shader with color parameter                                                                                                                              |
| base\fx\shaders\signages.mt                                                                                 | The standard neon for advertising fonts in Night City. Comes in many colours, can be customized via textures and gradients. Check "city\_deco\_font" for examples. |

## Other

### Glass

half-transparent black: `base\environment\decoration\electronics\devices\device_neokitsch\textures\device_neokitsch_glass_black.mi`

### Recolour/tint

|                        |                                                                                                               |
| ---------------------- | ------------------------------------------------------------------------------------------------------------- |
| half-transparent glass | base\environment\decoration\electronics\devices\device\_neokitsch\textures\device\_neokitsch\_glass\_black.mi |
| gradient               | base\environment\decoration\decals\mesh\_decal\_lines\textures\lines\_plain\_black.mi                         |
| plastic                | see "[coloured plastic](cheat-sheet-materials.md#coloured-plastic)" below                                     |

#### Coloured Plastic

Use `engine\materials\metal_base.remt`, the example below has been copied from `base\environment\architecture\watson\japan_town\building\hotel\motel_notell\room_plastic_black.mi`

|                |                                                                                                                                    |
| -------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| BaseColor      | `base\materials\placeholder\white.xbm`                                                                                             |
| Normal         | optional: path to your normal map                                                                                                  |
| Roughness      | optional: path to your roughness map                                                                                               |
| RoughnessBias  | 0.200000003                                                                                                                        |
| BaseColorScale | Colour as x/y/z values (color picker blend file [here](https://mega.nz/file/uE902LDQ#YmrHs0oAQBQqaFPjvYGazxI5s2LUlqzuNG14jU8Vgks)) |
