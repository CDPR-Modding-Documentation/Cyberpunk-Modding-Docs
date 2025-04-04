---
description: How (and why) to split up meshes
---

# Submeshes, Materials and Chunks

## Summary

Published: January 06 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

## Why are submeshes?

In Cyberpunk, you can assign **one material per submesh**.&#x20;

{% hint style="info" %}
Material assignment is done in the .mesh file's [`appearances`](./#step-1-appearances) array via [chunkMaterials](./#chunkmaterials).&#x20;

The chunkMaterial entries correspond to [material entry](./#material-entry) names.

You can see which submesh is wich in the [#mesh-preview](./#mesh-preview "mention") tab.
{% endhint %}

At first, this seems a bit counter-intuitive, but keep in mind that Cyberpunk's entire material system is geared for **flexibility**. By altering **a single submesh material**, a black Arasaka helmet with red lights and a Hello Kitty hologram can become a black Militech helmet with red lights and a Hello Kitty hologram!

<figure><img src="../../../../.gitbook/assets/chunkmasks_chunkmaterials.png" alt=""><figcaption></figcaption></figure>

To learn how materials work, check the parent page: [.](./ "mention")

<details>

<summary>Example: the more detailed explanation</summary>

Our fictional helmet appearance uses the materials `helmet_mlsetup_black`, `visor_dark`, `hologram_hellokitty`, `decals_arasaka` and `emissive_tubes_red`. There are at least three more materials / variants defined for every possible slot, but the default appearance is a black helmet with red lights, Arasaka decals, and a Hello Kitty face projected on its black visor. Or in short: major-league professional tactical gear.

**Submesh 0** is the main body of the helmet. It uses a multilayered material (something incredibly cool and tech-y, no doubt). The default helmet is black, but by re-using the same [.mlmask](../../../materials/multilayered/#what-is-the-mlmask), different colour schemes can easily be created with different [.mlsetup](../../../materials/multilayered/#what-is-the-mlsetup)s.

**Submesh 1** is the visor. It uses a glass shader. There's also a transparent version, but this appearance isn't using it.

**Submesh 2** is a decal — a hologram projected on the visor. This one uses hello\_kitty. Alternative appearances use Venom and Pacman. (Or whatever else you can dream of)

**Submesh 3** are the regular decals - for this appearance, Arasaka style.&#x20;

**Submesh 4** are emissive tubes — they come in red, white, and blue.

</details>

## Submeshes in Blender

In Blender, our helmet would look like this:

<figure><img src="../../../../.gitbook/assets/chunkmasks_the_model_in_blender.png" alt=""><figcaption></figcaption></figure>

You can create more submeshes by splitting off parts of a mesh, and incrementing the submesh index.&#x20;

#### Example:

You want red and blue glowing tubes on the example helmet.

1. [Split](../../../../modding-guides/textures-and-luts/textured-items-and-cyberpunk-materials.md#splitting-off-submeshes-mildly-advanced) parts of `submesh_04_LOD_1` into `submesh_04_LOD_1.001`
2. Re-name `submesh_04_LOD_1.001` to `submesh_05_LOD_1`
3. [Export](../../../modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-import-export.md#exporting-from-blender) the new geometry and import it into Wolvenkit
4. Your mesh will now have **six** submeshes instead of its previous **five**
5. For each **appearance** that you have defined, add a chunkMaterial entry. \
   &#xNAN;_&#x49;f you skip this step, the new submesh will have no material assigned, and be invisible._

## Chunkmasks: partially hiding meshes

{% hint style="info" %}
To hide parts of the body, you can also use ArchiveXL tags. See [#base-game-tags-and-archivexl-tags-visual-guides](../../../../for-mod-creators/core-mods-explained/archivexl/archivexl-tags.md#base-game-tags-and-archivexl-tags-visual-guides "mention") and the corresponding wiki page for more information.
{% endhint %}

Imagine you want to hide the helmet's glowing parts (because you are being stealthy). You could just define another appearance where the glowing tubes are turned off — but you would have to add one for every variant you make. `arasaka_hellokitty_glow` and `arasaka_hellokitty_noglow`, the same for Militech, NightCorps and NCPD… ain't nobody got time for this.

That's why CDPR came up with **chunkmasks**.

The mesh is loaded via [**component**](../../components/) in an [.ent](../entity-.ent-files/#mesh-component-entity-simple-entity) or [.app](../appearance-.app-files/#components) file. Here, you will find the `chunkMask` attribute, which looks like this:

<figure><img src="../../../../.gitbook/assets/chunkmask.png" alt=""><figcaption><p>Set this to 0 to completely hide all parts of a mesh.</p></figcaption></figure>

The numbers in the dropdown correspond to the submeshes: unchecking an entry will **hide** it, **regardless of the assigned materials**.

{% hint style="warning" %}
You can only use chunkMasks to **hide** submeshes. If you want to conditionally **show** them, you have to use custom ArchiveXL tags (see [archivexl-tags.md](../../../../for-mod-creators/core-mods-explained/archivexl/archivexl-tags.md "mention") -> [#adding-custom-tags](../../../../for-mod-creators/core-mods-explained/archivexl/archivexl-tags.md#adding-custom-tags "mention"))
{% endhint %}

To learn about hiding other items with chunkmasks, check out [#partsoverrides-hiding-chunks](../../../../modding-guides/items-equipment/influencing-other-items.md#partsoverrides-hiding-chunks "mention")

## How to see chunkmasks in-game?

You have two options, [ACM ](#user-content-fn-1)[^1]\(for NPCs, including V) and RedHotTools.

### ACM

{% hint style="info" %}
You can download [Appearance Creator Mod](https://www.nexusmods.com/cyberpunk2077/mods/10795) on Nexus. It requires [Codeware](https://www.nexusmods.com/cyberpunk2077/mods/7780), [Cyber Engine Tweaks](https://www.nexusmods.com/cyberpunk2077/mods/107), and all of their requirements.
{% endhint %}

With ACM installed, make sure that the target is under the cursor in the middle of the screen (you can use photo mode to look at V). Then, find the correct mesh/component in the UI and click on the correct button:

<figure><img src="../../../../.gitbook/assets/appearance_creator_mod.png" alt=""><figcaption><p>Finding a component's chunkmask with Appearance Creator Mod</p></figcaption></figure>

### RedHotTools

Find [redhottools](../../../modding-tools/redhottools/ "mention") -> [#installation-guide](../../../modding-tools/redhottools/#installation-guide "mention") for instructions on how to install this.&#x20;

See [#inspecting-chunkmasks](../../../modding-tools/redhottools/#inspecting-chunkmasks "mention") for a guide.

## Level Of Detail (LOD)

If a submesh does not end in LOD1, that means it's intended for **lower resolutions** (for example, if an object is far away).&#x20;

By default, Wolvenkit [removes](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export/models#lod-filter-default) these low-resolution meshes on export, since you don't normally want them for modded characters or items.

{% hint style="info" %}
Under [the-whole-world-.streamingsector](../the-whole-world-.streamingsector/ "mention"), you can find an explanation of how cyberpunk handles world sector Level of Detail (LOD).
{% endhint %}

[^1]: AppearanceCreatorMod, an AMM addon
