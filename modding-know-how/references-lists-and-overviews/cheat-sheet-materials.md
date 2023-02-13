---
description: Various kinds of materials, and where to find them
---

# Cheat sheet: Materials

{% hint style="info" %}
This page contains example materials that you can copy and change. If you don't know how to do that yet, check [here](../modding-cyberpunk-2077/materials-how-to-configure-them/).
{% endhint %}

## White MultilayerMask

You can find a mlmask with **three** white layers under the following path:

```
base\characters\cyberware\player\a0_005__strongarms\entities\meshes\textures\white.mlmask
```

{% hint style="info" %}
A white mlMask will apply the selected material to the whole surface of the mesh.
{% endhint %}

## Textured Material

|                                    |                                                                                                     |
| ---------------------------------- | --------------------------------------------------------------------------------------------------- |
| `engine\materials\metal_base.remt` | Cyberpunk's default textured (or emissive) material. Super versatile.                               |
| `base\materials\mesh_decal.mt`     | For decals etc., supports alpha channel. Can optionally be made half-transparent (for tattoos etc.) |
|                                    |                                                                                                     |

## Cyberspace Material

Works exactly like multilayered, but uses `base\characters\common\cyberspace\silverhand_overlay_cyberspace_mml.mi` instead.

## Metal Materials

|                                                                          |                                                                            |
| ------------------------------------------------------------------------ | -------------------------------------------------------------------------- |
| `base\characters\main_npc\hanako\t0_001_wa_body__hanako_dec_straps.mesh` | Gold: Hanako's heatsinks (only one entry in preloadLocalMaterialInstances) |
|                                                                          |                                                                            |

## Emissive Materials

See [here](../modding-cyberpunk-2077/materials-how-to-configure-them/#emissive-material) how it works and how to configure it.

| material                                                                                                    | description                                                                          |
| ----------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| `base\environment\decoration\furniture\kitchen\neokitsch_fridge\textures\mi_neokitsch_fridge_z_emissive.mi` | White emissive bright glow (from a fridge)                                           |
| `base\materials\screen\screen_fluff_blue.mi`                                                                | blue/pinkish oscillating glow (from the collar of the jacket V wears in the trailer) |
| `base\fx_shaders\multilayer_blackbody_inject.mt`                                                            | A glowing shader with mlmask and -setup                                              |
| `base\fx\shaders\neon_tubes.mt`                                                                             | A glowing shader with color parameter                                                |
