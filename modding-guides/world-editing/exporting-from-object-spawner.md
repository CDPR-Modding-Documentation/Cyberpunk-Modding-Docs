---
description: >-
  This guide explains how to go from an Object Spawner build to a native world
  edit
---

# Exporting from Object Spawner

Usage

* When building something using Object Spawner, it will use an intermediary format optimized for editing
* In order to go from that editing focused format to the final native world edit, Object Spawner provides a workflow to make this as easy as possible

{% hint style="info" %}
If you just want to quickly convert your project to a native edit, jump to the [Export ](exporting-from-object-spawner.md#exporting)section. It is highly recommended to read the previous sections on the theory tho.
{% endhint %}

## Requirements

### Tools

* [Object Spawner](https://github.com/justarandomguyintheinternet/CP77_entSpawner/releases)
* [ArchiveXL](https://github.com/psiberx/cp2077-archive-xl)
* [Codeware ](https://github.com/psiberx/cp2077-codeware/releases)(1.15.0 or newer)
* [WolvenKit](https://github.com/WolvenKit/WolvenKit) (With latest version of Object Spawner import script)

### Knowledge

* You need to have a basic understanding of:
  * Working with WolvenKit
  * Common sense

## Sectors and Groups

* While building in Object Spawner, you are able to save things on a root-group level
  * This means you can save any group that is not contained within another group
* The game operates on sectors, which objects are assigned to what sector is an automatic process there
  * For the Object Spawner workflow, **each group you saved can get turned into a sector**
* A finished mod can consist of multiple root-groups / sectors

### Streaming Ranges

* There are different streaming ranges, determining when objects and sectors get streamed in / out
*   Object Based Range:

    * These determine when each individual object gets streamed in / out
    * It is usually dependent on the size of the object
    * Can be found under each object's "World Node" header

    <figure><img src="../../.gitbook/assets/worldNodeStreamingRange" alt="" width="274"><figcaption><p>Streaming Ranges of an object</p></figcaption></figure>
*   Sector Range:

    * This determines when then entire sector gets streamed in / out
    * This over-rules the object based ranges, meaning when the sector streams out all objects within also stream out, even if their individual range is larger
    * Can be found in the export tab, under each groups header

    <figure><img src="../../.gitbook/assets/sectorExtents" alt="" width="563"><figcaption><p>Streaming extents of a group / soon to be sector</p></figcaption></figure>

{% hint style="info" %}
Why this matters:

You should keep this in mind while building, and make sure that _if_ you have sub-builds which are far apart, that those are in their own root-groups (Thus becoming their own sectors)

That way you make sure that only the parts of your build that are currently close will be streamed in (Thanks to having separated it into multiple sectors, with their own ranges)
{% endhint %}

## Exporting

### Step 1: Export from Object Spawner

1. Start by going to the "Saved" tab, and adding all the groups you want to be part of your finished mod, by using the "Add to export" button of those groups
2. Next, head over to the "Export" tab
3. Enter a project name, this will be used for the folder and file names in WolvenKit
4. Now you can specify sector specific settings:
   1. Sector Category, usually just use interior or exterior
   2. [Sector Extents](exporting-from-object-spawner.md#streaming-ranges), used for determining when to stream the whole sector in / out
   3. [Sector Variants](creating-sector-variants.md)
5. Hit "Export"

<figure><img src="../../.gitbook/assets/exportUIExample" alt="" width="563"><figcaption><p>Example of the Export tab, with two groups</p></figcaption></figure>

### Step 2.5: Moving the file

1. Navigate to the `Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks\mods\entSpawner\export` folder
2. Locate the file you just exported, it will be named `projectName_exported.json`
3. Copy the file
4. Open your WolveKit project (Make a new one if you do not have one yet)
5. Right-click the `raw` folder in the project explorer, and hit "Open in Windows Explorer"
6. Paste the file

{% hint style="info" %}
The file should now be located in `wkitProjectName\source\raw`
{% endhint %}

### Step 2: Importing into WolvenKit

1. Next, open the Script Manager:
   1. (Top tool-bar) Tools -> Script manager
2. Update your scripts by pressing the "Update Scripts" button
3. If the script was updated, or this is the first time you do this:
   1. Locate the `import_object_spawner` script in the "System" category
   2. Double click it, and agree to creating a local copy
4. Open the local copy, found under the "User" category
5. At the top of the now open script, locate the part that says "Modify this"
   1. Modify the path to point to the file you previously copied into the `raw` folder
6. Click the "Run" button
7. Multiple files should have been generated (At **least** one `.streamingsector`, and one `.streamingblock`
8. Click the "Install" button

<figure><img src="../../.gitbook/assets/wkitOSImport" alt=""><figcaption><p>All the steps visually shown</p></figcaption></figure>
