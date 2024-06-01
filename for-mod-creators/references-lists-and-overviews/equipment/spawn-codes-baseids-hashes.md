---
description: Item spawn codes and how they link to appearances
---

# Spawn Codes (BaseIDs/Hashes)

## What's a BaseID?

Each item is **uniquely identified** by this string[^1]. You can use it to spawn items via [Cyber Engine Tweaks](https://app.gitbook.com/s/-MP5jWcLZLbbbzO-\_ua1-887967055/console/console#console-ui) with the following command:&#x20;

```
Game.AddToInventory("Items.money", 5000)
```

`Items.money` is the baseID for eddies, and the 5000 will stuff 5 grand into your pocket.

## Lists of Base IDs

{% hint style="info" %}
You can usually find any BaseID on the [fandom](https://cyberpunk.fandom.com/wiki/Cyberpunk\_2077\_Clothing) wiki. Search for a game item, then expand the section "technical details" in the box to the right.
{% endhint %}

A selection of lists for looking up item codes. Alternatively, you can browse through the game's files, or search the web.

|                                                                                                                                                 |                                                                                                                                                                                     |
| ----------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Excel Sheet](https://1drv.ms/x/s!ArM35g0UkWjvjcVPT-fhFPPCZUfDLw?e=BOxScl) (2.0 compatible)                                                     | <p>Excel sheet from <code>#cet-commands</code> on <a href="https://discord.gg/redmodding">Discord</a> with item codes. <br>Please note the <strong>tabs</strong> at the bottom.</p> |
| [Google Doc](https://docs.google.com/document/d/e/2PACX-1vRJaq1sHobpHjNxPzjtSHVltNUXU6g5uYUfjw9zgrfaC9MQzEmEXFsqDcYVJDWS5cdpGuixH\_A\_n2fN/pub) | A list with BaseIDs                                                                                                                                                                 |
| [Google Sheet](https://docs.google.com/spreadsheets/d/1UeEA0ONMtF6CNl1Cutkb4DNJ\_JiabhstfwiaA94m0ds/edit)                                       | Google Sheets (August 2022), supports filtering                                                                                                                                     |

## Item Previews (pretty pictures!)

| List                                                                                        | Description                                                   |
| ------------------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| [2.1: github (Chief Sosa)](https://khaganmv.github.io/)                                     | all items, on mascV, with CET spawn codes                     |
| [Steam: garments](https://steamcommunity.com/sharedfiles/filedetails/?id=2328941813) (m!V)  | Spawn codes to in-game names, with many screenshots on masc V |
| [cp2077.8713.su](https://cp2077.8713.su/) (f!V)                                             | Screenshots on femme V with spawn codes                       |
| [Steam: Cyberware](https://steamcommunity.com/sharedfiles/filedetails/?id=2343787921)       |                                                               |
| [Steam: Quickhacks](https://steamcommunity.com/sharedfiles/filedetails/?id=2350003795)      |                                                               |

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

<figure><img src="../../../.gitbook/assets/image (17).png" alt=""><figcaption><p>Search WolvenKit for the first part of the BaseID</p></figcaption></figure>

You will find at least one **entity file** and an **appearance file**.&#x20;

{% hint style="warning" %}
If you find multiple files, you need to open the correct one. You can identify those by the folder path: for player meshes, the name of the last folder will contain either `_pwa_` or `_pma_`, and the path will include either that or `player`.
{% endhint %}

### The .app

Open the apperance file: this is where the item and its variants are actually defined.&#x20;

{% hint style="info" %}
To learn more about this, you can check [appearance-.app-files](../../files-and-what-they-do/appearance-.app-files/ "mention")
{% endhint %}

You will see a bunch of appearances:

<figure><img src="../../../.gitbook/assets/image (24).png" alt=""><figcaption></figcaption></figure>

We only care for `_m` and `_w` right now, since they are using different meshes. \
Open the array `components` and find the one holding the mesh:&#x20;

<figure><img src="../../../.gitbook/assets/image (51).png" alt=""><figcaption><p>basic_01 is using "default" material (green)</p></figcaption></figure>

We can see that the `basic_01` appearance is using the `default` material, and the `basic_02` appearance is using the `bbstripes` material:

<figure><img src="../../../.gitbook/assets/image (95).png" alt=""><figcaption><p>base_02 is using "bbstripes" material</p></figcaption></figure>





{% hint style="info" %}
To find your way through the mesh, check the guide for [recoloring items](../../modding-guides/items-equipment/editing-existing-items/changing-materials-colors-and-textures.md#step-2-finding-the-correct-appearance)!
{% endhint %}

{% content-ref url="../../modding-guides/items-equipment/editing-existing-items/changing-materials-colors-and-textures.md" %}
[changing-materials-colors-and-textures.md](../../modding-guides/items-equipment/editing-existing-items/changing-materials-colors-and-textures.md)
{% endcontent-ref %}







[^1]: Netrunner-ese for "text"

