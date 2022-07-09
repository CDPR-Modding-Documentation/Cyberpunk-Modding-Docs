# Glossary

A comprehensive list of jargon you might see on this Wiki or around our community. This glossary is not alphabetical, so be sure to use your browser search function to find what you're looking for. (CTRL+F for most applications)

## General

### REDengine

&#x20;The proprietary video game engine developed by CD Projekt Red for The Witcher 3 and Cyberpunk 2077.\
Alternatively referred to as **RED3**, **RED4**

### GitHub

&#x20;A website which hosts code and helps programmers collaborate on projects. The source code for WolvenKit is hosted here. You can compile the WolvenKit source code yourself, or for non-developers you can find WolvenKit releases here first.

## Modding Tools

### WolvenKit

The unofficial community modding toolkit. (Hint: This is the WolvenKit Wiki)

### WolvenKit CLI

The command line interface version of WolvenKit. (Formerly CP77 Tools)

### CP77 Tools

The original Cyberpunk 2077 modding CLI tool. (Deprecated by WolvenKit CLI)

### Official Modkit for The Witcher 3 (WCC)

An official CDPR command-line tool for modding The Witcher 3. Legacy WolvenKit makes extensive use of the Modkit. We aim to deprecate the Modkit with WolvenKit.

## WolvenKit

### masklist

The masklist file is a custom .txt document used as a helper file to generate new mlmasks using the [**Import/Export**](broken-reference) tool.

### Material json

Material json files are used by the [**Import/Export**](broken-reference) tool during for the mesh I/O process. The json will be named after the mesh file then suffixed with `.Material.json`\
i.e. judy\_01.Material.json

## Game Files

### W2RC/CR2W

The file magic number for REDengine files. For more information about magic numbers see this [Wikipedia page](https://en.wikipedia.org/wiki/List\_of\_file\_signatures). REDengine format files are commonly referenced as W2RC/CR2W files for shorthand. Originally only CR2W was used, but it was discovered years later that the magic should be read _backwards_, as **W**itcher **2** **R**esource **C**lass.

### Raw

Generic term used to refer to non-REDengine files that have a CR2W counterpart. The raw format of the REDengine XBM texture format can be TGA, PNG, DDS, etc. e.g. "Do you have the raw texture?" - This is an inquiry about the TGA/PNG/DDS counterpart to a game texture file.

### Uncooked

A term used to describe a CR2W file in its most basic uncompressed state.\
e.g. After using the Official Witcher 3 Modkit to import an FBX to W2MESH, this file is uncooked. Rather than calling these files imported, the uncooked terminology is derived from the cooked (compressed) file state.

### Cooked

A CR2W file that's imported or encoded as an engine file, then debugged, compressed, and buffered by the REDengine build process. Files extracted with the Asset Browser using WolvenKit (including Legacy) are cooked files.

### Packed

The final unified package file used by REDengine games. The Witcher 3 uses bundle files while Cyberpunk 2077 uses the archive file format.

## Modding

### Vanilla

Original or unmodified\
i.e. Johnny Silverhand's _vanilla_ appearance can be changed with a DLC
