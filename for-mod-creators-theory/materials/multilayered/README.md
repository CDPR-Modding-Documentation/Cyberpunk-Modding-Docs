---
description: 'Substance Designer 2077: How it works and why it''s actually super'
---

# Multilayered: Cyberpunk's supershader

## Why can't they use textures?

Everyone asks this question in the beginning, but you're only a single epiphany away from a change of mind. The multilayered shader can pack up to 20 layers of texture into a single file! Read on to find out how it works.

## About

A significant portion of assets for Cyberpunk 2077 leverage the complex multilayered.mt supershader. The supershader has several different component files which are used to create masks to blend procedural textures without baking them. You can read more about this technique in [this documentation](https://magazine.substance3d.com/cyberpunk-2077-a-world-full-of-substance/) by CDPR Technical Art Director Krzysztof Krzyścin.

{% hint style="info" %}
While the multilayered supershader is very common, there are hundreds of other non Substance-style shaders, some with traditional baked PBR textures.
{% endhint %}

{% hint style="success" %}
For a list of shader properties in multilayered.mt, see [multilayered-material-properties-1.md](../configuring-materials/multilayered-material-properties-1.md "mention")

This wiki contains multiple guides about editing multilayered materials, such as:

* For editing .mlmask files: [custom-multilayermasks.md](../../../modding-guides/textures-and-luts/custom-multilayermasks.md "mention")
* For editing .mlsetup files:&#x20;
  * [changing-materials-colors-and-textures.md](../../../for-mod-creators/modding-guides/items-equipment/editing-existing-items/changing-materials-colors-and-textures.md "mention") ->[#multilayered-material](../../../for-mod-creators/modding-guides/items-equipment/editing-existing-items/changing-materials-colors-and-textures.md#multilayered-material "mention")
  * [recolours-and-refits](../../../modding-guides/items-equipment/recolours-and-refits/ "mention") -> [r-and-r-colour-editing.md](../../../modding-guides/items-equipment/recolours-and-refits/r-and-r-colour-editing.md "mention")
{% endhint %}

## Composition

The multilayered shader is composed of three distinct parts:

1. **Layer Masks** | Mask textures that control where each surface is visible\
   [**.mlmask files**](./#what-is-the-mlmask)
2. **Layer Definitions** | Controls procedural effects such as tiling or color for each layer\
   [**.mlsetup files**](./#what-is-the-mlsetup)
3. **Layer Surfaces** | Links PBR textures to create numerous pre-defined visual surfaces\
   [**.mltemplate files**](./#what-is-the-mltemplate)

{% hint style="info" %}
For editing mlsetup files, you'll want to use the [MlSetupBuilder](../../modding-tools/mlsetup-builder/) ([download](https://github.com/Neurolinked/MlsetupBuilder))
{% endhint %}

## What is the mlmask?

**MLMASK** files are the core element of the substance-style integration. These files contain an array of up to 20 textures which are used to control the blending between pre-defined surfaces called **mltemplates**. These mask textures are more-or-less 1:1 with substance-style layer masks.

![Demonstration of how mlmask files are used to mask meshes. Each mask will apply to a separate material layer.](../../../.gitbook/assets/mlmask\_demo.gif)

As shown above, each mesh using the multilayer shader uses a unique **mlmask** file that is hand authored by CDPR artists. To take effect in game, each mask file is linked by the **mlsetup** file.

## What is the mlsetup?

**MLSETUP** files are fairly self-explanatory when considering the name, multilayer setup. These files correspond with an **mlmask** file and are responsible for setting up parameters for each layer from the mlmask. Each layer within an mlsetup contains information very similar to materials or shaders.

To edit .mlsetup files, it's recommended that you use the [mlsetup-builder](../../modding-tools/mlsetup-builder/ "mention") software.

{% hint style="info" %}
For a definition of the properties, see [multilayered-material-properties-1.md](../configuring-materials/multilayered-material-properties-1.md "mention").

For a guide on how to edit one, check [r-and-r-colour-editing.md](../../../modding-guides/items-equipment/recolours-and-refits/r-and-r-colour-editing.md "mention").
{% endhint %}

![File structure of mlsetup viewed with WolvenKit](<../../../.gitbook/assets/MLSETUP example.png>)

## What is the mltemplate?

**MLTEMPLATE** files are the _actual_ visible surfaces that appear on meshes using the **multilayered.mt** supershader. The multilayer templates include a wide variety of surfaces such as steel, iron, aluminum, plastic, nylon, linoleum, carpet, soil, grass, rubber, concreate, and everything else imaginable. Each template can use a unique color, normal, roughness, and metallic PBR texture. The mltemplate files are selected from within each layer definition of an **mlsetup** file. Meshes can blend up to 20 mltemplate surfaces into a single material by masking them with the **mlmask**.

![File structure of mltemplate viewed with WolvenKit](<../../../.gitbook/assets/MLTEMPLATE example.png>)

![A sample preview of some materials created by mltemplate files](<../../../.gitbook/assets/MLTEMPLATE previews.png>)

<figure><img src="../../../.gitbook/assets/multilayered_properties_roughness.png" alt=""><figcaption><p>An example how colour and roughness affect the material in-game</p></figcaption></figure>

## Technical Details

| Multilayered Shaders                                                             |
| -------------------------------------------------------------------------------- |
| engine\materials\multilayered.mt                                                 |
| base\materials\multilayered\_clear\_coat.mt  \|  Adds clearcoat effect           |
| base\materials\vehicle\_destr\_blendshape.mt  \|  Adds procedural vehicle damage |
| base\materials\cloth\_mov\_multilayered.mt                                       |
| base\materials\multilayered\_terrain.mt                                          |
| base\materials\ver\_mov\_multilayered.mt                                         |

### `multilayered`

<table><thead><tr><th width="192">Texture Channels</th><th width="139" align="center">Red</th><th width="134" align="center">Green</th><th width="146" align="center">Blue</th><th align="center">Alpha</th></tr></thead><tbody><tr><td>GlobalNormal</td><td align="center">Normal R</td><td align="center">Normal G</td><td align="center">?</td><td align="center">?</td></tr><tr><td>MaskAtlas</td><td align="center">?</td><td align="center">?</td><td align="center">?</td><td align="center">?</td></tr></tbody></table>

<table><thead><tr><th width="310">Name</th><th align="center">Description</th></tr></thead><tbody><tr><td>MultilayerMask</td><td align="center">See mlmask</td></tr><tr><td>MultilayerSetup</td><td align="center">See mlsetup</td></tr><tr><td>GlobalNormalIntensity</td><td align="center">Sets visual intensity of normal map texture</td></tr><tr><td>GlobalNormalUVScale</td><td align="center">?</td></tr><tr><td>GlobalNormalUVBias</td><td align="center">?</td></tr><tr><td>MaskAtlas</td><td align="center">?</td></tr><tr><td>MaskTiles</td><td align="center">?</td></tr><tr><td>Layers</td><td align="center">?</td></tr><tr><td>LayersStartIndex</td><td align="center">?</td></tr><tr><td>SurfaceTexAspectRatio</td><td align="center">Sets number of mlmask layers to be used</td></tr><tr><td>MaskToTileScale</td><td align="center">?</td></tr><tr><td>MaskTileSize</td><td align="center">?</td></tr><tr><td>MaskAtlasDims</td><td align="center">?</td></tr><tr><td>MaskBaseResolution</td><td align="center">?</td></tr><tr><td>SetupLayerMask</td><td align="center">?</td></tr><tr><td>NormalsTextureDDXYMultiplier</td><td align="center">?</td></tr><tr><td>MicroblendsTextureDDXYMultiplier</td><td align="center">?</td></tr></tbody></table>

##
