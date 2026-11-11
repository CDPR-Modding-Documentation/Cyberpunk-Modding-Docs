---
description: >-
  How to convert the removals and mutations of your ArchiveXL .xl files after a
  game update (for example from 2.31 to 2.5) with ArchiveXL Sector Updater
---

# Updating .xl files for a new game version

## Summary

**Published:** November 11 2026 by [Akiway](https://github.com/Akiway)

This page explains how to bring the **node removals** (`nodeDeletions`) and **node mutations** (`nodeMutations`) of an ArchiveXL `.xl` file up to date after a game patch, using [ArchiveXL Sector Updater](https://github.com/Akiway/ArchiveXL-Sector-Updater).

{% hint style="info" %}
This page assumes that you already have a working `.xl` file. To make one, see the parent page: [Removing Objects](./).
{% endhint %}

### Requirements

#### Tools

* **ArchiveXL Sector Updater (**[**GitHub**](https://github.com/Akiway/ArchiveXL-Sector-Updater/releases/latest)**)**
* **Python** - version ≥ 3.10 & ≤ 3.14



## Why your .xl file broke

An `.xl` file does not name the objects it edits. It points at them by **position in a list**: the sector file, the node's `index` in that sector, and for collisions and instanced meshes, the index of each actor or instance.

```yaml
streaming:
  sectors:
    - path: base\worlds\03_night_city\_compiled\default\exterior_-6_-4_0_0.streamingsector
      expectedNodes: 1953
      nodeDeletions:
        - index: 41
          type: worldStaticDecalNode
          debugName: decals_084
        - index: 112
          type: worldCollisionNode
          actorDeletions: [3, 4, 7]
          expectedActors: 12
```

When a patch changes a sector, these numbers no longer point at the same objects. **Patch 2.5** changed almost every sector. It merged many meshes, decals, collisions and proxies into new "cooked" node types (`worldCookedStaticMeshNode`, `worldCookedStaticDecalNode`, `worldCookedCollisionNode`…) and renumbered the remaining nodes.

A 2.31 `.xl` file therefore:

* has the wrong `expectedNodes`, so ArchiveXL skips the sector;
* has the wrong `type` for merged nodes. ArchiveXL requires the exact type;
* removes or moves **other objects** where the index still fits by chance.

Fixing this by hand means finding every node again in WolvenKit. ArchiveXL Sector Updater does it for you.

***

## What the tool does

For each node in your file, the tool reads what that node **was** in the old game version: its type, resources (mesh, material…), world position, name, and the positions of its actors and instances. It then finds the same object in the new version and writes the new values into your file :

* `index` and `type` of every node;
* `expectedNodes` of every sector;
* `actorDeletions`, `instanceDeletions`, `actorMutations`, `instanceMutations`, renumbered one by one, with their `expectedActors` / `expectedInstances`;
* the `path` of the sector, when the object moved to another sector (2.5 moved some nodes to another grid level).

Everything else stays as it is: your comments, the order of entries, and the values of your mutations (position, orientation, scale…).

Supported game versions: `1.63`, `2.02`, `2.13`, `2.2`, `2.21`, `2.31`, `2.5`. You can convert from any of them to any other.

### Installation

You only need to do this once.

1. Install **Python 3.14** from [python.org](https://www.python.org/downloads/windows/). Tick **"Add python.exe to PATH"** if the installer offers it. <mark style="color:green;">Python 3.10 to 3.14 work.</mark> <mark style="color:red;">3.15 does not work yet.</mark>
2. Download the [latest release of ArchiveXL Sector Updater](https://github.com/Akiway/ArchiveXL-Sector-Updater/releases/latest) (**Source code (zip)**) and unzip it anywhere.
3. Open a terminal in the tool folder: in File Explorer, open the folder, right-click an empty area and choose **Open in Terminal** (Windows 10: Shift + right-click, **Open PowerShell window here**).
4.  Install the library the tool needs:

    ```
    py -3.14 -m pip install -r requirements.txt
    ```

***

## Converting your files

1. Copy your `.xl` files into the tool's `input` folder. Subfolders are fine, and the tool also reads `.yaml`, `.yml` and `.json` files.
2.  In the terminal, run the following command, replacing the versions with yours :

    ```
    py -3.14 axl_sector_updater.py --from 2.31 --to 2.5
    ```

    `--from` is the game version your files were made for, and `--to` is the version to convert them to.
3. Your converted files are in the `output` folder, with the same folder layout as `input`.

The first run downloads the game data of both versions (about 350 MB each) into the `versions` folder. Later runs reuse it.

{% hint style="warning" %}
`--from` must be the version the file was **made** for, not the version you were playing last. A file made for 2.13 and converted with `--from 2.31` gives poor results, but the tool warns you about it (see Source mismatch).
{% endhint %}

To convert a single file, give its path and the output path:

```
py -3.14 axl_sector_updater.py --from 2.31 --to 2.5 "my_removals.xl" "my_removals 2.5.xl"
```

#### Remember the game version

Every converted file has a line like this at the top:

```yaml
# Game version: 2.5
streaming:
  sectors:
```

The next time you convert the file, the tool reads this line as the version to convert from, so you can leave out `--from`. **Keep this line** in your source files, and add it to the files you make from now on. After the next patch, you will not have to remember which version each file was made for.

### Reading the result

For each file, the console prints how many nodes got each status, then lists every node that needs your attention:

```
input\my_removals.xl (2.31 -> 2.5)
  35 nodes: 29 exact, 4 match, 2 not found
    ...
```

<table><thead><tr><th width="160">Status</th><th>What it means</th><th>What to do</th></tr></thead><tbody><tr><td><code>exact</code></td><td>Found and identical.</td><td><mark style="color:green;">Nothing.</mark></td></tr><tr><td><code>match</code></td><td>Found, nearly identical (moved by less than 5 cm, or only some of its actors / instances found).</td><td><mark style="color:green;">Check it in game.</mark></td></tr><tr><td><code>moved</code></td><td>The same object, moved by more than 5 cm (up to 2 m).</td><td><mark style="color:green;">Check it in game.</mark></td></tr><tr><td><code>by name</code></td><td>The index in your file was wrong, but the <code>debugName</code> named another node of the sector, and that node was converted.</td><td><mark style="color:green;">Check it in game.</mark></td></tr><tr><td><code>already target</code></td><td>The node already points at the right node of the new version: your file mixes both versions.</td><td><mark style="color:green;">Nothing, if the mix was intended.</mark></td></tr><tr><td><code>other mod</code></td><td>The sector comes from another mod, not from the game. The entry is kept as it is.</td><td><mark style="color:green;">Check that the other mod has not changed.</mark></td></tr><tr><td><code>not found</code></td><td>The object does not exist in the new version.</td><td><mark style="color:orange;">Find its replacement by hand (see below).</mark></td></tr><tr><td><code>source mismatch</code></td><td>The node does not fit the <code>--from</code> version: the file was made for another version.</td><td><mark style="color:orange;">Convert again with the right <code>--from</code> (see below).</mark></td></tr></tbody></table>

When you convert several files, a table at the end gives one line per file, worst first. A **What to do** section then groups the remaining problems by cause. The console output is also saved in the `logs` folder.

### What changes in the output file

The output is your file with the new values written in. Nodes that need explaining get a comment that starts with `axl_sector_updater:`.

**Nodes that were not found** are commented out where they were. A second comment line tells you what the node was in the old version and where it was, so you can look for it in WolvenKit or in game:

```yaml
        # axl_sector_updater: not found in 2.5
        # axl_sector_updater: was in 2.31: worldStaticDecalNode 'decals_084' at [-1420.1196, 1272.4044, 127.5367]
        # - index: 41
        #   type: worldStaticDecalNode
```

**Nodes found by name** keep their entry with the new index, under a comment that explains what the index pointed at:

```yaml
    # axl_sector_updater: found by its debugName (node #523 'drink_bottle_r_gusano.mesh' in 2.2): index 501 of the file is 'computer_panels_mlt_g.mesh'
    - index: 525
      type: worldInstancedMeshNode
      debugName: drink_bottle_r_gusano.mesh
```

**Nodes and actors moved to another sector or node** are commented out with `moved to …` and added where they now are, either to the existing entry of that sector or to a new entry at the end of the file. In 2.5, many collision actors were regrouped into a different node, sometimes in another sector.

**Actors and instances that were not found** are commented out of their list. A node whose list would end up empty is left out entirely, because ArchiveXL would otherwise remove the **whole** node.

### Fixing what's left

#### Match, moved, by name

These nodes are converted, but they are not an exact copy of the original. Load the area in game and check that the right objects are removed or changed.

For mutations of `moved` nodes, also check the values you set: they are copied as they were, and a `position` you set relative to the old placement may need a small correction.

#### Not found

The object no longer exists in the new version, or it changed too much to be recognised. In 2.5, this is usually a decal or a mesh that was merged into a cooked node.

1. Use the position in the comment to find the area in game or in WolvenKit.
2. Find the object that replaced it, with the method you used to make the file: Removal Editor, [VS2077](https://github.com/notaspirit/VolumetricSelection2077), Blender or by hand.
3. Add the new entry to the converted file, and delete the commented-out lines.

#### Source mismatch, or "expectedNodes differs from …"

The file was not made for the `--from` version. The warning usually names the version it was made for:

```
warning: expectedNodes differs from 2.31 in 4 / 4 sector(s): the file was made for 2.13
```

Convert the original file again with that version (`--from 2.13`), or put `# Game version: 2.13` on its first line.

If only a few sectors differ, another mod or a manual edit changed them. If the warning says the counts match **no** version, the file was made for a version the tool has no data for, and these nodes have to be fixed by hand.

#### Other mod

Your file edits a sector that another mod adds. These indices depend only on that mod, not on the game version, so they are kept as they are. If that mod has been updated since you made your file, take the new indices from its updated sector.

***

## Testing in game

1. Update ArchiveXL. Removing actors from 2.5 collision nodes (`worldCookedCollisionNode`) requires a version **newer than 1.28.1**.
2. Replace your old `.xl` file with the converted one in your mod.
3. Visit every area your file edits. If something is not removed, check `red4ext/plugins/ArchiveXL/ArchiveXL.log`: ArchiveXL logs the sectors and nodes it could not patch.

{% hint style="danger" %}
ArchiveXL silently ignores misspelled keys (`instanceDeletion`, `sscale`…), and a deletion whose actor or instance list it cannot read removes the whole node. The tool does not check spelling, so a typo that was already in your file stays in the converted one.
{% endhint %}

## Troubleshooting

<table><thead><tr><th width="358">Message</th><th>Fix</th></tr></thead><tbody><tr><td><code>pip is not recognized</code></td><td>Use <code>py -3.14 -m pip install -r requirements.txt</code>, not <code>pip</code> on its own.</td></tr><tr><td><code>Python was not found; run without arguments to install from the Microsoft Store</code></td><td>Type <code>py -3.14 …</code>, not <code>python …</code>.</td></tr><tr><td><code>No runtime installed that matches 3.14</code></td><td>Run <code>py install 3.14</code>, or install 3.14 from python.org.</td></tr><tr><td><code>Microsoft Visual C++ 14.0 or greater is required</code></td><td>Your Python is 3.15, which is too recent. Install 3.14 alongside it.</td></tr><tr><td><code>can't open file … axl_sector_updater.py</code></td><td>The terminal is not open in the tool folder.</td></tr><tr><td><code>download interrupted</code></td><td>Run the command again, or download the <code>nodes-&#x3C;version>.zip</code> files from the <a href="https://github.com/Akiway/ArchiveXL-Sector-Updater/releases/tag/node-exports">node-exports release</a> and put them, still zipped, in <code>versions</code>.</td></tr></tbody></table>

For all options (output as JSON, detailed `--debug` report, search radius…) and the full FAQ, see the [tool's README](https://github.com/Akiway/ArchiveXL-Sector-Updater#readme).
