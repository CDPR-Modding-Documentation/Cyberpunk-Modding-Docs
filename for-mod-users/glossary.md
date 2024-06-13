---
description: List of words that need more context
---

# Glossary

## Summary

**Published**: ??? by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")                                                                                                                             **Last documented edit**: June 13 2024 by LadyLea

A comprehensive list of jargon you might see on this Wiki or around our community. This glossary is not alphabetical, so be sure to use your browser search function to find what you're looking for. (CTRL+F for most applications)

## General

* <mark style="color:red;">**GitHub**</mark>: A website which hosts code and helps programmers collaborate on projects. The source code for e.g. WolvenKit or Cyber Engine Tweaks is hosted there. You can compile the WolvenKit source code yourself, or for non-developers you can find WolvenKit releases here first.
* <mark style="color:red;">**REDengine**</mark>: The proprietary video game engine developed by CD Projekt Red for The Witcher 3 and Cyberpunk 2077. Witcher 3 uses REDengine 3 (RED3), Cyberpunk 2077 uses REDengine 4 (RED4).

## Modding Tools

* <mark style="color:red;">**Official Modkit for The Witcher 3 (WCC)**</mark>: An official CDPR command-line tool for modding The Witcher 3. Legacy WolvenKit makes extensive use of the Modkit. If you want to mod the Witcher, you're in the wrong wiki, choom!
* <mark style="color:red;">**REDmod**</mark>: An [official CDPR command-line tool](users-modding-cyberpunk-2077/redmod/) for [modding Cyberpunk 2077](../for-mod-creators-theory/modding-tools/redmod/).&#x20;
* <mark style="color:red;">**WolvenKit**</mark>: The unofficial [community modding toolkit](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/readme).&#x20;
* <mark style="color:red;">**WolvenKit CLI**</mark>: The [command line interface version](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-cli) of WolvenKit. (Formerly CP77 Tools)
* <mark style="color:red;">**CP77 Tools**</mark>: The original Cyberpunk 2077 modding Command Line Tools. (Renamed and moved to WolvenKit CLI)

## WolvenKit

* <mark style="color:red;">**masklist**</mark>: The masklist file is a custom .txt document used as a helper file to generate new mlmasks using the Import/Export tool.
* <mark style="color:red;">**Material json**</mark>: Material json files are used by the Import/Export tool during for the mesh I/O process. The json will be named after the mesh file then suffixed with .Material.json (i.e. judy\_01.Material.json)

## Game Files

