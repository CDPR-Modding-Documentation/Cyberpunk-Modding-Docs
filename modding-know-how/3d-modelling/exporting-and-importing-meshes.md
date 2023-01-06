---
description: How to export and import meshes (Wolvenkit <=> Blender)
---

# Exporting and importing meshes

## Summary <a href="#summary" id="summary"></a>

**Created by @manavortex**\
**Published November 05 2022**

This guide will show you how to\
\- export meshes from the game to edit them in other software\
\- import those meshes back into WolvenKit

Assumed skill level: You are able to read and comprehend instructions.

{% hint style="info" %}
If you want to replace meshes without editing them, check [this guide](../../modding-guides/items/editing-existing-items/replace-a-player-item-with-an-npc-item.md).
{% endhint %}

| Tool                                                                                                                                                                                                                       | Tool version                       |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------- |
| [WolvenKit](https://github.com/WolvenKit/Wolvenkit/releases)                                                                                                                                                               | >= 8.7.0                           |
| [Blender](https://www.blender.org/download/)                                                                                                                                                                               | >= 3.3 stable                      |
| <p><a href="https://richwhitehouse.com/index.php?content=inc_projects.php">Noesis</a><br><a href="https://github.com/alphazolam/fmt_CP77mesh?msclkid=384152bfaa5611ecbad0234dbe6a5c45">Noesis Import/Export Plugin</a></p> | <p>>= 4.459<br>>= Sep 28, 2021</p> |
| [WKit Blender AddOn](https://github.com/WolvenKit/Cyberpunk-Blender-add-on)[ ](https://github.com/WolvenKit/Cyberpunk-Blender-add-on)                                                                                      | >= 1.1.0                           |



{% hint style="danger" %}
**Before you start to edit, a word of warning:**

It is easy to [break a mesh](exporting-and-importing-meshes.md#troubleshooting-i-cant-import-my-mesh) beyond the point of repair. Make frequent back-ups, and continuously test if your altered mesh still imports and displays in WolvenKit, **especially when editing vertices!**
{% endhint %}

## Exporting the mesh

### WolvenKit (\*.gdb)

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

Path of glb: `<yourModDir>\archive\raw\base\characters\garment\player_equipment\torso\t2_002_vest__puffy\t2_002_pwa_vest__puffy.gdb`

### Noesis (\*.fbx)

{% hint style="danger" %}
The [Noesis Import/Export Plugin](https://github.com/alphazolam/fmt\_CP77mesh?msclkid=384152bfaa5611ecbad0234dbe6a5c45) is required for this.
{% endhint %}

Find your mesh in Noesis. Right-click and select "Export".

<figure><img src="../../.gitbook/assets/noesis_mesh_export.png" alt=""><figcaption></figcaption></figure>

## Blender: Saving the mesh

### for WolvenKit (\*.gdb)

<figure><img src="https://i.imgur.com/eauWYiF.png" alt=""><figcaption><p>Export settings: "Tangents" must be checked</p></figcaption></figure>

{% hint style="info" %}
I recommend disabling materials, especially if you've wildly messed around with the shaders while you've been editing.
{% endhint %}

{% hint style="warning" %}
For WolvenKit > 8.8 and < 8.9, make sure to delete MeshName.Material.json from the raw directory.
{% endhint %}

### Noesis (\*.fbx)

Simply export as fbx, Blender's standard settings are alright for Noesis.

## Importing to \*.mesh

### WolvenKit (\*.gdb)

You should have overwritten your previous gdb export. With WKit's Import/Export tool, you can now use the **import** tab and get it back in.

{% hint style="info" %}
WolvenKit will map any \*.gdb file under `raw` to the mesh with the same name under `source`.

Example:

`<yourModDir>\archive\raw\base\characters\garment\player_equipment\torso\t2_002_vest__puffy\t2_002_pwa_vest__puffy.gdb`&#x20;

will be imported over

`<yourModDir>\archive\source\base\characters\garment\player_equipment\torso\t2_002_vest__puffy\t2_002_pwa_vest__puffy.mesh`
{% endhint %}

{% hint style="warning" %}
WolvenKit refuses to import if the target mesh doesn't support all bones in the gdb or if your mesh's topology became corrupted.
{% endhint %}

### Noesis (\*.fbx)

{% hint style="danger" %}
The [Noesis Import/Export Plugin](https://github.com/alphazolam/fmt\_CP77mesh?msclkid=384152bfaa5611ecbad0234dbe6a5c45) is required for this.
{% endhint %}

Find your fbx in Noesis. Right-click and select "Import".

<figure><img src="../../.gitbook/assets/noesis_mesh_import.png" alt=""><figcaption></figcaption></figure>

{% hint style="warning" %}
You need to select a target mesh to import over.
{% endhint %}

## Troubleshooting: I can't import my mesh

### Something with bones

WolvenKit will check your 3d object's **vertex groups** against the **bones** in the associated rig. If your mesh is missing bones, then you won't be able to import.

To resolve this, import over a different mesh that has all the bones, or look into [this tutoria](https://xbaebsae.jimdofree.com/tutorials/cp2077-transferring-and-expanding-skeletons-in-meshes/)l as for how to transfer bones from one armature to the other.

### Everything else

WolvenKit will not import a mesh that has any kind of issues. Those include, but are not limited to:&#x20;

* non-flat faces
* zero faces/edges
* loose vertices/edges

**There is no guarantee that any of the steps below will actually solve your problem.**&#x20;

#### **Edit Mode**

In Edit Mode, you can find a few commands in the Mesh -> Clean Up menu:

* Delete Loose
* Split Non-Planar Faces
* Split Concave Faces
* Merge By Distance\
  ⚠ If you select your whole mesh, this will merge the individual chunks. Make sure to do them one after another.

If that doesn't solve your problem, you can use the [3d print tool](https://docs.blender.org/manual/en/latest/addons/mesh/3d\_print\_toolbox.html) to (hopefully) find out what is wrong with your mesh.

{% hint style="info" %}
If you don't have a 3d print menu, you might need to enable the plugin in Blender's settings first.
{% endhint %}

