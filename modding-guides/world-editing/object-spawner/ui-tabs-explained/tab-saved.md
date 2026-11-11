---
description: >-
  Finding, loading and organizing your saved groups, restoring backups, and
  importing AMM presets
---

# Tab: Projects

{% hint style="info" %}
This tab was called "**Saved**" before World Builder 2.0.0.
{% endhint %}

## Summary

**Published:** by [keanuWheeze](https://github.com/justarandomguyintheinternet)\
**Last documented edit:** November 11 2026 by [Akiway](https://github.com/Akiway)\
**Latest documented version of WB**: 2.0.0



The Projects tab lists everything you have saved. From here you can:

* find and load your saved groups
* sort your groups into **projects**
* send groups to the Export tab
* bring back an older version of a group if something went wrong
* turn AMM decor presets into World Builder groups



### Wait, that's not what I want!

* To learn how to save a group in the first place, see [Tab: Spawned](tab-spawned.md)
* To turn your build into a real mod, see [Exporting to WolvenKit](../exporting-from-object-spawner.md)



## Groups, Projects, Saved groups & Root groups

Here is a brief explanation of the differences between them, to help you understand what it’s all about:

* A **group** is a "folder" that contains assets as well as other groups.
* A **root group** is a group that is not inside another group. Only root groups can be saved.
* A **saved group** is a root group stored as a JSON file, in `Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks\mods\entSpawner\data\objects`
* A **project** is a label you can stick on several saved groups that belong together, such as all the rooms of an apartment. It doesn't change the groups; it only sorts them in this tab.

## The top bar

<figure><img src="../../../../.gitbook/assets/WB - Project tab - Top bar.png" alt=""><figcaption><p>Project tab - Top bar</p></figcaption></figure>

<table><thead><tr><th width="244">Button</th><th>What it does</th></tr></thead><tbody><tr><td>Search bar</td><td>Shows only the groups whose name matches what you type</td></tr><tr><td> <i class="fa-file-lines" style="color:purple;">:file-lines:</i> <mark style="color:purple;"><strong>Import AMM Presets</strong></mark></td><td>Turns AMM decor presets into groups. See <a href="tab-saved.md#amm-preset-import">AMM Preset Import</a></td></tr><tr><td><i class="fa-file-spreadsheet" style="color:purple;">:file-spreadsheet:</i> <mark style="color:purple;"><strong>View report</strong></mark></td><td>Shows the result of the last AMM import (greyed out until you have imported something)</td></tr><tr><td><i class="fa-rotate-right">:rotate-right:</i></td><td>Reloads the list from disk, for example after you copied a file into <code>data\objects</code> by hand</td></tr><tr><td><i class="fa-clock-rotate-left" style="color:purple;">:clock-rotate-left:</i> <mark style="color:purple;"><strong>Restore previous session</strong></mark></td><td>Brings back what was in the Spawned tab during your last session. See Recovering your work</td></tr><tr><td>Fold / Expand all</td><td>Closes or opens every entry in the list</td></tr></tbody></table>

{% hint style="success" %}
You can choose how the list is sorted in the **Settings** tab, with **Projects tab sorting** :

* **Alphabetically** : by name
* **Last loaded first** : the group you loaded most recently comes first
{% endhint %}

## Saved groups

Click a group to open it. You will find :

<figure><img src="../../../../.gitbook/assets/WB - Projects tab - Saved group unfolded.png" alt=""><figcaption><p>Projects tab - Saved group unfolded</p></figcaption></figure>

<table><thead><tr><th width="167">Field / button</th><th>What it does</th></tr></thead><tbody><tr><td><strong>Group name</strong></td><td>The name of the group, as shown here and in the Spawned tab. Changing it doesn't rename the file.</td></tr><tr><td><strong>File name</strong></td><td>The name of the file the group is saved in. You can rename it; a copy of the group already open in the Spawned tab stays linked to it.</td></tr><tr><td><strong>Project</strong></td><td>The project this group belongs to. See Projects</td></tr><tr><td><strong>Position</strong></td><td>Where the group is in the world</td></tr><tr><td><i class="fa-file-image" style="color:purple;">:file-image:</i> <mark style="color:purple;"><strong>Load</strong></mark></td><td>Spawns the group in the world and adds it to the Spawned tab</td></tr><tr><td><i class="fa-file-half-dashed" style="color:purple;">:file-half-dashed:</i> <mark style="color:purple;"><strong>Load as Hidden</strong></mark></td><td>Adds the group to the Spawned tab but keeps its content hidden. Useful for big builds: show only the parts you want to work on.</td></tr><tr><td><i class="fa-person-running-fast" style="color:$warning;">:person-running-fast:</i></td><td>Teleports you to the group. In 3D Editor mode, it moves the camera instead.</td></tr><tr><td><mark style="color:purple;"><strong>Add to Export</strong></mark></td><td>Adds the group to the list in the Export tab</td></tr><tr><td><i class="fa-trash" style="color:$danger;">:trash:</i></td><td>Deletes the saved file. This cannot be undone, but see Backups</td></tr></tbody></table>

* The number on the right of each row is how many objects the group contains
* A small save icon next to the name means the group is currently open in the Spawned tab

{% hint style="info" %}
Group name and file name are two different things. Two groups can have the same name, but never the same file name. The file name is what World Builder uses to tell your groups apart.
{% endhint %}

## Projects

Projects help you keep a tidy list when you have a lot of saved groups.

<figure><img src="../../../../.gitbook/assets/WB - Projects tab - Project list.png" alt=""><figcaption><p>Projects tab - Project list</p></figcaption></figure>

### Putting a group in a project

1. Open the group in the list
2. Click the **Project** dropdown
3. Pick an existing project, or choose <i class="fa-plus-large">:plus-large:</i> **Create new project tag...**
4. Give the project a name, an icon and a color, then click **Assign**

To take a group out of its project, click the <i class="fa-xmark">:xmark:</i> next to the dropdown. The group goes back to <i class="fa-tag">:tag:</i> **No Project**.

The next time you will load your saved group, the project label will appear on the root group in the [Spawned tab](tab-spawned.md) <i class="fa-folder-tree" style="color:blue;">:folder-tree:</i> :&#x20;

<figure><img src="../../../../.gitbook/assets/WB - Spawned tab - Project label on root group.png" alt=""><figcaption><p>Spawned tab - Project label on root group</p></figcaption></figure>

### What you can do with a whole project

Each project has its own colored header. The buttons on the right of that header work on **all** the groups of the project at once:

<table><thead><tr><th width="100">Button</th><th>What it does</th></tr></thead><tbody><tr><td><i class="fa-file-image">:file-image:</i></td><td>Loads all the groups of the project</td></tr><tr><td><i class="fa-file-half-dashed">:file-half-dashed:</i></td><td>Loads all the groups of the project, but keeps all their content hidden</td></tr><tr><td><i class="fa-file-export">:file-export:</i></td><td>Adds all the groups to the Export tab, fills in the export name with the project name, and opens the Export tab</td></tr><tr><td><i class="fa-gear">:gear:</i></td><td>Changes the name, icon or color of the project</td></tr></tbody></table>

{% hint style="info" %}
A project can't be deleted. To get rid of one, move all its groups to **No Project**, and it disappears.
{% endhint %}

## Recovering your work

World Builder keeps copies of your work, so a mistake or a game crash doesn't cost you hours of building.

#### Backups

Every saved group has a **Backup** section with two buttons:

<table><thead><tr><th width="280">Button</th><th>Which version it brings back</th></tr></thead><tbody><tr><td><mark style="color:purple;"><strong>Restore previous save</strong></mark></td><td>The version from just before your last save</td></tr><tr><td><mark style="color:purple;"><strong>Restore from game load</strong></mark></td><td>The version from when you last started the game</td></tr></tbody></table>

The date next to each button tells you how old that copy is. A greyed out button means there is no copy yet.

{% hint style="warning" %}
If the group is open in the Spawned tab when you restore it, World Builder asks you first. The open copy gets **unlinked** from the file. Otherwise, its next save would overwrite the version you just restored.

Nothing is removed from the world. If you save that open copy later, World Builder will ask you for a new file.
{% endhint %}

{% hint style="success" %}
A file that can't be read anymore shows up in red with the word **CORRUPTED**. Open it: its backup buttons are still there, so you can usually get your work back.
{% endhint %}

### Restoring your previous session

World Builder keeps a recovery file that lists everything in the Spawned tab. It covers groups you never saved, too.

If the game crashed, or you closed it without saving:

1. Click <mark style="color:purple;">**Restore previous session**</mark>
2. Tick what you want back (or use **Select All**)
3. Click <mark style="color:purple;">**Restore Selected**</mark>

What you restore is added to the Spawned tab, next to what is already there. Nothing on disk is overwritten.

## AMM Preset Import

You can turn an AMM decor preset into a World Builder group :

1. Copy the AMM preset `.json` file into `Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks\mods\entSpawner\data\AMMImport`
2. Make sure everything the preset needs is installed (for example custom prop archives)
3. Click <mark style="color:purple;">**Import AMM Presets**</mark> <i class="fa-file-lines" style="color:purple;">:file-lines:</i>
4. Tick the presets you want to import, then click <mark style="color:purple;">**Import Selected**</mark>
5. Wait for the progress bar to finish. The game may lag during the import.

When it's done, your presets show up in the list as new saved groups. Click <mark style="color:purple;">**View report**</mark> <i class="fa-file-spreadsheet" style="color:purple;">:file-spreadsheet:</i> to see what went well and what didn't: each preset is listed with any problems found.

* When it can, World Builder turns AMM props (entities) into simple meshes, which is lighter for the game
* The import can leave unwanted objects behind in the world. Reloading a save afterwards is a good idea.

{% hint style="info" %}
You don't need AMM installed to import presets. You only need it to spawn AMM props from the Spawn New tab.
{% endhint %}
