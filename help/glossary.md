---
description: List of words that need more context
---

# Glossary

A comprehensive list of jargon you might see on this Wiki or around our community. This glossary is not alphabetical, so be sure to use your browser search function to find what you're looking for. (CTRL+F for most applications)

## General

* <mark style="color:yellow;">**GitHub**</mark>: A website which hosts code and helps programmers collaborate on projects. The source code for WolvenKit is hosted here. You can compile the WolvenKit source code yourself, or for non-developers you can find WolvenKit releases here first.
* <mark style="color:yellow;">**REDengine**</mark>: The proprietary video game engine developed by CD Projekt Red for The Witcher 3 and Cyberpunk 2077. Alternatively referred to as RED3, RED4

## Modding Tools

* <mark style="color:yellow;">**CP77 Tools**</mark>: The original Cyberpunk 2077 modding CLI tool. (Deprecated by WolvenKit CLI)
* <mark style="color:yellow;">**Official Modkit for The Witcher 3 (WCC)**</mark>: An official CDPR command-line tool for modding The Witcher 3. Legacy WolvenKit makes extensive use of the Modkit. We aim to deprecate the Modkit with WolvenKit.
* <mark style="color:yellow;">**WolvenKit**</mark>: The unofficial community modding toolkit. (Hint: This is the WolvenKit Wiki)
* <mark style="color:yellow;">**WolvenKit CLI**</mark>: The command line interface version of WolvenKit. (Formerly CP77 Tools)

## WolvenKit

* <mark style="color:yellow;">**masklist**</mark>: The masklist file is a custom .txt document used as a helper file to generate new mlmasks using the Import/Export tool.
* <mark style="color:yellow;">**Material json**</mark>: Material json files are used by the Import/Export tool during for the mesh I/O process. The json will be named after the mesh file then suffixed with .Material.json (i.e. judy\_01.Material.json)

## Game Files

* <mark style="color:yellow;">**Cooked**</mark>: A CR2W file that's imported or encoded as an engine file, then debugged, compressed, and buffered by the REDengine build process. Files extracted with the Asset Browser using WolvenKit (including Legacy) are cooked files.
* <mark style="color:yellow;">**Packed**</mark>: The final unified package file used by REDengine games. The Witcher 3 uses bundle files while Cyberpunk 2077 uses the archive file format.
* <mark style="color:yellow;">**Raw**</mark>: Generic term used to refer to non-REDengine files that have a CR2W counterpart. The raw format of the REDengine XBM texture format can be TGA, PNG, DDS, etc. e.g. "Do you have the raw texture?" - This is an inquiry about the TGA/PNG/DDS counterpart to a game texture file.
* <mark style="color:yellow;">**Resource**</mark>: A technical term for a REDengine file, this term is baked into the game code.
* <mark style="color:yellow;">**Uncooked**</mark>: A term used to describe a CR2W file in its most basic uncompressed state. e.g. After using the Official Witcher 3 Modkit to import an FBX to W2MESH, this file is uncooked. Rather than calling these files imported, the uncooked terminology is derived from the cooked (compressed) file state.
* <mark style="color:yellow;">**W2RC/CR2W**</mark>: The file magic number for REDengine files. For more information about magic numbers see this Wikipedia page. REDengine format files are commonly referenced as W2RC/CR2W files for shorthand. Originally only CR2W was used, but it was discovered years later that the magic should be read backwards, as Witcher 2 Resource Class.

## Modding

* <mark style="color:yellow;">**Reference**</mark>: A string value in a _resource_ that exists in another _resource_, and it is used to chain resource together as they are loaded into the game. Some examples are a DepotPath that points at another resource, a list index that points at a material entry, and an appearance that points at a component.
* <mark style="color:yellow;">**Vanilla**</mark>: Original or unmodified i.e. Johnny Silverhand's vanilla appearance can be changed with a DLC.
