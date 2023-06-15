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

Assumed skill level: You are able to read ;)

<table><thead><tr><th width="293">Tool</th><th>Tool version</th></tr></thead><tbody><tr><td><a href="https://github.com/WolvenKit/Wolvenkit/releases">WolvenKit</a></td><td>>= 8.8.0 <em>(8.7.0 works, but has a slightly different UI)</em></td></tr><tr><td><a href="https://www.blender.org/download/">Blender</a></td><td>>= 3.1 stable</td></tr><tr><td><a href="https://github.com/WolvenKit/Cyberpunk-Blender-add-on">WKit Blender AddOn</a><a href="https://github.com/WolvenKit/Cyberpunk-Blender-add-on"> </a></td><td>>= 1.1.0</td></tr></tbody></table>

### Wait, this isn't what I want!

Would you rather…

* Import/Export to fbx [with Noesis](autodesk-fbx-noesis.md)?
* Read more about [Wolvenkit's Import/Export tool](https://wiki.redmodding.org/wolvenkit/wolvenkit-app/usage/import-export/export-settings)?
* [Replace meshes](../../modding-guides/items-equipment/editing-existing-items/replace-a-player-item-with-an-npc-item.md) without editing them?
* Export [a whole character](https://wiki.redmodding.org/wolvenkit/guides/modding-community/exporting-to-blender) or [an animated character](https://wiki.redmodding.org/wolvenkit/guides/modding-community/exporting-to-blender/exporting-rigs-and-anims)?

{% hint style="info" %}
You can find a collection of useful Python scripts for Blender on [Simarilius's github](https://github.com/Simarilius-uk/CP2077\_BlenderScripts/).
{% endhint %}

You can import and export meshes via WolvenKit **or** [Noesis](autodesk-fbx-noesis.md) - both methods work.&#x20;

{% hint style="danger" %}
**Before you start editing, a warning:**

It is easy to [break a mesh](./#troubleshooting-i-cant-import-my-mesh) beyond the point of repair. Make frequent back-ups, and continuously test if your altered mesh still imports and displays in WolvenKit, **especially when editing vertices!**
{% endhint %}

## Exporting the mesh

### glTF Binary (\*.glb)

WolvenKit <= [8.8](https://github.com/WolvenKit/WolvenKit/releases/tag/8.8.0): Use the [Import/Export tool](https://wiki.redmodding.org/wolvenkit/wolvenkit-app/usage/import-export). It is pinned to the sidebar on the right.

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

## Blender: Saving the mesh

{% hint style="info" %}
Some meshes (such as eyelashes and hair) are two-sided. See [here](broken-reference) for details on how Wolvenkit handles that.
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

## Importing to \*.mesh

{% hint style="info" %}
If you are following a guide with pre-made resources and it tells you to [import via Noesis,](autodesk-fbx-noesis.md) you'll want to follow the advice, as the elements in the exported structure will have different names.

Alternatively, you can run [this script](https://github.com/manavortex/code\_snippets/blob/master/py/blender/convert\_gltf\_fbx.py) on your blend file, which will automatically fix that for you.
{% endhint %}

### glTF Binary (\*.glb)

In Blender, you should have **overwritten** your previously exported glb. With WKit's [Import/Export tool](https://wiki.redmodding.org/wolvenkit/wolvenkit-app/usage/import-export), you can now simply **`Import`** it back in.

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

## Import/Export: \_doubled

Normally, a mesh's **backfaces** are invisible/transparent - you aren't supposed to see a mesh from below, so it doesn't matter. But some, like hair and eyelashes, are different, and need to be doubled.

When importing via Noesis, you need to do this by hand: duplicate all the vertices in the mesh, and flip the normals.\
When importing via WolvenKit, it will automagically do that for you if a mesh name ends with **\_doubled**.&#x20;

The suffix also indicates that Wolvenkit de-duplicated a mesh on export!

<figure><img src="https://cdn.discordapp.com/attachments/1091077640854704270/1091295442060464138/image.png" alt=""><figcaption><p>Thanks to Na for the screenshot</p></figcaption></figure>

## Troubleshooting

If your mesh won't export from Wolvenkit, try exporting it [without materials](./#exporting-with-materials) by unchecking the box.&#x20;

For a list of troubleshooting steps, check the [corresponding wiki page](../troubleshooting-your-mesh-edits.md).
