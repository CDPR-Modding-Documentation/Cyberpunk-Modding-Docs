---
description: List of words that need more context
---

# Glossary

A comprehensive list of jargon you might see on this Wiki or around our community. This glossary is not alphabetical, so be sure to use your browser search function to find what you're looking for. (CTRL+F for most applications)

## General

* <mark style="color:red;">**GitHub**</mark>: A website which hosts code and helps programmers collaborate on projects. The source code for e.g. WolvenKit or Cyber Engine Tweaks is hosted there. You can compile the WolvenKit source code yourself, or for non-developers you can find WolvenKit releases here first.
* <mark style="color:red;">**REDengine**</mark>: The proprietary video game engine developed by CD Projekt Red for The Witcher 3 and Cyberpunk 2077. Witcher 3 uses REDengine 3 (RED3), Cyberpunk 2077 uses REDengine 4 (RED4).

## Modding Tools

* <mark style="color:red;">**Official Modkit for The Witcher 3 (WCC)**</mark>: An official CDPR command-line tool for modding The Witcher 3. Legacy WolvenKit makes extensive use of the Modkit. If you want to mod the Witcher, you're in the wrong wiki, choom!
* <mark style="color:red;">**REDmod**</mark>: An [official CDPR command-line tool](../for-mod-creators/core-mods-explained/redmod/) for [modding Cyberpunk 2077](../for-mod-creators/modding-tools/redmod/).&#x20;
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

<mark style="color:red;">**CET**</mark>: One of Cyberpunk's core mods, [Cyber Engine Tweaks](https://wiki.redmodding.org/cyber-engine-tweaks/).&#x20;

<mark style="color:red;">**Red4Ext**</mark>: One of Cyberpunk's core mods, the [RED script extender](https://app.gitbook.com/o/-MP5ijqI11FeeX7c8-N8/s/-MjhIjZ0BBsL6SCohtnf/) (not to confuse with [Redscript](https://app.gitbook.com/o/-MP5ijqI11FeeX7c8-N8/s/-McniwB8YOK2HnJ7SYg\_/)).&#x20;

<mark style="color:red;">**SomethingXL**</mark>, e.g. [ArchiveXL](../for-mod-creators/core-mods-explained/archivexl/), [TweakXL](../for-mod-creators/core-mods-explained/tweakxl.md):  One of Cyberpunk's core mods (by modder psiberx). Requires <mark style="color:red;">**Red4Ext**</mark>.&#x20;

<mark style="color:red;">**SomethingEx**</mark>, e.g. CyberwareEx, EquiipmentEx:  An extender of Cyberpunk's core functionality (usually by modder psiberx).&#x20;

<mark style="color:red;">**AMM**</mark>: [AppearanceMenuMod](https://www.nexusmods.com/cyberpunk2077/mods/790). Advertised as a mod "for virtual photography", but that's like calling an orbital laser a toaster. Requires <mark style="color:red;">**CET**</mark>.

<mark style="color:red;">**EBBWTFBBQ**</mark>: Probably a body mod. Seriously, who can even keep track?
