---
description: Editing the world of Cyberpunk
---

# 🌐 World Editing

This page will introduce you to the very basic structure of the world and the necessary tools to effectively modify the surroundings to your liking.

{% hint style="success" %}
As of February 2025, Cyberpunk's world editor (mod) is **in development**. You can check out [world-editor-entspawner.md](world-editor-entspawner.md "mention") to learn more about it.
{% endhint %}

### World Structure

The world of Cyberpunk2077 consists of nodes, which can represent pretty much anything from visible meshes, collision, lights, effects to sounds, areas dictating where NPCs can spawn and more. These are grouped together into streamingsectors which are packed inside the archive files of the game - meaning not directly editable without creating massive conflicts due to how mods modifying the same resources get handled.

{% hint style="info" %}
More detailed information can be found here:

[The whole world: .streamingsectors](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/files-and-what-they-do/the-whole-world-.streamingsector)

[Sectors of Interest](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/references-lists-and-overviews/reference-world-sectors)

[Node Types](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/references-lists-and-overviews/reference-world-sectors/reference-.streamingsector-node-types)

[Mod Load Order](https://wiki.redmodding.org/wolvenkit/wolvenkit-app/usage/wolvenkit-projects#project-naming-and-mod-load-order)
{% endhint %}

### Tools You Will Need

* **ArchiveXL (**[**Nexus**](https://www.nexusmods.com/cyberpunk2077/mods/4198)**|**[**Wiki**](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/core-mods-explained/archivexl)**):** Is a framework mod that allows modifying and adding resources in a non exclusive, non destructive way. In this context it handles the node removal, addition of custom sectors and includes checks to ensure that the node you're trying to remove is the one present in game.
* **RedHotTools (**[**GitHub**](https://github.com/psiberx/cp2077-red-hot-tools)**|**[**Wiki**](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/modding-tools/redhottools)**):** Allows for inspection of nodes and objects at runtime, providing you details like nodetype, nodeinstance, the sectorpath and more.

{% hint style="info" %}
Instructions on how to find locations using RHT can be found [here](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/references-lists-and-overviews/reference-world-sectors/places).
{% endhint %}

* **entSpawner (**[**GitHub**](https://github.com/justarandomguyintheinternet/CP77_entSpawner)**):** Handles the spawning of objects that can then be converted into standalone streamingsectors. It has access to all game assets and AMM prop packs installed.
* **removalEditor (**[**GitHub**](https://github.com/justarandomguyintheinternet/CP77_removalEditor)**):** Integrates with RedHotTools to allow easily creating node removal files for ArchiveXL.
* **Wolvenkit (**[**GitHub**](https://github.com/WolvenKit/WolvenKit)**|**[**Wiki**](https://wiki.redmodding.org/wolvenkit)**):** Comprehensive mod creator, allows finding more detailed information about nodes e.g. finding their actors. Includes scripts to [remove occlusion nodes](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/world-editing/removing-occlusion), adding custom streamingsectors from entSpawner, adding resources like custom meshes and much more.
* **Blender (**[**Site**](https://www.blender.org/download/)**|**[**Wiki**](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/3d-modelling/blender-getting-started)**):** 3D modeling software that enables creating custom assets that aren't already in the game.
* **FreeFly (**[**Nexus**](https://www.nexusmods.com/cyberpunk2077/mods/780)**|**[**Github**](https://github.com/justarandomguyintheinternet/CP77_FreeFly)**):** Enables quick and easy traversal of the map and getting to places you normally wouldn't be able to, includes noclip.
* All mods that these mods require to function.
* It is highly recommended to join the [redmodding discord](https://discord.gg/redmodding) to stay up to date on new techniques and tools.
