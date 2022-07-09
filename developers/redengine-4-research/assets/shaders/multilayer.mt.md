---
description: The substance style super shader
---

# Multilayered.mt

## About

A significant portion of assets for Cyberpunk 2077 leverage the complex multilayered.mt supershader. The supershader has several different component files which are used to create masks to blend procedural textures without baking them. You can read more about this technique in this documentation by CDPR Technical Art Director Krzysztof Krzyścin: [https://magazine.substance3d.com/cyberpunk-2077-a-world-full-of-substance/](https://magazine.substance3d.com/cyberpunk-2077-a-world-full-of-substance/)

{% hint style="info" %}
While the multilayered supershader is very common, there are hundreds of other non Substance-style shaders, some with traditional baked PBR textures.
{% endhint %}

## Composition

The multilayered shader is composed of three distinct parts:

1. **Layer Masks** | Mask textures that control where each surface is visible\
   \*\*\*\*[ **.mlmask files**](multilayer.mt.md#what-is-the-mlmask)\\
2. **Layer Definitions** | Controls procedural effects such as tiling or color for each layer\
   [**.mlsetup files**](multilayer.mt.md#what-is-the-mlsetup)\\
3. **Layer Surfaces** | Links PBR textures to create numerous pre-defined visual surfaces\
   [**.mltemplate files**](multilayer.mt.md#what-is-the-mltemplate)\*\*\*\*

## What is the mlmask?

**MLMASK** files are the core element of the substance-style integration. These files contain an array of up to 20 textures which are used to control the blending between pre-defined surfaces called **mltemplates**. These mask textures are more-or-less 1:1 with substance-style layer masks.

![Demonstration of how mlmask files are used to mask meshes. Each mask represents a separate surface.](../../../../.gitbook/assets/mlmask\_demo.gif)

As shown above, each mesh using the multilayer shader uses a unique **mlmask** file that is hand authored by CDPR artists. To take effect in game, each mask file is linked by the **mlsetup** file.

## What is the mlsetup?

**MLSETUP** files are fairly self-explanatory when considering the name, multilayer setup. These files correspond with an **mlmask** file and are responsible for setting up parameters for each layer from the mlmask. Each layer within an mlsetup contains information very similar to materials or shaders.

![File structure of mlsetup viewed with WolvenKit](<../../../../.gitbook/assets/MLSETUP example.png>)

### MLSETUP Definition

| Property                 |                                       Description                                       |
| ------------------------ | :-------------------------------------------------------------------------------------: |
| matTile                  |                      Tiling multiplier for the main surface texture                     |
| mbTile                   |                       Tiling multiplier for the microblend texture                      |
| microblend               |                                Procedural detail texture                                |
| microblendContrast       |                         Controls influence of microblend texture                        |
| microblendNormalStrength |                      Multiplier for adjusting normalblend strength                      |
| microblendOffsetU        |                           Shifts UV map for microblend texture                          |
| microblendOffsetV        |                           Shifts UV map for microblend texture                          |
| opacity                  |                                            ?                                            |
| offsetU                  |                                            ?                                            |
| offsetV                  |                                            ?                                            |
| material                 |            Path to [mltemplate](multilayer.mt.md#what-is-the-mltemplate) file           |
| colorScale               | Sets a color from within the [mltemplate](multilayer.mt.md#what-is-the-mltemplate) file |
| normalStrength           |                                            ?                                            |
| roughLevelsIn            |                                            ?                                            |
| roughLevelsOut           |                                            ?                                            |
| overrides                |                                            ?                                            |

## What is the mltemplate?

**MLTEMPLATE** files are the _actual_ visible surfaces that appear on meshes using the **multilayered.mt** supershader. The multilayer templates include a wide variety of surfaces such as steel, iron, aluminum, plastic, nylon, linoleum, carpet, soil, grass, rubber, concreate, and everything else imaginable. Each template can use a unique color, normal, roughness, and metallic PBR texture. The mltemplate files are selected from within each layer definition of an **mlsetup** file. Meshes can blend up to 20 mltemplate surfaces into a single material by masking them with the **mlmask**.

![File structure of mltemplate viewed with WolvenKit](<../../../../.gitbook/assets/MLTEMPLATE example.png>)

![A sample preview of some materials created by mltemplate files](<../../../../.gitbook/assets/MLTEMPLATE previews.png>)

## MT Definition

### `multilayered`

```
engine/materials/multilayered.mt
```

| **Texture Channels** | **Red** | **Green** | **Blue** | **Alpha** |
| -------------------- | :-----: | :-------: | :------: | :-------: |
| GlobalNormal         |    ?    |     ?     |     ?    |     ?     |
| MaskAtlas            |    ?    |     ?     |     ?    |     ?     |

| MultilayerMask        |                See mlmask               |
| --------------------- | :-------------------------------------: |
| MultilayerSetup       |               See mlsetup               |
| GlobalNormalIntensity |                    ?                    |
| GlobalNormalUVScale   |                    ?                    |
| GlobalNormalUVBias    |                    ?                    |
| EmissiveEV            |                    ?                    |
| CavityIntensity       |                    ?                    |
| DetailNormalInfluence |                    ?                    |
| MaskTiles             |                    ?                    |
| Layers                | Sets number of mlmask layers to be used |
| LayersStartIndex      |                    ?                    |
| SurfaceTexAspectRatio |                    ?                    |
| MaskToTileScale       |                    ?                    |
| MaskTileSize          |                    ?                    |
| MaskAtlasDims         |                    ?                    |
| MaskBaseResolution    |                    ?                    |
| SetupLayerMask        |                    ?                    |
