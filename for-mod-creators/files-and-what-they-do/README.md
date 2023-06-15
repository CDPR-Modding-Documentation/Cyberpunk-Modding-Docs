---
description: What do the different files do? How do I mod them?
---

# 📂 Files and what they do

**Created by @manavortex**\
**Published April 10 2023**\
**Game version: 1.6.1\_DLSS**

{% hint style="info" %}
For an exhaustive list, see the [W2RC File Format Table.](./#w2rc-file-format-table)
{% endhint %}

## .app (Appearance definition)

This file contains a list of appearances with their associated **components**. To load them, you require a [root entity](./#root-entity) .ent.

{% content-ref url="appearance-.app-files.md" %}
[appearance-.app-files.md](appearance-.app-files.md)
{% endcontent-ref %}

Holds a list of components.

## .ent (Entity)

### Root entity

The **entry point** for the game to display an [NPC](../modding-guides/npcs/appearances-change-the-looks.md#the-.ent-file) or [prop](../modding-guides/everything-else/custom-props.md). This kind of entity usually doesn't have components by itself, but only points towards the [.app file](./#.app-appearance-definition) where they are defined.&#x20;

From ArchiveXL item additions, this kind of file is usually called a **root entity**.

### Mesh entity / Component entity

**For player items**, an .ent file can serve as a **wrapper**, splitting components out of the .app file by putting them in their own file.

{% content-ref url="entity-.ent-files/" %}
[entity-.ent-files](entity-.ent-files/)
{% endcontent-ref %}

## Components

Not a file type but an internal data structure and part of [.ent](./#.ent-entity) or [.app](./#.app-appearance-definition) files. Components are how the game adds anything to the in-game world, from pag3d data over player interaction prompts to explosion sounds.

{% content-ref url="components/" %}
[components](components/)
{% endcontent-ref %}

## .inkatlas (Texture mapping)



## .mesh (3d object)

A 3d object, holding [appearances](../modding-guides/npcs/appearances-change-the-looks.md), [materials](../materials/), and [rigging](../3d-modelling/meshes-and-armatures-rigging.md).&#x20;

A mesh can have several **submeshes**, which can be displayed or hidden via [chunkmasks](../modding-guides/items-equipment/influencing-other-items.md#partsoverrides).&#x20;



## .mi / .mt / .remt

A material definition for a shader. You can assign those to **CMaterialInstance** entries in your mesh and then define their qualities by changing their parameters.&#x20;

{% hint style="info" %}
For further detes on materials, see [here](../materials/). \
For an explanation on .mi files, see [here](../materials/re-using-materials-.mi.md).
{% endhint %}

### Relevant properties:&#x20;

|                                                                       |                                                                                          |
| --------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| Different per material — see parameters/\[2] for a list of properties | <p>e.g. BaseColor, Metalness, NormalStrength<br>or VectorField, FresnelColor, Albedo</p> |
|                                                                       |                                                                                          |

<figure><img src="../../.gitbook/assets/materials_eye_gradient_mi.png" alt=""><figcaption></figcaption></figure>

## .streaingsector (world data

This file holds world environment information and -properties. Due to its complexity, information is grouped on its sub-page.&#x20;

{% content-ref url="the-whole-world-.streamingsector.md" %}
[the-whole-world-.streamingsector.md](the-whole-world-.streamingsector.md)
{% endcontent-ref %}

## .xbm (Texture)

A regular texture file. Can be exported to .png via WolvenKit, edited, and imported back into the game.&#x20;

{% hint style="info" %}
If you stick to the game's naming schema, Wolvenkit will auto-detect the right import settings for you.
{% endhint %}

### Normal maps

Can be either blue or yellow (inverted), both exists. For a guide how to make your own, see [here](../3d-modelling/self-made-normal-maps/).&#x20;

Cyberpunk normal maps are swizzled (a technique originally employed in DTX-5).&#x20;

* The red channel stores the X axis
* The green channel stores the Y axis
* The blue channel is empty, since the Z-data will be calculated from red and blue.&#x20;

### Relevant properties:&#x20;

|         |                                                                                                                                              |
| ------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| IsGamma | <p>Override in-game gamma (lighting)? <br><br>- Set to "false" for normals<br>- Set to "true" for diffuse/albedo and any parts of the UI</p> |
|         |                                                                                                                                              |

##

## W2RC File Format Table

| Extension                |                 Description                | Fully Parsed |
| ------------------------ | :----------------------------------------: | :----------: |
| actionanimdb             |                  Animation                 |              |
| acousticdata             |                    Audio                   |              |
| aiarch                   |               Pathfinding/AI               |              |
| animgraph                |               Animation graph              |              |
| anims                    |               Animation data               |              |
| app                      |       Mesh appearance configurations       |              |
| archetypes               |                      ?                     |              |
| areas                    |               Terrain related              |              |
| audio\_metadata          |                      ?                     |              |
| audiovehcurveset         |                      ?                     |              |
| behavior                 |                      ?                     |              |
| bikecurveset             |                      ?                     |              |
| bk2                      |                 Bink video                 |              |
| bnk                      |                 Bink video                 |              |
| camcurveset              |             Camera curve preset            |              |
| cfoliage                 |                      ?                     |              |
| charcustpreset           |           Character editor preset          |              |
| cminimap                 |                   Minimap                  |              |
| community                |                Quest related               |              |
| conversations            |              Cutscene related              |              |
| cooked\_mlsetup          |                 See mlsetup                |              |
| cooked\_anims            |                  See anims                 |              |
| cookedapp                |                   See app                  |              |
| credits                  |          Configuration for credits         |              |
| cubemap                  |            6-sided cube texture            |              |
| curveset                 |                      ?                     |              |
| devices                  |                      ?                     |              |
| dtex                     |                      ?                     |              |
| effect                   |                      ?                     |              |
| ent                      |                   Entity                   |              |
| env                      |           Environment definition           |              |
| envparam                 |                      ?                     |              |
| envprobe                 |                      ?                     |              |
| es                       |                      ?                     |              |
| facialcustom             |                      ?                     |              |
| facialsetup              |                      ?                     |              |
| fb2tl                    |                      ?                     |              |
| fnt                      |                    Font                    |              |
| folbrush                 |                Foliage brush               |              |
| foldest                  |        Destructible foliage element        |              |
| fp                       |                      ?                     |              |
| gamedef                  |        Game main configuration file        |              |
| garmentlayerparams       |                      ?                     |              |
| genericanimdb            |                      ?                     |              |
| gidata                   |                      ?                     |              |
| gradient                 |                      ?                     |              |
| hitrepresentation        |                      ?                     |              |
| hp                       |                Hair profile                |              |
| ies                      |                      ?                     |              |
| inkanim                  |                UI animation                |              |
| inkatlas                 |              UI texture atlas              |              |
| inkcharcustomization     |            UI character related            |              |
| inkfontfamily            |                   UI font                  |              |
| inkfullscreencomposition |                     UI                     |              |
| inkgamesettings          |                 UI settings                |              |
| inkhud                   |                     UI                     |              |
| inklayers                |                     UI                     |              |
| inkmenu                  |                     UI                     |              |
| inkshapecollection       |                     UI                     |              |
| inkstyle                 |                     UI                     |              |
| inktypography            |                     UI                     |              |
| inkwidget                |                     UI                     |              |
| interaction              |                     UI                     |              |
| journal                  |                 Quest info                 |              |
| journaldesc              |                 Quest info                 |              |
| lane\_connections        |                      ?                     |              |
| lane\_polygons           |                      ?                     |              |
| lane\_spots              |                      ?                     |              |
| lights                   |                      ?                     |              |
| lipmap                   |                      ?                     |              |
| location                 |                      ?                     |              |
| locopaths                |                      ?                     |              |
| loot                     |                      ?                     |              |
| mappins                  |                 Pins on map                |              |
| mesh                     |                 Mesh/model                 |              |
| mi                       |    Instanced external shaders/materials    |              |
| mlmask                   |      Masks for multilayer supershader      |              |
| mlsetup                  |    Setup file for multilayer supershader   |              |
| mltemplate               |  Template file for multilayer supershader  |              |
| morphtarget              |           Blend shapes/shape keys          |              |
| mt                       |                 Base shader                |              |
| navmesh                  |            AI navigation meshes            |              |
| null\_areas              |                      ?                     |              |
| opusinfo                 |                    Audio                   |              |
| opuspak                  |                    Audio                   |              |
| particle                 |                  Particles                 |              |
| phys                     |            Nvidia PhysX related            |              |
| physicalscene            |            Nvidia PhysX related            |              |
| physmatlib               |            Nvidia PhysX related            |              |
| poimappins               |                   Map pin                  |              |
| psrep                    |                      ?                     |              |
| quest                    |                    Quest                   |              |
| questphase               |              Quest progression             |              |
| regionset                |                      ?                     |              |
| remt                     |  Similar to **mt**, difference is unclear  |              |
| reslist                  |                Resource list               |              |
| rig                      |         Rig/skeleton for animation         |              |
| scene                    |                  Cutscene                  |              |
| scenesversions           |             Cutscene versioning            |              |
| smartobject              |                      ?                     |              |
| smartobjects             |                      ?                     |              |
| sp                       |                Skin profile                |              |
| spatial\_representation  |                      ?                     |              |
| streamingquerydata       |                   Terrain                  |              |
| streamingsector          |                   Terrain                  |              |
| streamingsector\_inplace |                   Terrain                  |              |
| streamingworld           |                   Terrain                  |              |
| terrainsetup             |                   Terrain                  |              |
| texarray                 |              Multiple textures             |              |
| traffic\_collisions      |                      ?                     |              |
| traffic\_persistent      |                      ?                     |              |
| voicetags                |                      ?                     |              |
| w2mesh                   | Leftover **mesh** file with RED3 extension |              |
| w2mi                     |  Leftover **mi** file with RED3 extension  |              |
| workspot                 |                      ?                     |              |
| xbm                      |                   Texture                  |              |
| xcube                    |                   Texture                  |              |

## Generic Format

\<explanation>

### Generic FIle Format Table

| Extension | Description       |
| --------- | ----------------- |
| csv       | Standard CSV file |
| wem       | Audio file        |



## Archive Format

#### File Structure

| Name        | Type/Size                   | Info                                                                    |
| ----------- | --------------------------- | ----------------------------------------------------------------------- |
| Header      | [Header](./#undefined)      | See [specification of Header](./#undefined) below.                      |
| Custom Data | [Custom Data](./#undefined) | WolvenKit only. See [specification of custom data](./#undefined) below. |
| Files       | data                        | Raw file data                                                           |
| File List   | [File List](./#undefined)   | See [specification of file list](./#undefined) below.                   |

#### Header

| Name             | Type/Size | Info                              |
| ---------------- | --------- | --------------------------------- |
| Magic            | char\[4]  | Constant: "RDAR"                  |
| Version          | uint32    | Currently 12                      |
| IndexPosition    | uint64    | Offset of beginning of file list  |
| IndexSize        | uint32    | Size of file list                 |
| DebugPosition    | uint64    | Always 0                          |
| DebugSize        | uint32    | Always 0                          |
| Filesize         | uint64    | Size of file (excluding Filesize) |
| CustomDataLength | uint32    | **WolvenKit only**                |

#### Custom Data (WolvenKit)

The following data only applies for archives created with WolvenKit

| Name        | Type/Size           | Info                      |
| ----------- | ------------------- | ------------------------- |
| Magic       | char\[4]            | Constant: "LXRS"          |
| Version     | uint32              | Currently 1               |
| Size        | int32               | Size of uncompressed data |
| ZSize       | int32               | Size of compressed data   |
| PathCount   | int32               | Number of custom paths    |
| PathStrings | zstring\[PathCount] | Custom file paths         |

#### File List

| Name                    | Type/Size                                       | Info                                                      |
| ----------------------- | ----------------------------------------------- | --------------------------------------------------------- |
| FileTableOffset         | uint32                                          | Always 8                                                  |
| FileTableSize           | uint32                                          |                                                           |
| CRC                     | uint64                                          | Checksum of ???                                           |
| FileEntryCount          | uint32                                          | Number of files                                           |
| FileSegmentCount        | uint32                                          | Number of file segments                                   |
| ResourceDependencyCount | uint32                                          | Number of resource dependencies                           |
| FileRecords             | [File Record](./#file-record)\[FileEntryCount]  | See [specification of file record](./#file-record) below. |
| FileSegments            | [File Segment](./#undefined)\[FileSegmentCount] | See [specification of file segment](./#undefined) below.  |
| ResourceDependencies    | uint64\[ResourceDependencyCount]                |                                                           |

#### File Record

| Name                      | Type/Size  | Info                                            |
| ------------------------- | ---------- | ----------------------------------------------- |
| NameHash64                | uint64     | FNV1A64 hash of the filename                    |
| Timestamp                 | int64      | Windows filetime of file creation               |
| NumInlineBufferSegments   | uint32     | Number of inline buffers                        |
| SegmentsStart             | uint32     | Index of the first [file segment](./#undefined) |
| SegmentsEnd               | uint32     | Index of the last [file segment](./#undefined)  |
| ResourceDependenciesStart | uint32     | Index of the first resource dependency          |
| ResourceDependenciesEnd   | uint32     | Index of the last resource dependency           |
| SHA1Hash                  | uint8\[20] | SHA1 hash of the file                           |

#### File Segment

| Name   | Type/Size | Info                      |
| ------ | --------- | ------------------------- |
| Offset | uint64    | Offset of the data        |
| ZSize  | uint32    | Size of compressed data   |
| Size   | uint32    | Size of uncompressed data |
