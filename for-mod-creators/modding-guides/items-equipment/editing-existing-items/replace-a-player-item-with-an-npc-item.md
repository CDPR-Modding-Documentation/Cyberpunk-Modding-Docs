---
description: Put your item in place of a default game item. Supports variants.
---

# Replace a player item with an NPC item

### Summary <a href="#summary" id="summary"></a>

**Created by @manavortex**\
**Published November 05 2022**



This tutorial will teach you how to switch a player mesh for an NPC garment and map its variants to the existing colours.

Other relevant know-how for this process:&#x20;

* [Finding an item's spawn code and mesh](../../../references-lists-and-overviews/equipment/spawn-codes-baseids-hashes.md#from-a-baseid-to-an-items-materials)
* [Editing mesh appearances](changing-materials-colors-and-textures.md)

For a guide how to import meshes into Cyberpunk, check [here](../../../3d-modelling/exporting-and-importing-meshes/).

{% hint style="danger" %}
Make sure that you replace an item that you can actually spawn — not all items in V's folder are actually spawn-able.&#x20;
{% endhint %}

## Step 1: Replace the mesh

Find the mesh that you want to use ("**target mesh**") and replace it with the one that you want to switch in ("**source mesh**").

{% hint style="info" %}
Example: Replacing the short-sleeved poser jacket with the monk shirt with the tied-back sleeves.​
{% endhint %}

| target mesh | `base\characters\garment\player_equipment\torso\t2_084_jacket__short_sleeves\t2_084_pwa__short_sleeves.mesh`                |
| ----------- | --------------------------------------------------------------------------------------------------------------------------- |
| source mesh | <p><code>base\characters\garment\gang_monk\torso\t2_135_jacket__monk_shirt\t2_135_wa_jacket__monk_shirt.mesh</code><br></p> |

1. Find both files and add them to your project.&#x20;
2. Move the source mesh to the target mesh's folder.
3. Rename the target mesh (e.g. "`t2_084_pwa__short_sleeves.mesh`" -> "`original.mesh`").&#x20;
4. Rename the source mesh to the target mesh (e.g. "`t2_135_wa_jacket__monk_shirt.mesh`" -> "`t2_084_pwa__short_sleeves.mesh`")
5. Open both meshes in WolvenKit

<figure><img src="https://i.imgur.com/CzSBCvS.png" alt=""><figcaption><p>Target (original) mesh and its variants</p></figcaption></figure>

<figure><img src="https://i.imgur.com/1sj58tA.png" alt=""><figcaption><p>Source (new) mesh and its variants</p></figcaption></figure>

## Step 2: Change the .mlsetups

Before we can edit the mlsetups, we need to find out which spawn code corresponds to which meshMeshAppearance. The process is pretty straightforward — it's documented [here](../../../references-lists-and-overviews/equipment/spawn-codes-baseids-hashes.md#from-a-baseid-to-an-items-materials).

{% hint style="info" %}
The wiki has a list with [mappings](../../../references-lists-and-overviews/equipment/variants-and-appearances.md) for easy lookup. Feel free to add to it!
{% endhint %}



<figure><img src="https://i.imgur.com/MnUWU6O.png" alt=""><figcaption></figcaption></figure>



For example, the appearance "**black**" with the chunks pointing at **pasted\_ml\_t2\_135\_wa\_jacket\_\_monk\_shirt\_fancy** will look for:

<table><thead><tr><th width="106">yes</th><th>archive\base\characters\garment\gang_monk\torso\t2_135_jacket__monk_shirt\textures\ml_t2_135_wa_jacket__monk_shirt_fancy.mlsetup</th></tr></thead><tbody><tr><td>no</td><td><del>base\characters\garment\player_equipment\torso\t2_084_jacket__short_sleeves\textures\ml_t2_135_wa_jacket__monk_shirt_fancy.mlsetup</del></td></tr></tbody></table>

~~_Don't ask me how the lookup/naming works, I have no idea. Just copy it from the source mesh._~~

The **names** of the meshMeshAppearance need to be taken from the **target** mesh - when spawning an item, the game will look for the variant "black", since that's mapped to the corresponding item code.\
The **values** in the chunkMaterials belong to the **source** mesh.&#x20;

Rename all the variants in the source mesh with those from the target mesh. Then, make sure that you can tell them apart (e.g. by giving each variant an individual appearance or colouring the mlmasks. What worked for me was using primary colours on the mlmasks, and then using each of them fully or with plastic sleeves. Your mileage may vary.)

## Step 3: Success!

After you've found out which spawn code corresponds to which appearance, you can now [alter the appearance files](changing-materials-colors-and-textures.md).&#x20;

Enjoy!

\


Cyberpunk 2077 Modding
