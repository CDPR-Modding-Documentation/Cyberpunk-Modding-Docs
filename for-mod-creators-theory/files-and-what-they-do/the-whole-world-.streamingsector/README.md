---
description: Documentation on .streamingsector files
---

# The whole world: .streamingsector

**Last documented update: January 27, 2024 by** [Akiway](https://app.gitbook.com/u/2021vbDrMKZ0TbHeIx2wzPyAYtl2 "mention")

{% hint style="info" %}
If you want to know how to find a streaming sector, see [here](../../references-lists-and-overviews/reference-world-sectors/places.md).

For a list of interesting locations, see [here](../../references-lists-and-overviews/reference-world-sectors/).&#x20;

For guides how to modify streaming sector files, see [here](../../../modding-guides/world-editing/).

For a (partial) list of node types and what they are, see [here](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators/references-lists-and-overviews/reference-world-sectors/reference-.streamingsector-node-types).
{% endhint %}

StreamingSectors are the files that define the world in Cyberpunk, they tell the engine what goes where, and define everything from the meshes you see and how you can interact with them, to the locations of lights, sounds and fx. They call up the NPCs, they define the minimap.&#x20;

The fundamental bits of the structure are 2 main lists, the nodes, and the nodeData. The nodes define the assets that make up the sector, and the nodeData tells the engine where to put them.  Theres a nodeRef list as well, which seem to be the link that quests use to tie in to triggers etc via the .scene files. Theres also some bits that define variants, that seem to be how sectors change after missions, not worked those out yet.

## Theory

Streaming Sectors contain the world's data, holding a node tree that includes all its models and entities.&#x20;

{% hint style="info" %}
Other than the world environment, streaming sector files can also define

* navigation
* sound
* collision
* illumination

as there are several types.
{% endhint %}

### LOD data and grid sizes

The world is broken up into a grid, with several sizes of squares available (bit like graph paper with major and minor grid lines). The size of the grid in use is dependent on the Level of Detail (LOD) of the sector file your looking at, which is the last digit of the filename.&#x20;

Chunk sizes are as below.

| LOD | Interior | Exterior |
| --- | -------- | -------- |
| 0   | 32       | 64       |
| 1   | 64       | 128      |
| 2   | 128      | 256?     |

For every location, there can be multiple overlapping levels of LOD sectors with progressively more detail as you go down the levels.&#x20;

For instance, Lizzies bar is located at approximately -1200, 1562, 22:

<figure><img src="https://820263885-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-MP_ozZVx2gRZUPXkd4r%2Fuploads%2FZ097FOMFpAHkPdzsCNNF%2Fimage.png?alt=media&#x26;token=42873787-e4b7-4bea-8138-a24e3086b692" alt=""><figcaption><p>Via AMM: this targets the bouncer rather than the bar, but they're right next to each other, so it's fine.</p></figcaption></figure>

Filenames are structured as `sectortype_X_Y_Z.streamingsector` . If you preview a sector in wkit, the axes are shown as Z=-Y and Y=Z.

#### Calculating the files

I've left the detail of the process below for record, but if you just want a list of sectors I've created a python script to find the ones that a set of co-ordinates are in. You can find it [HERE](https://mybinder.org/v2/gh/Simarilius-uk/sectorStuff/5b8a8f5536002ec2d33c16103f79c53b6b93bd8e?urlpath=lab%2Ftree%2FAllBlocks.ipynb). Simply enter the co-ordinates in the player\_loc dict in block 3 then run all blocks. You'll be given 2 lists containing of all the interior and exterior sectors which contain the co-ords within their bounding boxes. The list also shows the distance from the centre of the sectors to the co-ords given.

From those co-ordinates we can calculate the sector files for interior/exterior sectors by dividing by the grid size for the LOD and rounding. (ie 1200/32=38 etc)

| LOD | Interior   | Exterior   |
| --- | ---------- | ---------- |
| 0   | -38\_49\_0 | -19\_24\_0 |
| 1   | -19\_24\_0 | -9\_12\_0  |
| 2   | -9\_12\_0  | -5\_6\_0   |

At the level 0 files the whole building isn't covered by 1 sector, so you end up needing 4, conversely the exterior level 2 is several city blocks.&#x20;

{% hint style="info" %}
For example, the **loft apartment** uses these files:&#x20;

`interior_-24_-16_1_1.streamingsector`: inner walls, floors, collision

`interior_-48_-31_2_0.streamingsector`: interior decoration, clutter

Note that the numbers are simply duplicated and rounded down. \
_No, I don't know how you round down 2\*16 to 31 either._
{% endhint %}

Some locations are partially defined in **quest sectors**, where parts of the location are locked away behind story triggers (for example half of V's apartment, as a lot of decoration will only be shown after completing quests). The exact process isn't fully understood as of May 2023.



***

## Block and sector's variants

A steamingsector can split its nodes into ranges called variants. A variant is used to display/enable an amount of nodes in a specific situation (like during or after a quest). All sectors and their variants need to be declared somewhere; this place is the streamingblock.

We will see how they are declared and how they are linked together.

### Streamingblock

The game contains only 3 streamingblocks that gather more than 26300 sectors.\
We will focus on the main one and take a look at the first sector inside (`exterior_-18_3_-12_0`).

{% hint style="info" %}
When creating a mod with sectors, you will need to create your own block that will list your new sectors.
{% endhint %}

<figure><img src="../../../.gitbook/assets/world_streamingsector__block (1).png" alt=""><figcaption></figcaption></figure>

This sector has 10 variants, in this case, each one is related to a quest state.

`numNodeRanges` indicate the number of node ranges the sector contains; it always corresponds to the number of variant + sector's default range (so here 10 variants + 1 default).



When opening a variant definition, we can find the range index (to find the right range inside the sector file). `rangeIndex` cannot be 0, 0 is used as sector's default range.

Variant's name is only used to identify the variant within the streamingblock.

`enableDyDefault` is self-explanatory; it indicates whether it should be enabled by default.

<figure><img src="../../../.gitbook/assets/world_streamingsector__block_variant.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
The link between quests and sectors' variants is not well-researched as of Jan 2024 - if you know anything more about this, please get in touch via [Discord](http://discord.gg/redmodding) or update the wiki!
{% endhint %}

### Sector variants and ranges

The sector file uses 2 arrays to define ranges: `variantIndices` and `variantNodes`.

`variantNodes` contains as many empty arrays as variants (in this case, 10).

`variantIndices` contains as many values as ranges needed (10 variants + 1 default range)

<figure><img src="../../../.gitbook/assets/world_streamingsector__sector_indices.png" alt=""><figcaption></figcaption></figure>

A **variant indice** indicates the range starting nodeData index. This range goes from the index specified to the start of the following range. If we look at variant indice #7, the range starts at node index 14 (included) and ends at node index 46 (excluded).

A sector always has a **default range** (variant indice 0); this default range indicates which nodes must always be visible/enable, whatever are the variants state. In our example, the default range goes from 0 to 1, so only the first node is always enabled.

### Global overview

Here is an overview of files relations:

<figure><img src="../../../.gitbook/assets/world_streamingsector__resume.png" alt=""><figcaption></figcaption></figure>
