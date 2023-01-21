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

For textures, use `engine\materials\metal_base.remt`

## Metal Materials

|                                                                                |                                                                            |
| ------------------------------------------------------------------------------ | -------------------------------------------------------------------------- |
| base\characters\main\_npc\hanako\t0\_001\_wa\_body\_\_hanako\_dec\_straps.mesh | Gold: Hanako's heatsinks (only one entry in preloadLocalMaterialInstances) |
|                                                                                |                                                                            |

## Emissive Materials

See [here](../modding-cyberpunk-2077/materials-how-to-configure-them/#emissive-material) how it works and how to configure it.

| material                                                                                                       | description                                                                          |
| -------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| base\environment\decoration\furniture\kitchen\neokitsch\_fridge\textures\mi\_neokitsch\_fridge\_z\_emissive.mi | White emissive bright glow (from a fridge)                                           |
| base\materials\screen\screen\_fluff\_blue.mi                                                                   | blue/pinkish oscillating glow (from the collar of the jacket V wears in the trailer) |
|                                                                                                                |                                                                                      |
