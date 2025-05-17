---
description: Animated materials and their properties
---

# FX Material Properties

For a list of effect materials, check [cheat-sheet-materials.md](../../references-lists-and-overviews/cheat-sheet-materials.md "mention") -> [#fx-shaders](../../references-lists-and-overviews/cheat-sheet-materials.md#fx-shaders "mention")

## metal\_base\_glitter

This shader glimmers

`base\fx\_shaders\metal_base_glitter.mt`

<table><thead><tr><th width="208"></th><th></th></tr></thead><tbody><tr><td>BaseColor</td><td>path to your texture.xbm (Diffuse/Albedo)</td></tr><tr><td>BaseColorScale</td><td>an RGB color value</td></tr><tr><td>Roughness</td><td>path to your roughnessMap.xbm (if you have one)</td></tr><tr><td>Metalness</td><td>path to your metalnessMap.xbm (if you have one)</td></tr><tr><td>Normal</td><td>path to your normalMap.xbm (<a href="../../../modding-guides/textures-and-luts/self-made-normal-maps/">if you have one</a>)</td></tr></tbody></table>

{% embed url="https://i.imgur.com/SdgQ6c8.mp4" %}

## holo\_mask

`base\fx\_shaders\holo_mask.mt`

### hologram

`base\fx\_shaders\hologram.mt`

Holo material ([example .mi](../../../_example_mods_and_templates/material_templates/holo/hologram_material_template.mi))

## oda\_helm

`base\fx_shaders\oda_helm.mt`

## Silverhand Overlay

`base\materials\silverhand_overlay.mt`

To give your mesh a silverhand's arm holographic glitch effect you can use the `silverhand_overlay.mt` file. It uses a mlmask, mlsetup and is an emissive.

In game example for its usage can be located in the overlay\_arm material in the mesh: `base\characters\common\player_base_bodies\player_man_average\special\a0_001_pma_cyber__silverhand_overlay.mesh`

Decal submeshes will not project onto a mesh with silverhand\_overlay applied to it.

## Lighting

You can find a mesh-as-effect as component inside `base\characters\cyberware\player\a0_003__mantisblade\appearances\a0_003_wa__mantisblades_edge.app`
