---
description: >-
  This guide demonstrates how to add new locations to the world by creating new
  .streamingsector files and adding them to the game world by merging them with
  the all.streamingblock via ArchiveXL
---

# Adding Locations and Structures with ArchiveXL

**Valid as of March 21 2023**

Requirements

* [Wolvenkit 8.8.1](https://github.com/WolvenKit/WolvenKit/releases/tag/8.8.1) (bugs in nightlys and stable version 8.9.0 prevent adding new nodes to a streaming sector)&#x20;
* [The latest stable release of ArchiveXL](https://github.com/psiberx/cp2077-archive-xl/releases)  (thanks Psiberx!)&#x20;

Resources

* [Example mod project, including template .XL file, .streamingsector and .streamingblock](https://mega.nz/file/TJYyEJIB#a6iCYOoweB3jRO0EmdcI\_6p4dTf\_nyD4bCCW7DpC\_VE) - this adds a low poly house exterior mesh to the center of the glass dome in corpo plaza (near the giant holo fish)

### Adding a custom location to a new streaming sector and merging it with the game world

* After following the previous guide to add and position the objects you want to add to the game, open the example mod project in Wolvenkit and open the file new\_mod\_sector.streamingsector&#x20;
*   in the "Node Data" section, right click on the existing node and click "Import from JSON (no coords update)&#x20;

    <figure><img src="../../../.gitbook/assets/import from json.png" alt=""><figcaption></figcaption></figure>

    * This will open a window which allows you to browse to the export folder of Object Spawner. this will be something like <mark style="color:blue;">`Cyberpunk  2077\bin\x64\plugins\cyber_engine_tweaks\mods\entSpawner\export`</mark> You will find a JSON file named after the main group you created and exported in this folder folder&#x20;
    * Select that file and Wolvenkit will create the necessary nodes, in the streaming sector, adding them to the location you selected.&#x20;
    * Delete the node which was included as an example and rename the file to something unique for your mod.
    * Open the new\_mod.streamingblock file in the project
    * Under the "descriptors" tab, edit the 1st entry so that the depot path points to your .streamingsector file
    *

        <figure><img src="../../../.gitbook/assets/streaming block.png" alt=""><figcaption></figcaption></figure>



    * Now you need to set the streaming box for your new sector.  The easiest way to figure this out is to just take the coordinates from a central object in your mod (you can find these in your .streamingsector file on each node) and add 300 units to each number for the max, subtract 300 for the min. This will need to be adjusted based on how far away you want your objects to be visible in the world.
    * rename this streamingblock file to something unique to your mod
    * Now all that's left is to edit the .xl file included in the resources section of the example so that it points to your streamingblock file. All you need to do is replace "mod\new\_mod.streamingblock" with the relative path to your streamingblock.&#x20;

    Once you've done the above steps, install your new mod and launch the game, if you've completed all the steps, your new objects, structure or location will spawn just like the rest of the world
*

    <figure><img src="../../../.gitbook/assets/new addition.png" alt=""><figcaption></figcaption></figure>

    If you run into any troubles, double check the guides and then pop over to #world-editing on the cyberpunk discord server
*
