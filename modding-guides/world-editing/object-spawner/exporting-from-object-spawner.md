---
description: >-
  This guide explains how to go from an World Builder build to a native world
  edit
---

# Exporting to WolvenKit

Usage

* When building something using World Builder, it will use an intermediary format optimized for editing
* In order to go from that editing focused format to the final native world edit, World Builder provides a workflow to make this as easy as possible

{% hint style="info" %}
If you just want to quickly convert your project to a native edit, jump to the [Export ](exporting-from-object-spawner.md#exporting)section. It is highly recommended to read the previous sections on the theory and things to consider tho.
{% endhint %}

## Requirements

### Tools

* [World Builder](https://github.com/justarandomguyintheinternet/CP77_entSpawner/releases)
* [ArchiveXL](https://github.com/psiberx/cp2077-archive-xl)
* [Codeware ](https://github.com/psiberx/cp2077-codeware/releases)(1.15.0 or newer)
* [WolvenKit](https://github.com/WolvenKit/WolvenKit) (With latest version of World Builder import script)

### Knowledge

* You need to have a basic understanding of:
  * Working with WolvenKit
  * Common sense

## Sectors and Groups

* While building in World Builder, you are able to save things on a root-group level
  * This means you can save any group that is not contained within another group
* The game operates on sectors, which objects are assigned to what sector is an automatic process there
  * For the World Builder workflow, **each group you saved can get turned into a sector**
* A finished mod can consist of multiple root-groups / sectors

### Streaming Ranges

* There are different streaming ranges, determining when objects and sectors get streamed in / out
*   Object Based Range:

    * These determine when each individual object gets streamed in / out
    * It is usually dependent on the size of the object
    * Can be found under each object's "World Node" header

    <figure><img src="../../../.gitbook/assets/WBWorldNodeProperties" alt="" width="274"><figcaption><p>Streaming Ranges of an object</p></figcaption></figure>
*   Sector Range:

    * This determines when then entire sector gets streamed in / out
    * This over-rules the object based ranges, meaning when the sector streams out all objects within also stream out, even if their individual range is larger
    * Can be found in the export tab, under each groups header

    <figure><img src="../../../.gitbook/assets/sectorExtents" alt="" width="563"><figcaption><p>Streaming extents of a group / soon to be sector</p></figcaption></figure>

{% hint style="info" %}
Why this matters:

You should keep this in mind while building, and make sure that _if_ you have sub-builds which are far apart, that those are in their own root-groups (Thus becoming their own sectors)

That way you make sure that only the parts of your build that are currently close will be streamed in (Thanks to having separated it into multiple sectors, with their own ranges)
{% endhint %}

## Exporting

### Step 1: Export from World Builder

1. Start by going to the "Saved" tab, and adding all the groups you want to be part of your finished mod, by using the "Add to export" button of those groups
2. Next, head over to the "Export" tab
3. Enter a project name, this will be used for the folder and file names in WolvenKit
4. Now you can specify sector specific settings:
   1. Sector Category, usually just use interior or exterior
   2. [Sector Extents](exporting-from-object-spawner.md#streaming-ranges), used for determining when to stream the whole sector in / out
   3. [Sector Variants](features-and-guides/creating-sector-variants.md)
5. Hit "Export"

<figure><img src="../../../.gitbook/assets/exportUIExample" alt="" width="563"><figcaption><p>Example of the Export tab, with two groups</p></figcaption></figure>

### Step 2: Importing into WolvenKit

1. Open your WolvenKit project (Make a new one if you do not have one yet)
2.  In the top menu bar, navigate to

    1. File -> Import -> Object Spawner .json

    <figure><img src="../../../.gitbook/assets/objectSpawnerWKitImportDialog" alt="" width="413"><figcaption><p>Click the "Import object spawner .json" button, then choose the file</p></figcaption></figure>
3. In the file dialog, choose the previously exported file, named `projectName_exported.json`
4. Multiple files should have been generated (At **least** one `.streamingsector`, and one `.streamingblock`)
5. Click the "Install" button, in the top menu bar
