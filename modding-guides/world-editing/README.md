---
description: Editing the world of Cyberpunk
---

# World Editing

This page will introduce you to the very basic structure of the world and the necessary tools to effectively modify the surroundings to your liking.

### World Structure

The world of Cyberpunk2077 consists of [nodes](../../for-mod-creators-theory/references-lists-and-overviews/reference-world-sectors/reference-.streamingsector-node-types.md), which can represent anything from visible meshes, collision, lights, effects to sounds, areas dictating where NPCs can spawn and more. These are grouped together into `streamingsector`'s which are packed inside the archive files of the game. Thus, directly editing them is not possible without causing conflicts (This is relevant for deleting and modifying nodes). To avoid that, ArchiveXL allows working with streamingsectors in a non-destructible way.

Additions to the world are also made possible by ArchiveXL, which can tell the game to load custom streamingsectors.

{% hint style="info" %}
More detailed information can be found here:

[The whole world: .streamingsectors](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/files-and-what-they-do/the-whole-world-.streamingsector)

[Sectors of Interest](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/references-lists-and-overviews/reference-world-sectors)

[Node Types](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/references-lists-and-overviews/reference-world-sectors/reference-.streamingsector-node-types)

[Mod Load Order](https://wiki.redmodding.org/wolvenkit/wolvenkit-app/usage/wolvenkit-projects#project-naming-and-mod-load-order)
{% endhint %}

### Tools You Will Need

* **ArchiveXL (**[**Nexus**](https://www.nexusmods.com/cyberpunk2077/mods/4198)**|**[**Wiki**](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/core-mods-explained/archivexl)**):** In the context of world editing, ArchiveXL allows for the non-destructive modification of sector files (E.g. Removing or modifying nodes), and also handles the merging of custom streamingsectors into the game.
* **RedHotTools (**[**GitHub**](https://github.com/psiberx/cp2077-red-hot-tools)**|**[**Wiki**](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/modding-tools/redhottools)**):** Allows for inspection of nodes and objects at runtime, providing you details like nodetype, nodeinstance, the sectorpath and more.

{% hint style="info" %}
Instructions on how to find locations using RHT can be found [here](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/references-lists-and-overviews/reference-world-sectors/places).
{% endhint %}

* World Builder **(**[**GitHub**](https://github.com/justarandomguyintheinternet/CP77_entSpawner)**|**[**Nexus**](https://www.nexusmods.com/cyberpunk2077/mods/20660)**|**[**Wiki**](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/world-editing/object-spawner)**):** Main tool for adding new nodes to the game-world. Supports dozens of node types and has access to all game resources, including AMM props. Mods made using it are native world edits, using ArchiveXL to make the game load the custom sectors.
* **removalEditor (**[**GitHub**](https://github.com/justarandomguyintheinternet/CP77_removalEditor)**):** Integrates with RedHotTools to allow easily creating node removal files for ArchiveXL.
* **VolumetricSelection2077 (**[**GitHub**](https://github.com/notaspirit/VolumetricSelection2077)**):** Quickly and easily remove parts of the world using an in game selection box.
* **Wolvenkit (**[**GitHub**](https://github.com/WolvenKit/WolvenKit)**|**[**Wiki**](https://wiki.redmodding.org/wolvenkit)**):** Comprehensive mod creator, allows finding more detailed information about nodes e.g. finding their actors. Includes adding custom streamingsectors from entSpawner, adding resources like custom meshes and much more.
* **Blender (**[**Site**](https://www.blender.org/download/)**|**[**Wiki**](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/3d-modelling/blender-getting-started)**):** 3D modeling software that enables creating custom assets that aren't already in the game.
* **FreeFly (**[**Nexus**](https://www.nexusmods.com/cyberpunk2077/mods/780)**|**[**Github**](https://github.com/justarandomguyintheinternet/CP77_FreeFly)**):** Enables quick and easy traversal of the map and getting to places you normally wouldn't be able to, includes noclip.
* All mods that these mods require to function.
* It is highly recommended to join the [redmodding discord](https://discord.gg/redmodding) to stay up to date on new techniques and tools.
