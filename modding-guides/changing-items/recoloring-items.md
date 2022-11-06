---
description: Changing how an item looks in-game
---

# Recoloring items

## Summary <a href="#summary" id="summary"></a>

**Created by @manavortex**\
**Published November 05 2022**

****

****

This page will teach you how to change an item's appearance by editing its MultilayerSetup (\*.mlsetup file) and how to **custompath** mlsetups.

{% hint style="success" %}
To edit \*.mlsetup files, you'll want to use [MLSetupBuilder](../../modding-know-how/modding-tools/mlsetup-builder.md) ([download](https://github.com/Neurolinked/MlsetupBuilder)).
{% endhint %}

In general, an item's appearance is determined by a [mlsetup](../../developers/shaders/multilayered.md#what-is-the-mlsetup) file containing several material layers. Which of these layers affects which part of your mesh will be determined in the corresponding [mlmask](../../developers/shaders/multilayered.md#what-is-the-mlmask) file.

## **Step 1: Finding your item**

Before you can edit an item's appearance, you need to find the correct game file. To do this, you can consult the lists under "[Equipment](../../modding-know-how/references-lists-and-overviews/equipment/)", or browse through the game's files.

This tutorial will use the female variant of the puffy vest:

```
base\characters\garment\player_equipment\torso\t2_002_vest__puffy\t2_002_pwa_vest__puffy.mesh
```

Add the item to your project and open it in WolvenKit.

## Step 2: Finding the correct appearance

{% hint style="info" %}
For a guide of how to trace your item's spawn code to the appearance, check [here](../../modding-know-how/references-lists-and-overviews/from-spawn-code-to-item.md).
{% endhint %}

You will find the list with appearances at the very top of your mesh:

<figure><img src="../../.gitbook/assets/image (22).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
`chunkMaterials` corresponds to the `chunkMasks` (submeshes).&#x20;
{% endhint %}

This vest has only one chunkMask, so there's only one material. Remember its name and find it here:

{% hint style="info" %}
default is the fallback appearance that'll be used if anything can't be resolved by name or index
{% endhint %}

## Step 3: Editing the .mlsetup file

## Step 4: Testing