* <mark style="color:red;">**Cooked/Uncooked**</mark>: Whether a file is compressed by the REDengine build process.&#x20;
  * <mark style="color:red;">**Cooked**</mark>: Files extracted with the Asset Browser using WolvenKit (including Legacy) are cooked files. See also: [https://docs.unrealengine.com/4.27/en-US/SharingAndReleasing/Deployment/Cooking/](https://docs.unrealengine.com/4.27/en-US/SharingAndReleasing/Deployment/Cooking/)
  * <mark style="color:red;">**Uncooked:**</mark> After using the Official Witcher 3 Modkit to import an FBX to W2MESH, this file is **uncooked**. Rather than calling these files imported, the uncooked terminology is derived from the cooked (compressed) file state.
* <mark style="color:red;">**Packed**</mark>: CDPR games do not load loose files, but rather **compress** resources into archives. This compression process is called packing. The Witcher 3 uses ".bundle" files, while Cyberpunk 2077 uses the ".archive" file format.
* <mark style="color:red;">**Raw**</mark>: Generic term used to refer to non-REDengine files that have a resource counterpart. The raw format of the REDengine XBM texture format can be TGA, PNG, DDS, etc. e.g. "Do you have the raw texture?" - This is an inquiry about the TGA/PNG/DDS counterpart to a game texture file.
* <mark style="color:red;">**Resource**</mark>: A technical term for a REDengine asset file (e.g. .xbm, .mesh, .env).
* <mark style="color:red;">**W2RC/CR2W**</mark>: The file magic number for REDengine files. REDengine resource files are commonly referenced as W2RC/CR2W files for shorthand.

## Modding

* <mark style="color:red;">**Reference**</mark>: A string value in a _resource_ that exists in another _resource_, and it is used to chain resource together as they are loaded into the game. Some examples are a DepotPath that points at another resource, a list index that points at a material entry, and an appearance that points at a component.
* <mark style="color:red;">**Vanilla**</mark>: Original or unmodified i.e. Johnny Silverhand's vanilla appearance can be changed with a DLC.
* <mark style="color:red;">**Legacy**</mark>: Techie slang for "the old system". Note that the new system doesn't have to be **better**, just newer.

## Mods

_**Core Mods**_

[<mark style="color:red;">**CET**</mark>](https://www.nexusmods.com/cyberpunk2077/mods/107): Cyber Engine Tweaks, a [core scripting framework](https://wiki.redmodding.org/cyber-engine-tweaks) utilized by the majority of mods.

[<mark style="color:red;">**Red4Ext**</mark>](https://www.nexusmods.com/cyberpunk2077/mods/2380): a core [script extender](https://docs.red4ext.com/), which allows modders to add new features, modify the game behavior, add new scripting functions or call existing ones in your own plugins.

[<mark style="color:red;">**Redscript**</mark>](https://www.nexusmods.com/cyberpunk2077/mods/1511):  is a core [script compiler](https://app.gitbook.com/o/-MP5ijqI11FeeX7c8-N8/s/-McniwB8YOK2HnJ7SYg\_/) that can be integrated with the game and used to add/replace game scripts.

[<mark style="color:red;">**Archive XL**</mark>](https://www.nexusmods.com/cyberpunk2077/mods/4198):  [a modding tool that allows you to load custom resources](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators/core-mods-explained/archivexl) without touching original game files, thus allowing multiple mods to expand same resources without conflicts. Requires <mark style="color:red;">**Red4Ext**</mark>.&#x20;

[<mark style="color:red;">**Tweak XL**</mark>](https://www.nexusmods.com/cyberpunk2077/mods/4197):  [a modding tool and a framework](https://www.nexusmods.com/cyberpunk2077/mods/4197) to create mods that modify TweakDB, a proprietary database of REDengine 4, containing essential information about game entities and behavior. Requires <mark style="color:red;">**Red4Ext**</mark>.&#x20;

[<mark style="color:red;">**Codeware**</mark>](https://www.nexusmods.com/cyberpunk2077/mods/7780): is a library and framework for creating redscript and Cyber Engine Tweaks mods. Requires <mark style="color:red;">**Red4Ext**</mark>.&#x20;

_**Other optional mods that greatly enhance user experience**_

[<mark style="color:red;">**EquipmentEx**</mark>](https://www.nexusmods.com/cyberpunk2077/mods/6945):  [an extender of Cyberpunk's core functionality](https://github.com/psiberx/cp2077-equipment-ex) in regards to clothes transmog system

[<mark style="color:red;">**Cyberware-EX**</mark>](https://www.nexusmods.com/cyberpunk2077/mods/9429): an extender of Cyberpunk's core functionality in regards to cyberware slot expansions system

<mark style="color:red;">**AMM**</mark>: [Appearance Menu Mod](https://www.nexusmods.com/cyberpunk2077/mods/790) is your ultimate Photo Mode helper that allows you to use tools to move NPCs and V around, pose them and further expand your photography portfolio with [AMM Add-on - Nibbles to NPCs 2.0](https://www.nexusmods.com/cyberpunk2077/mods/8125); change the time of day or even teleport to a curated list of locations. Unleash your creativity by changing NPCs looks - now with extended features by using [Appearance Creator Mod](https://www.nexusmods.com/cyberpunk2077/mods/10795) - decorate with endless props, and so much more awaits! Requires <mark style="color:red;">**CET**</mark> and <mark style="color:red;">**Codeware**</mark>.
