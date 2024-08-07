---
description: Using Redmod to create mods.
---

# REDmod for mod devs

## Summary

**Last documented edit:** Sep 07 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page tells you how to use REDmod for **mod creation**.

### Wait, that's not what I want!

* If you want to know what REDmod does, check [here](../../../for-mod-users/users-modding-cyberpunk-2077/redmod/#if-i-use-it-what-do-i-gain)
* If you're a mod user, check the [redmod](../../../for-mod-users/users-modding-cyberpunk-2077/redmod/ "mention") page in the Mod Users section

## What is REDmod? (Developer version)

REDmod is a command line tool developed by CDPR and Yigsoft, which allows us to interact with game files in a variety of ways.

Modules for mod creators:

```
resource-export  - Export REDengine files to raw format for editing
resource-import  - Import raw files to REDengine formats for use in your mod
animation-import - import .re animation files to an animset
util-hash        - Hashes paths/string with given hash algorithm
help             - Displays helpful info about the other avaliable modules (use -h or -help on any command)
```

## Folder Structure

When creating a REDmod, there is a certain file structure that you need to follow to ensure  that it can be used by others. You will want to have a folder that is the name of the mod and in this folder you will have a file named `info.json.` Whether you are doing [Animation Modding](./#animation-modding), [Script Modding](./#script-modding), [TweakDB Modding](./#tweakdb-modding), [Audio Modding](./#audio-modding), or other mods (archive mods), you will also need to have at least _one_ subfolder for the mod files to go into. This subfolder should be located on the same level as the `info.json` file, and be nested directly inside the folder with the mod name.

An example REDmod might look something like this:

```
 * root_folder
 * | -📁 mods
 * | |-📁 <Mod Name>
 * | | |-📁 archives
 * | | |-📁 scripts
 * | | |-📁 tweaks
 * | | |-📁 customSounds
 * | | |-📄 info.json
```

When sharing you mod, you would package the folder that is the name of the mod. You could also package the mods folder with the "mod folder", but it is not necessary and it is assumed one might have other mods in their `mods` folder anyways.

### info.json

For a REDmod to be recognized and loaded by the game engine, you must include an `info.json` file. This file sits in the root folder of the mod's folder at the same level as the subfolders containing your modded files. There are two required entries and a few optional entries that can be in this json file. At minimum a `name` field and a `version` field are needed:

```json
{
    "name": "MODNAME",
    "description": "Description for the mod.",
    "version": "1.0.0",
    "customSounds":    [ ]
}
```

In the above:

* The `name` field is the mod's name and should generally be the same as the folder the `info.json` file sits in.
* The `version` field is the mod's version. The version should generally use "Semantic Versioning"
* The `description` field is optional for _all_ mods, but it is generally suggested one should include it so other tools have something to display for a given mod.
* The `customSounds` field is semi-optional. It _is_ required for [Audio Modding](./#audio-modding).

> INFO - Semantic Versioning is a method of versioning where each number gives meaning for a release based on their position. It uses the format `MAJOR.MINOR.PATCH` where a `MAJOR` release change is one which will break workflows, `MINOR` could break a workflow but is generally safe and might introduce deprecations, and a `PATCH` is a small non breaking change that all users on the same `MAJOR` and `MINOR` can update to without any issues.
