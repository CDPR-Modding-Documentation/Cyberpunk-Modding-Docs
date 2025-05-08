---
description: How to replace an in-game item with your custom mesh
---

# Porting 3d objects to Cyberpunk

## Summary

Published: Oct. 14 2023 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
Last documented Update: Mar. 20 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page will give you information on how to get a 3d object into Cyberpunk.

If you'd like to watch a video about the whole process, feel free to address the video version of this guide - [https://www.youtube.com/watch?v=r3nyFm-9h9o](https://www.youtube.com/watch?v=r3nyFm-9h9o)&#x20;

Alternative workflow, shorter video tutorial by CyberVesna - [Importing Custom Clothes](https://youtu.be/qiwZGZG66fA)

### Wait, that's not what I want!

You can find other relevant guides scattered across this wiki, for example

* [adding-new-items](../../modding-guides/items-equipment/adding-new-items/ "mention")
* [custom-props](../../modding-guides/everything-else/custom-props/ "mention")
* [textured-items-and-cyberpunk-materials.md](../../modding-guides/textures-and-luts/textured-items-and-cyberpunk-materials.md "mention")

## Prerequisites

* **Wolvenkit:** The latest version the latest stable ([stable](https://github.com/WolvenKit/WolvenKit/releases/) | [nightly](https://github.com/WolvenKit/WolvenKit-nightly-releases/releases/))
* [wolvenkit-blender-io-suite](../modding-tools/wolvenkit-blender-io-suite/ "mention")(>= [1.5.5.2](https://github.com/WolvenKit/Cyberpunk-Blender-add-on/releases) for Wolvenkit 8.14)
* Blender (>= [4.1](https://www.blender.org/download/releases/) for Wolvenkit 8.14)
* A [Wolvenkit project](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects), so that you can pack your mod

## Step 0: Finding the right base mesh

To bring 3d data into Cyberpunk, Wolvenkit needs a .mesh file to import into. [Read here why](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export#file-structure).&#x20;

For the purpose of this guide, it doesn't matter if you are trying to[replace-a-player-item-with-an-npc-item](../../modding-guides/items-equipment/editing-existing-items/replace-a-player-item-with-an-npc-item/ "mention"), creating [custom-props](../../modding-guides/everything-else/custom-props/ "mention") or [adding-new-items](../../modding-guides/items-equipment/adding-new-items/ "mention"). You will overwrite an existing in-game mesh, the file path doesn't matter.

### Static items

If you are [creating props](../../modding-guides/everything-else/custom-props/), you use a mesh from the template project or grab any static mesh from the game.&#x20;

{% hint style="warning" %}
Do not take equipment item or weapon meshes — those include a bunch of extra data that you don't need (the [armature](meshes-and-armatures-rigging/)). You don't need it, and it can have side effects.
{% endhint %}

As this guide will focus on equipment items, you can skip Step 3 and 4 completely.

### Equipment items

If you want V to wear the item that you're currently porting, it needs to move with the player. For that, you need [an armature](meshes-and-armatures-rigging/). This guide will show you how to acquire one.&#x20;

{% hint style="info" %}
You will delete fewer meshes if you read all of the sections below before starting.
{% endhint %}

<details>

<summary>Why are we doing this?</summary>

Items move because they are tied to the armature's bones. For that to work, the armature you're working needs to **have** those bones in the first place. Most shoe meshes won't include head bones, which means that they won't work for sunglasses.

Every piece of equipment needs its own armature, or it will just vaguely float around V's position.

The default fallback mesh that people use in this case is the [Netrunner Suit](troubleshooting-your-mesh-edits.md#option-2-the-netrunner-suit).

</details>

You can use the [Wolvenkit search](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files) in the [Asset Browser](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/asset-browser) to find meshes.

#### The right slot

Begin by picking a game mash from **the right slot**. If you're porting shoes, pick a shoe mesh, if you're porting glasses, pick a glasses mesh – you get it.

#### The right shape

For the sake of future you, pick an in-game item that is as close to your new garment as possible. If you're porting boots, take boots and not slippers. If you're using a baggy sweater, pick one of those or a jacket rather than a skin-tight t-shirt.&#x20;

#### The right body gender

Make sure to use an item with the correct armature. You can identify them by prefix in the path:&#x20;

<table><thead><tr><th width="194">body gender</th><th width="268">Player</th><th>NPC</th></tr></thead><tbody><tr><td>male rigged</td><td><code>_pma_</code></td><td><code>_ma_</code></td></tr><tr><td>female rigged</td><td><code>_pwa_</code></td><td><code>_wa_</code></td></tr></tbody></table>

#### Wolvenkit search query suggestions

Search for something like this:

```
namespace > slot > gender > .mesh

player: player > torso > pwa > .mesh 
npc:    common > torso > pwa > .mesh 
```

For torso items, you can add `t1` for inner torso items (tight-fitting) or `t2` for outer torso items (worn above t1).

## Step 1: Exporting your mesh from Wolvenkit

### Export from Wolvenkit

For **where** to export a mesh, see [Tools: Import/Export UI](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/tools/tools-import-export "mention")

For **how** to export a mesh, see  [wkit-blender-plugin-import-export.md](../modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-import-export.md "mention") -> [#meshes](../modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-import-export.md#meshes "mention") -> [#export-from-wolvenkit](../modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-import-export.md#export-from-wolvenkit "mention")

{% hint style="info" %}
If your mesh won't export from Wolvenkit, try unchecking the following box(es) in the export settings (by unchecking the boxes):&#x20;

* [Export Materials (default)](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export/models#export-materials-default "mention")
* [Export Garment Support (default)](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export/models#export-garment-support-default "mention")
{% endhint %}

Once you are done, you can find the exported glb in your project's raw folder (see [Project Explorer Tabs](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/project-explorer#project-explorer-tabs "mention") or[File Structure: the raw folder](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export#file-structure-the-raw-folder "mention") for details).

## Step 2: Importing your mesh into Blender

For **how** to import a mesh into Blender see  [wkit-blender-plugin-import-export.md](../modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-import-export.md "mention") -> [#meshes](../modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-import-export.md#meshes "mention") -> [#importing-into-blender](../modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-import-export.md#importing-into-blender "mention")

### Step 2.5: getting a grip on the submesh count

The **mesh count** in Blender corresponds to the [**submesh/chunk** ](../files-and-what-they-do/file-formats/3d-objects-.mesh-files/submeshes-materials-and-chunks.md)count in Wolvenkit. In Cyberpunk, we have one submesh per material that we want to use.&#x20;

If you don't know what that means, ignore the information for now - but few meshes use more than five. The current maximum is the player base body with a total count of ten submeshes per LOD[^1], so to be on the safe side, we need to stay below that.

If you want to get fancy, check out [Step 2](../../modding-guides/textures-and-luts/textured-items-and-cyberpunk-materials.md#step-2-processing-the-downloaded-mesh) in the guide about ported items and Cyberpunk materials. Otherwise:

1. Select all meshes but one by shift-clicking them in the Outliner at the topright of your viewport

<figure><img src="../../.gitbook/assets/porting_clothes_too_many_meshes.png" alt=""><figcaption><p>9000 of these have to go</p></figcaption></figure>

2. Select the last mesh
3. Join the meshes together (Shortcut: `Ctrl+J`)

## Step 3: Parenting the mesh(es)

### The end result

This section will show you how to get the following end result:

* one or more mesh(es) with names from `submesh_00_LOD_1`, consecutively numbered
* parented to the right armature



<figure><img src="../../.gitbook/assets/armature_modifier.png" alt=""><figcaption></figcaption></figure>

There are two strategies that you can use. Personally, I use [#strategy-1-replacing-the-3d-data](porting-3d-objects-to-cyberpunk.md#strategy-1-replacing-the-3d-data "mention"), since it will retain most of the original mesh's properties.

### Preparation

By the end of this section, you should have something like this:

<figure><img src="../../.gitbook/assets/porting_clothing_cleared_up.png" alt=""><figcaption><p>Read on to find out how to get there</p></figcaption></figure>

No matter which strategy you use, we need to get the prerequisites done first. We need an original Cyberpunk armature.

1. Import the result of Step 1 into Blender (see the [wolvenkit-blender-io-suite](../modding-tools/wolvenkit-blender-io-suite/ "mention")'s documentation about [#importing-into-blender](../modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-import-export.md#importing-into-blender "mention"))

Clean up any residual modifiers and transforms (we don't want them):

1. **If your mesh has an armature modifier** with a non-Cyberpunk armature, delete it
   1. (click on the `x` in the modifier panel)
2. **If your mesh is parented** to anything that is not a Cyberpunk armature, unparent it:
   1. Select the mesh(es)
   2. Select **Unparent** (Hotkey: `Alt+P`)
   3. Select the second option "**Clear Parent and Keep Transforms**"

### Strategy 1: Replacing the 3d data

{% hint style="info" %}
If you are doing this, you can skip[#strategy-2-parenting-the-meshes](porting-3d-objects-to-cyberpunk.md#strategy-2-parenting-the-meshes "mention").
{% endhint %}

We start by deleting the original's vertex data.

1. In [Object Mode](#user-content-fn-2)[^2], select all of the original meshes.
2. Switch to Edit Mode (Hotkey: `Tab`)
3. Make sure that all vertices are selected (Hotkey: `A`)
4. Delete all vertices (Hotkey: `x`, option: **Vertices**)

<figure><img src="../../.gitbook/assets/porting_edit_mode_select_vertices.png" alt=""><figcaption></figcaption></figure>

5. Switch back to Object Mode (Hotkey: `Tab`)

We'll merge our new meshes into the empty containers now:

1. Click on your new mesh
2. Click on the empty original mesh in the Outliner (yes, order matters)
3. Join them (Hotkey: `Ctrl+J`)

<figure><img src="../../.gitbook/assets/porting_clothes_after_merge.png" alt=""><figcaption><p>The new mesh should be  from the Outliner and its data should be in one of the original meshes. If it's the other way around, <strong>Undo</strong> (Hotkey: <code>Ctrl+Z</code>) and select them in the right order. (You could've listened!)</p></figcaption></figure>

Repeat the same for all meshes that you want to import to Cyberpunk.&#x20;

{% hint style="info" %}
If you need more submeshes, simply duplicate an existing one (Hotkey: `Ctrl+D`, `ESC`) and change its name by incrementing the number. Make sure it still ends in `LOD_1`,  not in `LOD_2` — that will tell the game it's low-poly, and cause it to be hidden until you're further away.
{% endhint %}

That's it. All your meshes are parented to the armature now.

### Strategy 2: Parenting the meshes

{% hint style="info" %}
If you are doing this, you can skip [#strategy-1-replacing-the-3d-data](porting-3d-objects-to-cyberpunk.md#strategy-1-replacing-the-3d-data "mention").
{% endhint %}

We can simply parent the meshes to our existing armature:

1. Click on your mesh
2. Click on the Armature object in the Outliner
3. Select Parent (Hotkey: `Ctrl+P`)
4. Select "Armature Deform"

<figure><img src="../../.gitbook/assets/porting_parent_object.png" alt=""><figcaption></figcaption></figure>

5. Make sure to rename your mesh: Wolvenkit doesn't know what to do with meshes that aren't part of the sequence starting at `submesh_00_LOD_1`. (Blender's .000 suffixes will be ignored)\
   You can delete the original meshes, or you keep them for Step 4.

## Step 4: Weight Transfer

Start by **deleting all vertex groups** from your new mesh, as we will now replace these and don't want anything funky to stick around to destroy our re-import:

<figure><img src="../../.gitbook/assets/image (346).png" alt=""><figcaption></figcaption></figure>

You now need to transfer the weights from your original game mesh. If you deleted or overwrote the armature's original meshes during [#step-3-parenting-the-mesh-es](porting-3d-objects-to-cyberpunk.md#step-3-parenting-the-mesh-es "mention"), you can simply import it again for a second copy.

{% hint style="info" %}
The [wolvenkit-blender-io-suite](../modding-tools/wolvenkit-blender-io-suite/ "mention") has a function to[ do this for you](../modding-tools/wolvenkit-blender-io-suite/#modelling). For the sake of completeness, the box below contains the full manual process, but we recommend using the plugin's Mesh Tool panel to do this.
{% endhint %}

<details>

<summary>Transferring weights by hand</summary>

1. Select the original mesh
2. Select your mesh
3. Select "Object -> Link Mesh Data" (Hotkey: Ctrl+L) _alternatively: the Weight Transfer menu in the Weight Painting perspective_
4. Select "Transfer Mesh Data" (second from the bottom)
5. Open the little popup at the bottom left of your viewport. Select the following options:
   1. **Data Type:** Vertex Group(s)
   2. **Vertex Mapping:** Nearest Face Interpolated
   3. **Source Layers Selection:** By Name
6. Repeat that process for all of your meshes.&#x20;

<img src="../../.gitbook/assets/porting_transfer_vertex_weights.png" alt="" data-size="original">



</details>



### Step 4.5: Weight Painting

{% hint style="info" %}
Nobody likes weight painting.
{% endhint %}

This is what you need to do if your mesh moves unevenly or if parts of it are clipping through the body although things are fitting correctly. Pray that you don't have to do it, because it sucks.

If you're unfortunate, you can find a guide on [weight-painting-for-gonks.md](meshes-and-armatures-rigging/weight-painting-for-gonks.md "mention")!

## Step 5: Exporting from Blender

See the [wolvenkit-blender-io-suite](../modding-tools/wolvenkit-blender-io-suite/ "mention")'s documentation about [#exporting-from-blender](../modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-import-export.md#exporting-from-blender "mention")

## Step 6: Importing into Wolvenkit

See the [WolvenKit](https://app.gitbook.com/o/-MP5ijqI11FeeX7c8-N8/s/-MP_ozZVx2gRZUPXkd4r/ "mention") wiki about [Importing mesh files](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export/models#importing-mesh-files "mention")

## Step 7: Success!

… or maybe not. Maybe you should try [troubleshooting-your-mesh-edits.md](troubleshooting-your-mesh-edits.md "mention") now.

If everything worked, you now have **replaced** an original Cyberpunk item. Since this is probably not what you want, check out the following guides:

* [adding-new-items](../../modding-guides/items-equipment/adding-new-items/ "mention") will walk you through the steps of adding your mesh as a new piece of equipment
* [custom-props](../../modding-guides/everything-else/custom-props/ "mention") will show you how to add props for AMM and entSpawner

Here are a few more guides that could interest you?

* [r-and-r-refitting-step-by-step.md](../../modding-guides/items-equipment/recolours-and-refits/r-and-r-refitting-step-by-step.md "mention") will teach you how to refit for a certain body mod
* [textured-items-and-cyberpunk-materials.md](../../modding-guides/textures-and-luts/textured-items-and-cyberpunk-materials.md "mention") will tell you how materials work, and how you can use them to texture your item



[^1]: Level of Detail

[^2]: You can see the mode in the topleft corner of the viewport.
