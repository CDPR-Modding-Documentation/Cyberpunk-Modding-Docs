---
description: How does load order work in Cyberpunk?
---

# Archive files Load Order

## Summary

**Written & Published**: Nov 22, 2023 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page will explain to you what Load Order is and how it works, then tell you how to influence it.

## TL;DR

You're not supposed to manage load order conflicts outside of `.archive` mods and REDmods. If you ever feel the need to do that, a modder fucked up. An exception to this are **Tweak mods**, as the tweakDB is also a database of static values, conflicts can happen (e.g. two mods both edit the weapon stats of the Masamune).

* For REDmods, see [#conflicts-and-load-order](redmod/usage.md#conflicts-and-load-order "mention")
* For .archive mods, use Fuzzo's **Archive Conflict Checker Tool** ([Nexus link](https://www.nexusmods.com/cyberpunk2077/mods/11126)).
* There currently is no tool to check tweak conflicts

## What is Load Order?

Unless two mods are changing the same file, you don't need to bother about this at all. Unfortunately, the moment you're using frameworks or anything body modding related, you _will_ run into this scenario.

In Cyberpunk, conflicts inside `.archive` mods are one per-file basis, whatever mod modifies a file **first** will win – unlike e.g. Skyrim, where esps may overwrite each other.

#### Example

There are two mods that change boob size (and both mods modify the same file, e.g. a rig or mesh):

```
i_know_nothing_about_back_problems.archive
realistic_boobs_DDDDDDDDD_cup.archive
```

Since **i\_know\_nothing\_about\_back\_problems** will load first, the conflicting file inside **realistic\_boobs\_DDDDDDDDD\_cup** does nothing.

## How are mods ordered?

The game loads mods in the following order (higher wins):

### 1. Legacy mods

All .archive files in `Cyberpunk 2077/archive/pc/mod` in alphabetical order (see below).

{% hint style="warning" %}
Note: If a file called `modlist.txt` is found inside `archive/pc/mod` then the game will load archives according to the order inside that file. The file may contain archive names, one mod archive name in each line. Example:
{% endhint %}

```
modb.archive
moda.archive
```

This means the game will load `modb` before `moda`, even though the filenames are not in alphabetical order. This allows for conflict management without renaming the physical files.

### 2. REDmods

Anything in `Cyberpunk 2077/mods`. All REDmod archives are loaded strictly after all archive files found inside `/archive/pc/mod`.

### Load order: ASCII sort

The game reads mods in ASCII-alphabetical order (REDmods by **folder name**, .archive files by **archive file name**).

This is ASCII ordering:

<figure><img src="https://files.gitbook.com/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-MP_ozZVx2gRZUPXkd4r%2Fuploads%2FJ7IAaw7SEdYkWNCWeT4V%2Fimage.png?alt=media&#x26;token=acfd4e9c-7c2c-4a11-89fc-6bbef5211eec" alt=""><figcaption><p>Source: <a href="https://www.academia.edu/19644191">https://www.academia.edu/19644191</a></p></figcaption></figure>

#### Example

| Mod name       | Pos | why              |
| -------------- | --- | ---------------- |
| MyMod.archive  | 2   | M comes before m |
| myMod.archive  | 3   |                  |
| !myMod.archive | 1   | ! comes before A |

## How to use this?

You can re-name your folders and .archive files following the rules under [#load-order-ascii-sort](load-order.md#load-order-ascii-sort "mention") to influence in which order the game will load your mods, or you can use Fuzzo's **Archive Conflict Checker Tool** ([Nexus link](https://www.nexusmods.com/cyberpunk2077/mods/11126)).

{% hint style="danger" %}
Prefixing your archive file names with non-alphanumeric characters works fine in case of Cyberpunk, but is a terrible habit that might break file paths in other games or operating systems.
{% endhint %}

{% hint style="info" %}
You will forget the warning above and re-learn this the hard way.
{% endhint %}

## More Examples

If you are creating a **compatibility mod** (something that modifies the files of another installed mod), then yours needs to load **first**.

For example, if you want to do a custom recolour of the mod [`_ArchiveXL_Netrunner_Variants.archive`](../../modding-guides/items-equipment/recolours-and-refits/), then your Wolvenkit project could be named `_00_ArchiveXL_Netrunner_Variants`, or `_ArchiveXL_Netrunner_00_Recolour`.
