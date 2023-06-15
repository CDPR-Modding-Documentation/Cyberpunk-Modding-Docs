---
description: What kinds of textures exist, and what do they do?
---

# 🖼 Textures

This page aims to give an overview on different kinds of textures and what the game is using them for.&#x20;

{% hint style="info" %}
By default, all textures in Cyberpunk2077 are Y-flipped (upside down). WolvenKit will take care of that for you during import/export via the `VFlip` property.
{% endhint %}

If you just want to know how to import/export textures, see [here](images-importing-editing-exporting.md).&#x20;

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

#### Naming convention:

In the game files, these files will be named `<name>_n.xbm` (e.g. `base\environment\decoration\food\packaged_food\textures\synthetic_snack_01_n.xbm`)

{% hint style="info" %}
For a guide how to make your own normal maps, see [here](../3d-modelling/self-made-normal-maps/).
{% endhint %}

### Roughness

Also known as "gloss map", this texture defines how light scatters across the surface of your 3d model. Used by shaders like `metal_base.remt`.

```
White => very rough
Black => very smooth
```

For an overview image, see [Roughness/Metalness overview](./#roughness-metalness-overview).

#### Naming convention:

In the game files, these files will be named `<name>_n.xbm` (e.g. `base\environment\decoration\food\packaged_food\textures\synthetic_snack_01_r.xbm`)

### Metalness

Also known as "metallic map", this texture defines which parts of the material behave like metal and which parts don't. Used by shaders like `metal_base.remt`.

```
White => metal
Black => not metal
```

For an overview image, see [Roughness/Metalness overview](./#roughness-metalness-overview).

#### Naming convention:

In the game files, these files will be named `<name>_m.xbm` (e.g. `base\envment\decoration\food\packaged_food\textures\synthetic_snack_01_m.xbm`)

### Atlas

Used for in-game items and UI elements, these textures contain a collection of images. They are made available to the game via [**inkatlas**](../files-and-what-they-do/game-icons-the-inkatlas-file.md) files.

#### Naming convention:

In the game files, these files will be named `atlas_<name>.xbm` (e.g. `base\gameplay\gui\fullscreen\hacking_minigame\atlas_minigame_programs.xbm`)





## Additional intel

### Roughness/Metalness overview

<figure><img src="https://3dcoat.com/forum/uploads/monthly_2017_11/3DC_PBR.thumb.jpg.e5e6dfadbb34dfc4e806871be9fb203c.jpg" alt=""><figcaption><p>via <a href="https://3dcoat.com/forum/index.php?/topic/21601-3dc-roughness-metalness-visual-aid/">https://3dcoat.com/forum/index.php?/topic/21601-3dc-roughness-metalness-visual-aid/</a></p></figcaption></figure>
