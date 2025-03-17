---
description: Properties of textured (PBR) materials
---

# Textured (PBR) material properties

## Summary

**Created:** Jan 14 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** Feb 20 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page documents textured (PBR) shaders and their properties.&#x20;

* For an **overview** of PBR shaders, see [cheat-sheet-materials.md](../../references-lists-and-overviews/cheat-sheet-materials.md "mention")-> [#textured-materials](../../references-lists-and-overviews/cheat-sheet-materials.md#textured-materials "mention")
* For an **explanation** of material properties and further links, see [.](./ "mention")

The most commonly used material for anything textured is `engine\materials\metal_base.remt`. Despite its name, this material isn't necessarily metallic.

{% hint style="info" %}
To use this material as **emissive** (light), check [emissive-material-properties.md](emissive-material-properties.md "mention")&#x20;

You can change the colour of a texture on-the-fly by using the `BaseColor` property  (color picker blend file [here](https://mega.nz/file/uE902LDQ#YmrHs0oAQBQqaFPjvYGazxI5s2LUlqzuNG14jU8Vgks))
{% endhint %}

The material can be transparent by setting `enableMask` to `True` (and make sure its not overriden in the [material chain](../shaders/#the-daisy-chain)). When set, the material will use the `alpha` channel of the BaseColor.&#x20;

To make your mesh load a texture, use the following `CKeyValuePair`s in your material's "values" array:

<table><thead><tr><th width="208"></th><th></th></tr></thead><tbody><tr><td>BaseColor</td><td>path to your texture.xbm (Diffuse/Albedo)</td></tr><tr><td>Roughness</td><td>path to your roughnessMap.xbm (if you have one)</td></tr><tr><td>Metalness</td><td>path to your metalnessMap.xbm (if you have one)</td></tr><tr><td>Normal</td><td>path to your normalMap.xbm (<a href="../../../modding-guides/textures-and-luts/self-made-normal-maps/">if you have one</a>)</td></tr></tbody></table>

<figure><img src="../../../.gitbook/assets/textured material example.png" alt=""><figcaption><p>example use of metal_base.remt as a textured material</p></figcaption></figure>

{% hint style="info" %}
The .xbm is a container around the texture. Export the xbm to png via WolvenKit.
{% endhint %}

{% hint style="warning" %}
If your texture has any brightness issues in-game, toggle around the isGamma flag during import.

For the expected `transparency` settings, check [WolvenKit](https://app.gitbook.com/o/-MP5ijqI11FeeX7c8-N8/s/-MP_ozZVx2gRZUPXkd4r/ "mention") -> [Import/Export: Textures](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export/textures "mention") -> [Texture Group](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export/textures#texture-group "mention")
{% endhint %}

## Plastic

The most commonly used material for anything textured is `engine\materials\metal_base.remt`. Despite its name, this material isn't necessarily metallic.

To turn the material into plastic, use the following `CKeyValuePair`s in your material's "values" array:

<table><thead><tr><th width="232"></th><th></th></tr></thead><tbody><tr><td>BaseColor</td><td><code>base\materials\placeholder\white.xbm</code></td></tr><tr><td>Normal</td><td>optional: path to your normal map</td></tr><tr><td>Roughness</td><td>optional: path to your roughness map</td></tr><tr><td>RoughnessBias</td><td>0.200000003</td></tr><tr><td>BaseColorScale</td><td>Colour as x/y/z values (color picker blend file <a href="https://mega.nz/file/uE902LDQ#YmrHs0oAQBQqaFPjvYGazxI5s2LUlqzuNG14jU8Vgks">here</a>)</td></tr></tbody></table>

You can find a ready-to-download template [here](https://mega.nz/file/nElTyD6Z#LU5kYrd42ikOvWdWSVu51e0Brg0E-YqymCp5AgQdaLY).

### Further properties

|           |                                                                         |
| --------- | ----------------------------------------------------------------------- |
| LayerTile | <p>Material scaling (zoom on surface)<br>> 1 zooms in, >1 zooms out</p> |
