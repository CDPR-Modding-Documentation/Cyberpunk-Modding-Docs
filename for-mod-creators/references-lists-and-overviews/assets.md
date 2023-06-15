# Assets

## What is an asset?

An asset is a specific, objectified concept in the game that can be highly detailed like a blade of grass, or larger like a building, or intangible like sound effects. Unity defines an asset as, "Shorthand for anything that goes into a video game – characters, objects, sound effects, maps, environments, etc." Every asset is defined in a set of [normalized](https://en.wikipedia.org/wiki/Database\_normalization) asset files that describe its relationship to the game, other assets, and itself.

## Visual Asset-Related File Formats

The following list contains file formats that are used to compose visual assets such as vehicles and weapons.

{% hint style="info" %}
The community-devloped tool **WolvenKit** can be used to browse game archives and extract game files.\
\
[Learn more](http://localhost:5000/o/-MP5ijqI11FeeX7c8-N8/s/-MP\_ozZVx2gRZUPXkd4r/)
{% endhint %}

### MESH

3d models

### XBM

2d textures

### ENT (entity)

Parent file for most visual assets which is directly linked by the [**Tweak DB**](tweaks.md#what-is-the-tweak-db)

### APP (appearance)

Sets up appearances for assets such as NPCs and vehicles referenced by [**entity files**](assets.md#ent-entity)

### MT (material template)

Base shader files for REDengine

### MI (material instance)

Instanced shaders for mesh materials

### MLMASK (multilayered mask)

Mask component of the [**Multilayer supershader**](../materials/multilayered.md)

### MLSETUP (multilayered setup)

Material setup component of the [**Multilayer supershader**](../materials/multilayered.md)

### MLTEMPLATE (multilayered template)

Pre-defined tiling surface component of the [**Multilayer supershader**](../materials/multilayered.md)

### HP (hair profile)

Color ramp data to set colors for meshes using the hair [**shader**](shaders/)

## Visual Asset Graphs

#### Vehicles

![](<../../.gitbook/assets/CP2077 Vehicle Example.svg>)

