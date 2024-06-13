---
description: Find knowledge on editing 3d models here
---

# 🌐 3d Modelling

Check the sub-pages for more detes, or check the section's sub-pages.&#x20;

## Relevant guides

Due to its complexity, we don't have a dedicated guide on Blender. However, if you have no idea how to start, various other guides cover part of the process:

* [Sculpting](mesh-sculpting-techniques.md)
* [Proportional editing / Refitting](../../modding-guides/items-equipment/recolours-and-refits/r-and-r-refitting-step-by-step.md)
* [Texture painting](../../modding-guides/textures-and-luts/custom-multilayermasks.md) and [normal map creation](../../modding-guides/textures-and-luts/self-made-normal-maps/)
* [Adding submeshes](3d-editing-submeshes.md) or [Splitting meshes](../core-mods-explained/amm/textured-items-and-cyberpunk-materials.md#step-2-processing-the-downloaded-mesh)

For more hands-on advice, see the guide section, for example

* [wolvenkit-blender-io-suite](../modding-tools/wolvenkit-blender-io-suite/ "mention"): Importing/exporting [#meshes](../modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-import-export.md#meshes "mention")
* [Material assignment examples](../core-mods-explained/amm/textured-items-and-cyberpunk-materials.md)
* [troubleshooting-your-mesh-edits.md](troubleshooting-your-mesh-edits.md "mention")
* [garment-support-how-does-it-work](garment-support-how-does-it-work/ "mention") or [files-and-what-they-do](../files-and-what-they-do/ "mention")

## Relevant files

### Mesh

A mesh defines the shape and surface of any in-game object.&#x20;

{% hint style="info" %}
For more information on .mesh files and how they work, see [3d-objects-.mesh-files](../files-and-what-they-do/3d-objects-.mesh-files/ "mention")

For more informations on **materials** and mesh appearances, see [materials](../materials/ "mention")
{% endhint %}

### Morphtarget

Morphtargets are a special kind of mesh used for alternate and additional shapes beyond the static shape a `.mesh` can define. If your source is a `.morphtarget`, you need to primarily work with that rather than the `.mesh`.&#x20;

{% hint style="info" %}
Read more on the [morphtargets.md](morphtargets.md "mention") page
{% endhint %}
