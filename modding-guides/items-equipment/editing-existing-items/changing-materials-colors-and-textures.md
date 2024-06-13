---
description: Changing how an item looks in-game
---

# Changing materials, colors and textures

## Summary <a href="#summary" id="summary"></a>

**Created by @manavortex**\
**Published November 05 2022**

This guide will teach you how to change an item's appearance by editing its MultilayerSetup (\*.mlsetup file), how to rename materials, and how add your own mlsetups (**custompathing**).

{% hint style="success" %}
For a step-by-step walkthrough for a recolour of the Netrunner suit, check [r-and-r-colour-editing.md](../recolours-and-refits/r-and-r-colour-editing.md "mention")

If you want to edit emissive (glowing) material, check [r-and-r-emissive.md](../recolours-and-refits/r-and-r-emissive.md "mention") -> [#changing-the-presets](../recolours-and-refits/r-and-r-emissive.md#changing-the-presets "mention")
{% endhint %}

It uses the following versions:

* WolvenKit >= 8.11 ([Nightly](https://github.com/WolvenKit/WolvenKit-nightly-releases/releases) | [Stable](https://github.com/WolvenKit/Wolvenkit/releases))
* [MLSetupBuilder](../../../for-mod-creators-theory/modding-tools/mlsetup-builder/) >= 1.6.7 (get the [latest release](https://github.com/Neurolinked/MlsetupBuilder/releases/))

{% hint style="info" %}
Most items in Cyberpunk are not textured, but use a procedurally generated material consisting out of an [mlmask](../../../for-mod-creators-theory/materials/multilayered/#what-is-the-mlmask) (a list of alpha masks) and an [mlsetup](../../../for-mod-creators-theory/materials/multilayered/#what-is-the-mlsetup) (a list of material paths and -colours). There is a section on the exceptions below.

If you want to learn how mesh material assignment works in general, you can check the [corresponding page](../../../for-mod-creators-theory/files-and-what-they-do/3d-objects-.mesh-files/#material-assignment).
{% endhint %}

{% hint style="success" %}
For an overview of base materials and example files, you can check [here](../../../for-mod-creators-theory/references-lists-and-overviews/cheat-sheet-materials.md).
{% endhint %}

{% hint style="warning" %}
If your changes do not become active, you will want to install [Material and Texture Override](https://www.nexusmods.com/cyberpunk2077/mods/5266) from Nexus.
{% endhint %}

## Video guide

Please keep in mind that video guides might be outdated, as they are much more difficult to update than a wiki page. Refer to the written guide below if you run into any troubles!

{% embed url="https://youtu.be/HLwjKM8YDlA?si=U6aHXud4BRu8rLqi" %}

## **Step 1: Finding your item**

{% hint style="info" %}
This tutorial assumes that you already know which mesh and appearance you want to change. If you don't know that, you need to [find the correct game file](replace-a-player-item-with-an-npc-item/#summary). If you only have a cheat code, see [Spawn Codes](../../../for-mod-creators-theory/references-lists-and-overviews/equipment/spawn-codes-baseids-hashes.md#the-.app) instead.
{% endhint %}

We will use the female variant of the puffy vest (as I've already [mapped and documented it](../../../for-mod-creators-theory/references-lists-and-overviews/equipment/variants-and-appearances.md#reinforced-puffer-vest-4-variants)):

```
base\characters\garment\player_equipment\torso\t2_002_vest__puffy\t2_002_pwa_vest__puffy.mesh
```

{% hint style="success" %}
Add the item to your project and open it in WolvenKit. You want the original to look up material names, even if you overwrite it with your own mesh.
{% endhint %}

## Step 2: Finding the correct appearance

{% hint style="info" %}
If you don't know which appearance you want to edit, check [here](../../../for-mod-creators-theory/references-lists-and-overviews/equipment/spawn-codes-baseids-hashes.md#the-.app).&#x20;

`default` is the fallback appearance that'll be used if anything can't be resolved by name or index. This is the reason why most item swap mods give you only a single appearance - people didn't set up the [variants](replace-a-player-item-with-an-npc-item/).
{% endhint %}

We will change the appearance `bwstripes`, which is used by `Vest_17_basic_01`:

<div align="center">

<figure><img src="../../../.gitbook/assets/image (11).png" alt=""><figcaption><p>find material bwstripes and remember the name of the chunkMaterial</p></figcaption></figure>

</div>

{% hint style="info" %}
`chunkMaterials` corresponds to the `chunkMasks`: For submesh\_00, the material at array position 0 will be used, for submesh\_01 the material at position 1, and so on.
{% endhint %}

This vest has only one chunkMask, so there's only one material.&#x20;

Remember its name (`ml_t2_002_ma_vest__puffy_bwstripes`) and find the corresponding material definition:

{% hint style="warning" %}
Most meshes have their materials under `localMaterialBuffer/materials`. However, some of them (especially those with physics) use `preloadLocalMaterialInstances` instead.
{% endhint %}

<figure><img src="../../../.gitbook/assets/image (59).png" alt=""><figcaption><p>It's ml_t2_002_ma_vest__puffy_bwstripes</p></figcaption></figure>

You will (hopefully) see a material with three entries in `values` (order doesn't matter):

<table><thead><tr><th width="213">Key</th><th>Value (DepotPath)</th></tr></thead><tbody><tr><td>MultilayerSetup</td><td><code>base\characters\garment\citizen_casual\torso\t2_002_vest__puffy\textures\ml_t2_002_ma_vest__puffy_bwstripes.mlsetup</code></td></tr><tr><td>MultilayerMask</td><td><code>base\characters\garment\citizen_casual\torso\t2_002_vest__puffy\textures\ml_t2_002_ma_vest__puffy_default.mlmask</code></td></tr><tr><td>GlobalNormal</td><td><code>base\characters\garment\citizen_casual\torso\t2_002_vest__puffy\textures\t2_002_ma_vest__puffy_n01.xbm</code></td></tr></tbody></table>

For the purpose of this guide, all that matters is the mlsetup, which determines all the individual material assignments in this CMaterial. For an explanation of the shader, check [here](../../../for-mod-creators-theory/materials/multilayered/).

<figure><img src="../../../.gitbook/assets/image (55).png" alt=""><figcaption><p>This is the path to the mlsetup file. By editing this, you can change colours and surface materials.</p></figcaption></figure>

{% hint style="info" %}
If you have your own mlsetup file, this is where you need to set tohe path. See [custompathing](changing-materials-colors-and-textures.md#step-4-optional-custompathing) for further details.
{% endhint %}

{% hint style="success" %}
Most materials in Cyberpunk use the `engine\materials\multilayered.mt` material and assign colours via an .mlsetup file. If you're used to textures, you are probably going to hate this. As somebody who has been where you are: **the mlsetup system is cool**. Genuinely. Give it a chance!&#x20;
{% endhint %}

### multilayered material&#x20;

{% hint style="success" %}
If you would rather use a textured material, check [here](../../../for-mod-creators-theory/materials/configuring-materials/#textured-material).
{% endhint %}

A multilayered material consists of multiple layers of materials, projected on the mesh through the mlmask: white parts get affected, black parts are blocked out. (Again, for a full explanation, check [here](../../../for-mod-creators-theory/materials/multilayered/)).&#x20;

{% hint style="info" %}
You can turn any multilayered material into its cyberspace variant by changing the material from `engine\materials\multilayered.mt` to `base\characters\common\cyberspace\silverhand_overlay_cyberspace_mml.mi`
{% endhint %}

<figure><img src="../../../.gitbook/assets/multilayered.png" alt=""><figcaption></figcaption></figure>

### Exporting the .mlsetup

We're going to edit the mlsetup file and then import it back, causing a global change in the appearances of every item which uses this particular material file. (If you don't want that, see [Custompathing](changing-materials-colors-and-textures.md#step-4-optional-custompathing) below).

We do that by editing the **MultilayerSetup**. Check the MLSetupBuilder wiki page for how to do that.

1. Find the file that you want to edit in the [Asset Browser](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files).&#x20;
2. Add it to your Wolvenkit project.
3. In the project explorer under Wolvenkit's `archive` folder, right-click on am `mlsetup` file\
   _This folder will only be visible in the "source" or "archive" tab of your_ [_project explorer_](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/project-explorer)
4. Select "[Convert to JSON](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export/import-export-as-json#export-as-json)"

## Step 3: Editing the .mlsetup file

{% hint style="info" %}
If you don't have MLSetupBuilder installed, you need to [do that now](../../../for-mod-creators-theory/modding-tools/mlsetup-builder/#installation). If you don't know how to use it, please check [#using-mlsb](../../../for-mod-creators-theory/modding-tools/mlsetup-builder/#using-mlsb "mention")
{% endhint %}

1. Optional: If you don't see an `mlsetup.json` in your project, switch the [Project Explorer](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/project-explorer) to `source` or `raw`.
2. Right-click on the file and [open it in MLSetupBuilder](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/project-explorer#open-in-mlsetupbuilder).

<details>

<summary>Optional: by hand</summary>

Open up MlSetupBuilder and load your .mlsetup.json file.

If you select WolvenKit's "Open in File Explorer" option, you can copy the path from the explorer's address bar and paste it into the MlSetupBuilder's address bar.

<img src="../../../.gitbook/assets/image (110).png" alt="" data-size="original">

</details>

{% hint style="success" %}
For a documentation of multilayer properties, see [here](../../../for-mod-creators-theory/materials/configuring-materials/multilayered-material-properties-1.md). For a list of reference images, check [multilayered-previews.md](../../../for-mod-creators-theory/materials/multilayered/multilayered-previews.md "mention")
{% endhint %}

3. [Draw the rest of the owl](https://knowyourmeme.com/memes/how-to-draw-an-owl) and [edit the mlsetup](../../../for-mod-creators-theory/modding-tools/mlsetup-builder/#using-mlsb).&#x20;
4. Export the file, overwriting the original `.mlsetup.json`
5. Switch back to Wolvenkit
6. Right-click on the `.mlsetup.json` and [import it from json.](https://wiki.redmodding.org/wolvenkit/wolvenkit-app/usage/import-export/import-export-as-json)

{% hint style="success" %}
This is already working. You can pack the project and see it in action!
{% endhint %}

<figure><img src="../../../.gitbook/assets/image (14).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
Since you haven't changed anything in the mesh itself, you can (and should) delete it from your mod. Only keep it if you want to do the steps below.
{% endhint %}

## Step 4 (optional): Custompathing

If you want to put up your own .mlsetup, rather than overwriting the original one, you can do that. All you have to do is changing the DepotPaths to the relative path of your mlsetup.

<figure><img src="../../../.gitbook/assets/image (68).png" alt=""><figcaption></figcaption></figure>

{% hint style="warning" %}
Keep your folder and file names unique! If you have two mods adding a file at the same location, the second one **will be unable to overwrite it** and will use the first mod's file. That is, unless your mods are in REDmod format, which will be loaded even later and in order of their folder names.

Understood? No? That's fine. Just keep it unique. :D
{% endhint %}

## Step 5 (optional): Renaming materials

You can rename a material by changing the "name" property inside the `CMeshMaterialEntry` in the `materials` array:&#x20;

<figure><img src="../../../.gitbook/assets/image (53).png" alt=""><figcaption></figcaption></figure>

{% hint style="warning" %}
Inside the appearances block, the material assignment to the individual submeshes happens by name, so don't forget to change the `chunkMaterial` names!
{% endhint %}

## Step 6 (optional): adding new materials

To add a new material to a mesh, you need to create **two** entries. The first of those needs to be in the **materialEntries** array:

<figure><img src="../../../.gitbook/assets/item_appearance_add_name_step_1.png" alt=""><figcaption><p>Edit the new material's index and name. This is crucial!</p></figcaption></figure>

Now, add an entry in the localMaterialBuffer.

{% hint style="info" %}
If your mesh doesn#t have entries under `localMaterialBuffer`, use `preloadLocalMaterialInstances`  instead.
{% endhint %}

<figure><img src="../../../.gitbook/assets/editing_material_adding_entry (1).png" alt=""><figcaption><p>The new material will have the name you defined in the CMeshMaterialEntry in the previous step.</p></figcaption></figure>

You can now use your new material just like the regular, old materials.
