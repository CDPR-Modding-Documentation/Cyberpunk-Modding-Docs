---
description: What kinds of textures exist, and what do they do?
---

# Textures

## Summary

**Published:** Mar 5 2023 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented edit:** Feb 21 2025 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page contains the **theory section** for textures in Cyberpunk. It will give you an overview about different kinds of texture, and what the game is using them for.

### Wait, this is not what I want!

* For the hands-on guide section, check [Modding Guides -> Textures and LUTs](../../../modding-guides/textures-and-luts/)
* If you just want to know how to import/export textures, see [here](../../../modding-guides/textures-and-luts/images-importing-editing-exporting.md).&#x20;
* For texture import settings and what they do, check the [WolvenKit](https://app.gitbook.com/o/-MP5ijqI11FeeX7c8-N8/s/-MP_ozZVx2gRZUPXkd4r/ "mention") -> [Import/Export: Textures](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export/textures "mention") -> [Texture Group](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export/textures#texture-group "mention")

## About textures

You can't use textures in Cyberpunk without first converting them to `.xbm`. To learn more about the reasons, check [textures-.xbm-files.md](../../files-and-what-they-do/materials/textures-.xbm-files.md "mention").

{% hint style="info" %}
By default, all textures in Cyberpunk2077 are Y-flipped (upside down). WolvenKit will take care of that for you during import/export via the `VFlip` property.
{% endhint %}

### Texture naming conventions

{% hint style="success" %}
If you stick to CDPR's naming convention, Wolvenkit can automatically pick the right import settings for you!
{% endhint %}

Across the game files, textures are clearly marked via **suffix**. If there are multiple textures with the same suffix, they will just be numbered.&#x20;

#### Example:

```bash
my_custom_item_d01.xbm            # diffuse/albedo 1
my_custom_item_d02.xbm            # diffuse/albedo 2
my_custom_item_n.xbm              # normal map
```

<table><thead><tr><th width="94">suffix(es)</th><th width="649">type of texture</th></tr></thead><tbody><tr><td>_d</td><td><a data-mention href="./#diffuse-albedo">#diffuse-albedo</a></td></tr><tr><td>_n</td><td><a data-mention href="./#normal">#normal</a></td></tr><tr><td>_m</td><td><a data-mention href="./#metalness">#metalness</a></td></tr><tr><td>_r</td><td><a data-mention href="./#roughness">#roughness</a></td></tr><tr><td>_rm</td><td><a data-mention href="./#combined-roughness-metalness">#combined-roughness-metalness</a></td></tr></tbody></table>

## Types of files

### Diffuse/Albedo

This texture is directly projected onto a mesh to give it colour and appearance. Used by shaders like `metal_base.remt`.

#### Naming convention:

In the game files, these files will be named `<name>_d.xbm` (e.g. `base\environment\decoration\food\packaged_food\textures\synthetic_snack_01_d.xbm`)

{% hint style="warning" %}
When importing a diffuse texture with a non-default file name, make sure to check the isGamma box in the import properties.
{% endhint %}

### Normal

Also known as "bump map", this texture is used to give a mesh depth and surface details. Used by shaders like `metal_base.remt`.

{% hint style="info" %}
For more technical details, see [normal-maps-in-cyberpunk.md](normal-maps-in-cyberpunk.md "mention")
{% endhint %}

#### Naming convention:

In the game files, these files will be named `<name>_n.xbm` (e.g. `base\environment\decoration\food\packaged_food\textures\synthetic_snack_01_n.xbm`)

{% hint style="info" %}
For a guide how to make your own normal maps, see [here](../../../modding-guides/textures-and-luts/self-made-normal-maps/).
{% endhint %}

### Roughness

Also known as "gloss map", this texture defines how light scatters across the surface of your 3d model. Used by shaders like `metal_base.remt`.

```
White => very rough
Black => very smooth
```

For an overview image, see [Roughness/Metalness overview](./#roughness-metalness-overview).

#### Naming convention:

In the game files, these files will be named `<name>_r.xbm` (e.g. `base\environment\decoration\food\packaged_food\textures\synthetic_snack_01_r.xbm`)

### Metalness

Also known as "metallic map", this texture defines which parts of the material behave like metal and which parts don't. Used by shaders like `metal_base.remt`.

```
White => metal
Black => not metal
```

For an overview image, see [Roughness/Metalness overview](./#roughness-metalness-overview).

#### Naming convention:

In the game files, these files will be named `<name>_m.xbm` (e.g. `base\envment\decoration\food\packaged_food\textures\synthetic_snack_01_m.xbm`)

### Combined Roughness/Metalness

Some shaders use a combi-texture for roughness and metalness.&#x20;

{% hint style="info" %}
Since by default, roughness and metalness are inverted (white in one is black in the other), you can only use this for shaders that expect such a texture.
{% endhint %}

#### Naming convention:

In the game files, these files will be named my\_texture\_rm`.xbm`

### Atlas

Used for in-game items and UI elements, these textures contain a collection of images. They are made available to the game via [**inkatlas**](../../files-and-what-they-do/file-formats/game-icons-the-inkatlas-file.md) files.

#### Naming convention:

In the game files, these files will be named `atlas_<name>.xbm` (e.g. `base\gameplay\gui\fullscreen\hacking_minigame\atlas_minigame_programs.xbm`)





## Additional intel

### Roughness/Metalness overview

<figure><img src="https://3dcoat.com/forum/uploads/monthly_2017_11/3DC_PBR.thumb.jpg.e5e6dfadbb34dfc4e806871be9fb203c.jpg" alt=""><figcaption><p>via <a href="https://3dcoat.com/forum/index.php?/topic/21601-3dc-roughness-metalness-visual-aid/">https://3dcoat.com/forum/index.php?/topic/21601-3dc-roughness-metalness-visual-aid/</a></p></figcaption></figure>
