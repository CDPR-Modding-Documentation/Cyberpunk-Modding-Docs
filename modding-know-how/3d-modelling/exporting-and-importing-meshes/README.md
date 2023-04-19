---
description: How to export and import meshes (WolvenKit <=> Blender)
---

# Exporting and importing meshes

## Summary <a href="#summary" id="summary"></a>

**Created by @manavortex**\
**Published November 05 2022**

This guide will show you how to\
\- export meshes from the game for use in other projects\
\- import those meshes back into WolvenKit

Assumed skill level: You are able to read and comprehend instructions.

{% hint style="info" %}
If you want to replace meshes without editing them, check [this guide](../../../modding-guides/items-equipment/editing-existing-items/replace-a-player-item-with-an-npc-item.md).

This guide assumes that you already know which mesh you want to edit. If you do not, check [here](../../references-lists-and-overviews/equipment/spawn-codes-baseids-hashes.md#from-a-baseid-to-an-items-materials).

See the Wolvenkit Wiki for guides on how to export [a character](https://wiki.redmodding.org/wolvenkit/guides/modding-community/exporting-to-blender) or [an animation](https://wiki.redmodding.org/wolvenkit/guides/modding-community/exporting-to-blender/exporting-rigs-and-anims).

You can find a collection of useful Python scripts for Blender on [Simarilius's github](https://github.com/Simarilius-uk/CP2077\_BlenderScripts/).
{% endhint %}

| Tool                                                                                                                                                                                                                       | Tool version                                              |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------- |
| [WolvenKit](https://github.com/WolvenKit/Wolvenkit/releases)                                                                                                                                                               | >= 8.8.0 _(8.7.0 works, but has a slightly different UI)_ |
| [Blender](https://www.blender.org/download/)                                                                                                                                                                               | >= 3.1 stable                                             |
| <p><a href="https://richwhitehouse.com/index.php?content=inc_projects.php">Noesis</a><br><a href="https://github.com/alphazolam/fmt_CP77mesh?msclkid=384152bfaa5611ecbad0234dbe6a5c45">Noesis Import/Export Plugin</a></p> | <p>>= 4.459<br>>= Sep 28, 2021</p>                        |
| [WKit Blender AddOn](https://github.com/WolvenKit/Cyberpunk-Blender-add-on)[ ](https://github.com/WolvenKit/Cyberpunk-Blender-add-on)                                                                                      | >= 1.1.0                                                  |

You can import and export meshes via WolvenKit **or** Noesis - both methods work.&#x20;

{% hint style="danger" %}
**Before you start editing, a warning:**

It is easy to [break a mesh](./#troubleshooting-i-cant-import-my-mesh) beyond the point of repair. Make frequent back-ups, and continuously test if your altered mesh still imports and displays in WolvenKit, **especially when editing vertices!**
{% endhint %}

## Exporting the mesh

### glTF Binary (\*.glb)

WolvenKit <= [8.8](https://github.com/WolvenKit/WolvenKit/releases/tag/8.8.0): Use the Import/Export tool. It is pinned to the sidebar on the right.

WolvenKit > 8.8: Use the Export tool. You can toggle it from the "Tools" menu on the top bar.

1. Select your mesh in the Export Tool and click `Export/Process Selected`, or simply use `Export/Process All.`
2. You now have`meshName.glb` in your WKit project's [`raw` directory.](./#path-example)

<figure><img src="../../../.gitbook/assets/textured_items_raw_files.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
Wolvenkit > 8.8 will by default export with materials for the [Cyberpunk Blender Plugin](https://github.com/WolvenKit/Cyberpunk-Blender-add-on).
{% endhint %}

#### Path example&#x20;

Assuming you are exporting `t2_002_pwa_vest__puffy.mesh`, WolvenKit will do the following:

Path of mesh: `<yourModDir>\source\`**`archive`**`\base\characters\garment\player_equipment\torso\t2_002_vest__puffy\t2_002_pwa_vest__puffy.mesh`

Path of glb: `<yourModDir>\source\`**`raw`**`\base\characters\garment\player_equipment\torso\t2_002_vest__puffy\t2_002_pwa_vest__puffy.glb`

### Autodesk (\*.fbx)

{% hint style="danger" %}
The [Noesis Import/Export Plugin](https://github.com/alphazolam/fmt\_CP77mesh?msclkid=384152bfaa5611ecbad0234dbe6a5c45) is required for this.
{% endhint %}

Noesis is an **alternative** to exporting with WolvenKit. There are legitimate use cases for why you would want this. If you don't know them, you'll probably not want to use this.

{% hint style="info" %}
Wolvenkit has come a long way since the early days of Cyberpunk modding. 5000 years ago on the slopes of Mount Doom, mods were created with nothing but Noesis and hex editing. By now, you can almost always use Wolvenkit.
{% endhint %}

1. Find your mesh in the Noesis browser
2. Right-click it and select "Export"
3. Export with default settings:

<figure><img src="../../../.gitbook/assets/noesis_mesh_export.png" alt=""><figcaption></figcaption></figure>

## Blender: Saving the mesh

{% hint style="info" %}
Some meshes (such as eyelashes and hair) are two-sided. See [here](../meshes.md#import-export-\_doubled) for details on how Wolvenkit handles that.
{% endhint %}

### glTF Binary  (\*.glb)

{% hint style="warning" %}
If you have touched the topology, make sure to **triangulate** your mesh before exporting (Select all in Edit Mode, `Ctrl+T`)
{% endhint %}

{% hint style="info" %}
You can use the [Cyberpunk Blender Plugin](https://github.com/WolvenKit/Cyberpunk-Blender-add-on) — it will take care of the necessary settings.
{% endhint %}

Make sure to check the box under Data > Mesh > Tangents, as Wolvenkit will not export without it.

<figure><img src="https://i.imgur.com/eauWYiF.png" alt=""><figcaption><p>Export settings: "Tangents" must be checked</p></figcaption></figure>

### Autodesk (\*.fbx)

Simply export as fbx, Blender's standard settings are fine for Noesis.

## Importing to \*.mesh

{% hint style="info" %}
If you are following a guide with pre-made resources and it tells you to import via Noesis, you'll want to follow the advice, as the elements in the exported structure will have different names.

Alternatively, you can run [this script](https://github.com/manavortex/code\_snippets/blob/master/py/blender/convert\_gltf\_fbx.py) on your blend file, which will automatically fix that for you.
{% endhint %}

### glTF Binary (\*.glb)

In Blender, you should have **overwritten** your previously exported glb. With WKit's Import/Export tool, you can now simply **`Import`** it back in.

{% hint style="info" %}
WolvenKit will map any \*.glb file under `raw` to the mesh with the same name under `source`.

Example:

`<yourModDir>\archive\raw\base\characters\garment\player_equipment\torso\t2_002_vest__puffy\t2_002_pwa_vest__puffy.glb`&#x20;

will be imported over

`<yourModDir>\archive\source\base\characters\garment\player_equipment\torso\t2_002_vest__puffy\t2_002_pwa_vest__puffy.mesh`
{% endhint %}

{% hint style="warning" %}
WolvenKit refuses to import if the target mesh doesn't support all bones in the glb or if your mesh's topology became corrupted. If that's the case, check the [troubleshooting page](../self-made-normal-maps/troubleshooting-normal-maps.md).
{% endhint %}

### Autodesk (\*.fbx)

{% hint style="danger" %}
The [Noesis Import/Export Plugin](https://github.com/alphazolam/fmt\_CP77mesh?msclkid=384152bfaa5611ecbad0234dbe6a5c45) is required for this.
{% endhint %}

Noesis is an **alternative** to importing with WolvenKit.

* Find your fbx in the Noesis browser
* Right-click it and select "Export"
* Set the `Main output type` to `.mesh - CyberPunk 2077 mesh [PC]`
* A dialogue asks you for a file to overwrite. Make sure that it has your mesh!

<figure><img src="../../../.gitbook/assets/noesis_mesh_import.png" alt=""><figcaption></figcaption></figure>

## Differences between fbx and glb

There are a few differences between Noesis and WolvenKit when it comes to exporting your meshes:

<figure><img src="../../../.gitbook/assets/import_noesis_glb_armature_differences.png" alt=""><figcaption><p>Note the differently named submeshes</p></figcaption></figure>

|               | Autodesk (fbx) | glTF Binary (glb)   |
| ------------- | -------------- | ------------------- |
| Armature      | Rotation W: 0  | Rotation W: 1       |
|               | Rotation Z: -1 | Rotation Z: 0       |
| Submesh names | submesh0       | submesh\_00\_LOD\_1 |

You can easily convert between the two formats by hand — or use [this script](https://github.com/manavortex/code\_snippets/blob/master/py/blender/convert\_gltf\_fbx.py): Switch to Blender's Scripting perspective, create a new file, paste the contents in, and run it.

## Troubleshooting

If your mesh won't export from Wolvenkit, try exporting it [without materials](./#exporting-with-materials) by unchecking the box.&#x20;

For a list of troubleshooting steps, check the [corresponding wiki page](../troubleshooting-your-mesh-edits.md).
