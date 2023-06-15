---
description: will share info on how to add objects like door, loot, walls etc
---

# Adding Objects to the World

## Summary

**Created by @Krat0es updated by Doctor Presto**\
**Valid as of March 21, 2023**

This guide aims to teach you adding objects to the world.

### Requirements

* [**Wolvenkit 8.8.1+** ](https://github.com/WolvenKit/WolvenKit)
* [**Object Spawner**](https://www.nexusmods.com/cyberpunk2077/mods/2833)

### Recommended

* [allmeshes.archive](https://mega.nz/file/eRREwQbY#L7AWM1eYijyvE7GLo6IK4MQE2ohJci9r9xcq5gk8BXQ) and updated [allpaths ](https://mega.nz/file/WEQxySrS#0QM1rbl1QaUuRdU3RcNEVvYk-rfk\_mVVDyg75y8XG40)file created by KeanuWheeze - this archive contains an ent for every single vanilla mesh in the game, allowing you to spawn anything you'd like. place the archive in your mods folder and use the allpaths text file to replace the one in your object spawner data folder in the CET directory - should be something like this: <mark style="color:blue;">`Cyberpunk  2077\bin\x64\plugins\cyber_engine_tweaks\mods\entSpawner\data`</mark>

### Adding Objects to the World

* Install Object Spawner
* Start the game, load a save, navigate to the location you'd like to build and press your CET hotkey. Object Spawner will open along side CET and any other CET mods you have installed
* Go to the "Spawn New" tab of Object Spawner and search for the objects you'd like to spawn - simply click on the name to spawn it.
*

    <figure><img src="../../../.gitbook/assets/object spawner.png" alt=""><figcaption></figcaption></figure>
* Use the tools in the "Spawned" tab to move and position your objects. It is a good practice to give each object a unique and recognizable label. Try to proceed slowly and always keep in mind that you may want to move/change or otherwise edit these components later on so a few extra moments to keep them organized and labelled can save you a lot of frustration later on.&#x20;

<figure><img src="../../../.gitbook/assets/object spawner spawned tab.png" alt=""><figcaption></figcaption></figure>

**Note: depending on the object spawned, it may or may not have baked in collisions. Keep this in mind and don't worry - there are a number of ways to either add collisions or fake them depending on the context.**

* Add your objects to a group - if creating a building or other complicated structure, you should also create subgroups for each of your exterior walls and other major components.&#x20;
* after placing the objects, save the group incase you want to change something later on and then use Object Spawner's export function to create a .JSON file which you can use to add these objects permanently to the world.

<figure><img src="../../../.gitbook/assets/save then export entspawner.png" alt=""><figcaption></figcaption></figure>

Now you are ready to move on to the next guide which will help you add these items to a new .streamingsector file and merge your additions with the game world using ArchiveXL so that your items are a permanent addition with no worries about conflicting with other mods.
