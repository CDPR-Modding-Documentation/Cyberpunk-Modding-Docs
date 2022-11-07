---
description: Altering an in-game mesh
---

# Mesh editing

## Summary <a href="#summary" id="summary"></a>

**Created by @manavortex**\
**Published November 05 2022**

{% hint style="info" %}
This page is about changing any given mesh. If you want to replace one with another, check [this guide](replace-a-player-item-with-an-npc-item.md).
{% endhint %}

Versions:\
WolvenKit: [8.7.1-nightly.2022-11-06](https://github.com/WolvenKit/WolvenKit/compare/8.7.1-nightly.2022-11-05...8.7.1-nightly.2022-11-06) (anything > 8.7.0 will do)\
Blender: 3.3 stable\
Noesis: 4.459

## Exporting the mesh into Blender

For a comprehensive guide on how to export a mesh, see here.

### WolvenKit (\*.gdb)

Use the Import/Export tool to export your mesh. Assuming the following path:

`<yourModDir>\archive\source\base\characters\garment\player_equipment\torso\t2_002_vest__puffy\t2_002_pwa_vest__puffy.mesh`

<figure><img src="../../.gitbook/assets/image (6).png" alt=""><figcaption></figcaption></figure>

This will create `<yourModDir>\archive\raw\base\characters\garment\player_equipment\torso\t2_002_vest__puffy\t2_002_pwa_vest__puffy.gdb`

{% hint style="info" %}
To export a mesh with materials for import with the Cyberpunk Blender Plugin, double-click on it and then select "WithMaterials" as "MeshExportType":
{% endhint %}

<figure><img src="../../.gitbook/assets/image (23).png" alt=""><figcaption></figcaption></figure>

### Noesis (\*.fbx)

{% hint style="danger" %}
**TBD**
{% endhint %}

## Blender: Saving the mesh

### for WolvenKit (\*.gdb)

<figure><img src="https://i.imgur.com/eauWYiF.png" alt=""><figcaption><p>Export settings: "Tangents" must be checked</p></figcaption></figure>

{% hint style="info" %}
I recommend disabling materials, especially if you've wildly messed around with the shaders while you've been editing.
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
WolvenKit refuses to import if the target mesh doesn't support all bones in the gdb.
{% endhint %}

### Noesis (\*.fbx)

{% hint style="danger" %}
**TBD**
{% endhint %}

