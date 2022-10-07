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
   [**.mlmask files**](multilayer.mt.md#what-is-the-mlmask)
2. **Layer Definitions** | Controls procedural effects such as tiling or color for each layer\
   [**.mlsetup files**](multilayer.mt.md#what-is-the-mlsetup)
3. **Layer Surfaces** | Links PBR textures to create numerous pre-defined visual surfaces\
   [**.mltemplate files**](multilayer.mt.md#what-is-the-mltemplate)

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

### MT Definition

`multilayered`

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

## Where are the multilayered files?

Thank you @86maylin#6375 on Discord for this answer! [Check out his answer](https://discordapp.com/channels/717692382849663036/1021886502709493881/1022477944842629121) for an example on jacket\_04 asset.

**In this example** I'm wanting to change the shade of blue on the man version of _Light XX Punch! Heat-Resistant Biker Turtleneck_, so I need to find its layer files.

<mark style="background-color:yellow;">**F**</mark>irst head over to [fandom](https://cyberpunk.fandom.com/wiki/Cyberpunk\_2077\_Clothing) and find the BaseID for the turtleneck. I don't know of a mod that will get this information in-game, but that would be amazing if one is ever made. The fandom site has images that match the images in the game, so it's a pretty quick way to find things.

![](<../../../../.gitbook/assets/image (7).png>)

<mark style="background-color:yellow;">**I**</mark>n Wolvenkit's Asset Browser search for the "base" portion of the turtleneck's BaseID. For Shirt\_02\_rich\_01, the base portion is Shirt\_02.

{% hint style="info" %}
Wolvenkit does recursive searching in the Asset Browser that is based on the folder you have selected in the Asset Browser. To reduce clutter in your search results, try selecting a folder relatively deep in the folder structure. For example, for player clothes select _base\characters\appearances\player\items_.
{% endhint %}

![](<../../../../.gitbook/assets/image (15).png>)

<mark style="background-color:yellow;">**L**</mark>ook at the file names in the results listing for an \*.ent file with a name that best fits the asset you're looking for. In this case, the asset is a long sleeved turtleneck and the most similar file name that matches the description is t1\_shirt\_02.ent.

<mark style="background-color:yellow;">**R**</mark>ight click the t1\_shirt\_02.ent file and select Open without adding to the project. In the file viewer, select the Entity Preview tab and make sure the asset looks like the Light XX Punch! Heat-Resistant Biker Turtleneck.

![](<../../../../.gitbook/assets/image (1).png>)

<mark style="background-color:yellow;">**B**</mark>ack in the Asset Browser, search again for t1\_shirt\_02 but look for the app (appearance) file instead. For easier results, search for t1\_shirt\_02.app. Right click the app file and open it without adding it to the project.&#x20;

![](<../../../../.gitbook/assets/image (20).png>)

<mark style="background-color:yellow;">**E**</mark>xpand the appearances definition and notice that the appearance's name is listed on the right side of the list. Scroll through the appearances list and find one with a name that matches the "specific" portion of the turtleneck's BaseID. For Shirt\_02\_rich\_01, the specific portion is rich\_01. I am looking for the man version of that appearance, so I need to find one ending in _m_ or _ma_ (man average).

![](<../../../../.gitbook/assets/image (3).png>)

<mark style="background-color:yellow;">**E**</mark>xpand appearance 25, then expand the components definitions, and for this asset there was only one mesh component. The meshAppearance value should correctly describe the asset we're looking for, in this case it correctly describes a blue and white shirt. At the end of the mesh value click the blue-arrowed icon to open the mesh in a new tab.

![](<../../../../.gitbook/assets/image (21).png>)

<mark style="background-color:yellow;">**E**</mark>xpand the mesh's appearances list and find the appearance that matches the meshAppearance from the previous step. Expand the appearance's chunkMaterials definition and take note of any material that may hold the information we're wanting to use.

![](<../../../../.gitbook/assets/image (14).png>)

<mark style="background-color:yellow;">**C**</mark>lose the appearances list, then scroll down and expand the localMaterialBuffer definition and then the materials definition. Take notice how the material's names are displayed on the right. At the bottom of the list is material 25 for the blue\_white material.

![](<../../../../.gitbook/assets/image (17).png>)

<mark style="background-color:yellow;">**E**</mark>xpand the material 22  and then expand values to find the multilayered files. That's it! Too easy right?

![](<../../../../.gitbook/assets/image (22).png>)
