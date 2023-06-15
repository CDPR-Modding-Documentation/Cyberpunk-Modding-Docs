---
description: Item spawn codes and how they link to appearances
---

# Spawn Codes (BaseIDs/Hashes)

## Lists

A selection of lists for looking up item codes. Alternatively, you can browse through the game's files, or search e.g. the [fandom](https://cyberpunk.fandom.com/wiki/Cyberpunk\_2077\_Clothing) wiki.

|                                                                                                                                                 |                                                 |
| ----------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| [Google Doc](https://docs.google.com/document/d/e/2PACX-1vRJaq1sHobpHjNxPzjtSHVltNUXU6g5uYUfjw9zgrfaC9MQzEmEXFsqDcYVJDWS5cdpGuixH\_A\_n2fN/pub) | A list with BaseIDs                             |
| [Google Sheet](https://docs.google.com/spreadsheets/d/1UeEA0ONMtF6CNl1Cutkb4DNJ\_JiabhstfwiaA94m0ds/edit)                                       | Google Sheets (August 2022), supports filtering |
|                                                                                                                                                 |                                                 |

{% hint style="danger" %}
Player equipment only: \
\
Not all items that you find in the player folder are actually hooked up to spawn. If you can't [find an app file](spawn-codes-baseids-hashes.md#the-.app), you ran into one of those. &#x20;
{% endhint %}

## From a BaseID to an item's materials

{% hint style="info" %}
As an example, this will use `Reinforced Puffer Vest (Items.Vest_17_basic_01)`
{% endhint %}

### The base ID

An item's spawn code is called **BaseID**. It looks like this:&#x20;

```
Vest_17_basic_01
```

and will be used to spawn items via CET (`Game.AddToInventory("Items.Vest_17_basic_01")`).&#x20;

A base ID consists out of two parts. The first one (Vest\_17) determines the item, the second one (basic\_01) determines the variant.

## Finding the files

Head to WolvenKit and search for the first part of the BaseID:

<figure><img src="../../../.gitbook/assets/image (1) (4).png" alt=""><figcaption><p>Search WolvenKit for the first part of the BaseID</p></figcaption></figure>

You will find at least one **entity file** and an **appearance file**.&#x20;

{% hint style="warning" %}
If you find multiple files, you need to open the correct one. You can identify those by the folder path: for player meshes, the name of the last folder will contain either `_pwa_` or `_pma_`, and the path will include either that or `player`.
{% endhint %}

### The .app

Open the apperance file. You will see a bunch of appearances:

<figure><img src="../../../.gitbook/assets/image (26) (1).png" alt=""><figcaption></figcaption></figure>

We only care for `_m` and `_w` right now, since they are using different meshes. \
Open the array `components` and find the one holding the mesh:&#x20;

<figure><img src="../../../.gitbook/assets/image (8) (2).png" alt=""><figcaption><p>basic_01 is using "default" material (green)</p></figcaption></figure>

We can see that the `basic_01` appearance is using the `default` material, and the `basic_02` appearance is using the `bbstripes` material:

<figure><img src="../../../.gitbook/assets/image (5) (1).png" alt=""><figcaption><p>base_02 is using "bbstripes" material</p></figcaption></figure>





{% hint style="info" %}
To find your way through the mesh, check the guide for [recoloring items](../../modding-guides/items-equipment/editing-existing-items/changing-materials-colors-and-textures.md#step-2-finding-the-correct-appearance)!
{% endhint %}

{% content-ref url="../../modding-guides/items-equipment/editing-existing-items/changing-materials-colors-and-textures.md" %}
[changing-materials-colors-and-textures.md](../../modding-guides/items-equipment/editing-existing-items/changing-materials-colors-and-textures.md)
{% endcontent-ref %}





