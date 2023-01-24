---
description: How to export and import meshes (WolvenKit <=> Blender)
---

# Exporting and importing meshes

{% hint style="success" %}
For a guide on exporting a character, see the [WolvenKit wiki](https://wiki.redmodding.org/wolvenkit/guides/modding-community/exporting-to-blender).
{% endhint %}

## Summary <a href="#summary" id="summary"></a>

**Created by @manavortex**\
**Published November 05 2022**

This guide will show you how to\
\- export meshes from the game to edit them in other software\
\- import those meshes back into WolvenKit

Assumed skill level: You are able to read and comprehend instructions.

{% hint style="info" %}
If you want to replace meshes without editing them, check [this guide](../../modding-guides/items/editing-existing-items/replace-a-player-item-with-an-npc-item.md).

This guide assumes that you already know which mesh you want to edit. If you do not, check [here](../references-lists-and-overviews/equipment/spawn-codes-baseids-hashes.md#from-a-baseid-to-an-items-materials).
{% endhint %}

| Tool                                                                                                                                                                                                                       | Tool version                       |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------- |
| [WolvenKit](https://github.com/WolvenKit/Wolvenkit/releases)                                                                                                                                                               | >= 8.7.0                           |
| [Blender](https://www.blender.org/download/)                                                                                                                                                                               | >= 3.1 stable                      |
| <p><a href="https://richwhitehouse.com/index.php?content=inc_projects.php">Noesis</a><br><a href="https://github.com/alphazolam/fmt_CP77mesh?msclkid=384152bfaa5611ecbad0234dbe6a5c45">Noesis Import/Export Plugin</a></p> | <p>>= 4.459<br>>= Sep 28, 2021</p> |
| [WKit Blender AddOn](https://github.com/WolvenKit/Cyberpunk-Blender-add-on)[ ](https://github.com/WolvenKit/Cyberpunk-Blender-add-on)                                                                                      | >= 1.1.0                           |

You can import and export meshes via WolvenKit **or** Noesis - both methods work.&#x20;

{% hint style="danger" %}
**Before you start to edit, a word of warning:**

It is easy to [break a mesh](exporting-and-importing-meshes.md#troubleshooting-i-cant-import-my-mesh) beyond the point of repair. Make frequent back-ups, and continuously test if your altered mesh still imports and displays in WolvenKit, **especially when editing vertices!**
{% endhint %}

## Exporting the mesh

### glTF Binary (\*.glb)

WolvenKit <= [8.8](https://github.com/WolvenKit/WolvenKit/releases/tag/8.8.0): Use the Import/Export tool. It is pinned to the sidebar on the right.

WolvenKit > 8.8: Use the Export tool. You can toggle it from the "Tools" menu on the top bar.

{% hint style="success" %}
Select your mesh in the Export Tool and click "Export/Process Selected".&#x20;

This will create `meshName.glb` in your WKit project's [`raw` directory.](exporting-and-importing-meshes.md#path-example)
{% endhint %}

<figure><img src="../../.gitbook/assets/image (6) (2).png" alt=""><figcaption><p>Displayed: WKit 8.8</p></figcaption></figure>

#### Exporting with materials

{% hint style="info" %}
For WolvenKit versions > 8.8, this is the default behaviour.
{% endhint %}

To export a mesh with materials for import with the [Cyberpunk Blender Plugin](https://github.com/WolvenKit/Cyberpunk-Blender-add-on), double-click on it to display the export settings. Set **`MeshExportType`** as `WithMaterials`.

<figure><img src="../../.gitbook/assets/image (23) (1).png" alt=""><figcaption></figcaption></figure>

#### Path example&#x20;

Assuming you are exporting `t2_002_pwa_vest__puffy.mesh`, WolvenKit will do the following:

Path of mesh: `<yourModDir>\archive\source\base\characters\garment\player_equipment\torso\t2_002_vest__puffy\t2_002_pwa_vest__puffy.mesh`

Path of glb: `<yourModDir>\archive\raw\base\characters\garment\player_equipment\torso\t2_002_vest__puffy\t2_002_pwa_vest__puffy.glb`

### Autodesk (\*.fbx)

{% hint style="danger" %}
The [Noesis Import/Export Plugin](https://github.com/alphazolam/fmt\_CP77mesh?msclkid=384152bfaa5611ecbad0234dbe6a5c45) is required for this.
{% endhint %}

Noesis is an **alternative** to exporting with WolvenKit. There are legitimate use cases for why you would want this. If you don't know them, you'll probably not want to use this.

Find your mesh in Noesis. Right-click and select "Export".

<figure><img src="../../.gitbook/assets/noesis_mesh_export.png" alt=""><figcaption></figcaption></figure>

## Blender: Saving the mesh

### glTF Binary  (\*.glb)

<figure><img src="https://i.imgur.com/eauWYiF.png" alt=""><figcaption><p>Export settings: "Tangents" must be checked</p></figcaption></figure>

{% hint style="info" %}
I recommend disabling materials, especially if you've wildly messed around with the shaders while you've been editing.
{% endhint %}

{% hint style="warning" %}
For WolvenKit > 8.8 and < 8.9, make sure to delete MeshName.Material.json from the raw directory.
{% endhint %}

### Autodesk (\*.fbx)

Simply export as fbx, Blender's standard settings are alright for Noesis.

## Importing to \*.mesh

{% hint style="info" %}
If you are following a guide with pre-made resources and it tells you to import via Noesis, you'll want to follow the advice, as the elements in the exported structure will have different names.
{% endhint %}

### glTF Binary (\*.glb)

You should have overwritten your previous glb export. With WKit's Import/Export tool, you can now use the **import** tab and get it back in.

{% hint style="info" %}
WolvenKit will map any \*.glb file under `raw` to the mesh with the same name under `source`.

Example:

`<yourModDir>\archive\raw\base\characters\garment\player_equipment\torso\t2_002_vest__puffy\t2_002_pwa_vest__puffy.glb`&#x20;

will be imported over

`<yourModDir>\archive\source\base\characters\garment\player_equipment\torso\t2_002_vest__puffy\t2_002_pwa_vest__puffy.mesh`
{% endhint %}

{% hint style="warning" %}
WolvenKit refuses to import if the target mesh doesn't support all bones in the glb or if your mesh's topology became corrupted.
{% endhint %}

### Autodesk (\*.fbx)

{% hint style="danger" %}
The [Noesis Import/Export Plugin](https://github.com/alphazolam/fmt\_CP77mesh?msclkid=384152bfaa5611ecbad0234dbe6a5c45) is required for this.
{% endhint %}

Noesis is an **alternative** to importing with WolvenKit.

Find your fbx in Noesis. Right-click and select "Import".

<figure><img src="../../.gitbook/assets/noesis_mesh_import.png" alt=""><figcaption></figcaption></figure>

{% hint style="warning" %}
You need to select a target mesh to import over.
{% endhint %}

## Differences between fbx and glb

There are a few differences between Noesis and WolvenKit when it comes to exporting your meshes:

<figure><img src="../../.gitbook/assets/import_noesis_glb_armature_differences.png" alt=""><figcaption><p>Note the differently named submeshes</p></figcaption></figure>

|               | Autodesk (fbx) | glTF Binary (glb)   |
| ------------- | -------------- | ------------------- |
| Armature      | Rotation W: 0  | Rotation W: 1       |
|               | Rotation Z: -1 | Rotation Z: 0       |
| Submesh names | submesh0       | submesh\_00\_LOD\_1 |

You can easily convert between the two formats by hand!

## Troubleshooting

If your mesh won't export, try exporting it [without materials](exporting-and-importing-meshes.md#exporting-with-materials).&#x20;

For a list of troubleshooting steps, check the [corresponding wiki page](troubleshooting-your-mesh-edits.md).
