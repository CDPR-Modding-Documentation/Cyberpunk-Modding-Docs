---
description: Overview and introduction
---

# 🔮 Textures, Materials and Shaders

This is the landing page for **materials** in Cyberpunk 2077. It contains a definition and a rough overview.&#x20;

{% hint style="info" %}
Check the section's sub pages in the wiki's navigation tree for more detailed information about the different kinds of materials. Additional material-related information can be found here:
{% endhint %}

#### General information

* Handy list of references: [cheat-sheet-materials.md](../references-lists-and-overviews/cheat-sheet-materials.md "mention")
* Re-using materials as templates: [re-using-materials-.mi.md](../files-and-what-they-do/re-using-materials-.mi.md "mention")
* How it works in the example: [3d-objects-.mesh-files](../files-and-what-they-do/3d-objects-.mesh-files/ "mention")

#### Multilayered

* General information: [multilayered](multilayered/ "mention")
* Properties and definition: [multilayered-material-properties.md](multilayered/multilayered-material-properties.md "mention")
* Preview images: [multilayered-previews.md](multilayered/multilayered-previews.md "mention")

#### Hands-on:

* [changing-materials-colors-and-textures.md](../modding-guides/items-equipment/editing-existing-items/changing-materials-colors-and-textures.md "mention") (guide)
* [self-made-normal-maps](../modding-guides/textures-and-luts/self-made-normal-maps/ "mention")

## Definition: Shader

In its original state, a [3d-objects-.mesh-files](../files-and-what-they-do/3d-objects-.mesh-files/ "mention") is a collection of **vertices** (pixels). The space between those vertices is filled by **faces**, which form the 3d object's surface.&#x20;

The shader is the thing that goes on top of the surface, rendering a **material** such as glass, skin, concrete, steel…

{% hint style="info" %}
Without a shader, objects would be invisible in the game, the surface simply being transparent. In Cyberpunk, a default shader will be assigned in such cases (such as debug\_coloring.mt).
{% endhint %}

In Cyberpunk 2077, REDEngine shaders are implemented as `.mt`/`.remt` files.&#x20;

### How can I use shaders?

If you have ever messed with an item's materials, then you already have.&#x20;

To use a shader, you create a **Material Instance**, where you can configure the **parameters**. \
Not every parameter of a shader can be configured: since skin always has subsurface scattering, it makes no sense to tweak this. But since skin color already varies dramatically if you don't throw exotic chrome into the mix, you can change them easily via tint.

## Definition: Material&#x20;

{% hint style="info" %}
For details how materials are used on a mesh, see the [3d-objects-.mesh-files](../files-and-what-they-do/3d-objects-.mesh-files/ "mention"), or learn how materials can be defined in a mesh via [#materialinstance-the-local-material](../files-and-what-they-do/3d-objects-.mesh-files/#materialinstance-the-local-material "mention") or loaded externally from&#x20;
{% endhint %}

**In the context of Cyberpunk**, a material is the thing that lets the shader define the surface properties of a [3d-objects-.mesh-files](../files-and-what-they-do/3d-objects-.mesh-files/ "mention"). Typically, you create a local instance, which will then pull in a shader via `baseMaterial`.

The property `baseMaterial` can point at a `.mt` / `.remt` file directly, or to an intermediary `.mi` file:

<figure><img src="../../.gitbook/assets/materials_mt_and_mi.png" alt=""><figcaption></figcaption></figure>

### The .mi file&#x20;

{% hint style="info" %}
Each part of a mesh (submesh) can have a different material assigned.&#x20;

Do you want to know more?  ( =>[#chunkmaterials](../files-and-what-they-do/3d-objects-.mesh-files/#chunkmaterials "mention"))
{% endhint %}

{% hint style="success" %}
For a hands-on guide and something to play around/experiment with, check [textured-items-and-cyberpunk-materials.md](../modding-guides/everything-else/textured-items-and-cyberpunk-materials.md "mention").
{% endhint %}

## What kinds of material exist?

### Textured

If you have modded other games, you're used to PBR materials with a bunch of textures like **diffuse**, **normal,** **metalness** etc.&#x20;

{% hint style="success" %}
To change a textured material, see [changing-materials-colors-and-textures.md](../modding-guides/items-equipment/editing-existing-items/changing-materials-colors-and-textures.md "mention") -> [#step-2-finding-the-correct-appearance](../modding-guides/items-equipment/editing-existing-items/changing-materials-colors-and-textures.md#step-2-finding-the-correct-appearance "mention")
{% endhint %}

{% hint style="info" %}
Did you know? You can make Cyberpunk's default textured material glow.
{% endhint %}

### Multilayered

This is specific to Cyberpunk, and it is incredibly cool. If you're used to textured materials, you're probably going to hate it at first, but it has incredible versatility and re-usability.&#x20;

{% hint style="success" %}
* What is a multilayered material and how does [multilayered](multilayered/ "mention") work?
* What are these [properties](multilayered/multilayered-material-properties.md), how do I use them?
* [Changing the colours](../modding-guides/items-equipment/editing-existing-items/changing-materials-colors-and-textures.md#multilayered-material)
* [Changing the mask](../modding-guides/textures-and-luts/custom-multilayermasks.md)
{% endhint %}
