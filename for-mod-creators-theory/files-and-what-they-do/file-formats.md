---
description: All inclusive list of REDengine file formats
---

# File Formats

**Written & Published: April 10 2023 by @manavortex**\
**Game version: 2.1**

{% hint style="info" %}
For an exhaustive list, see the [W2RC File Format Table.](file-formats.md#w2rc-file-format-table)
{% endhint %}

## .app (Appearance definition)

This file contains a list of appearances with their associated **components**. To load them, you require a [root entity](file-formats.md#root-entity) .ent. The .app files also contain extensive parameters for wounds and dismemberment, determining which meshes to use for different types of garment an NPC might be wearing, and even the physics behavior of these meshes.

{% content-ref url="appearance-.app-files/" %}
[appearance-.app-files](appearance-.app-files/)
{% endcontent-ref %}

Holds a list of components.

## .ent (Entity)

### Root entity

{% hint style="info" %}
[As of Phantom Liberty, there are duplicates of many .ent files in the filebase. Whenever you come across a duplicate, pick the one that has "ep1" in its name.](#user-content-fn-1)[^1]
{% endhint %}

The **entry point** for the game to display an [NPC](../../modding-guides/npcs/appearances-change-the-looks/#the-.ent-file) or [prop](../../modding-guides/everything-else/custom-props/). It is a collection of components that the entity is comprised of, determining their parameters or referencing the files that have said parameters. For instance, NPC .ent files have over a hundred components each, such as entAnimatedComponent (references the correct .anims, .animgraph and .rig files), entTemplateAppearance (references all .app files that are applicable to the entity) and entEffectSpawner (references all .effect files for decals or particles that the entity can spawn). Many of these components have configurable parameters, and the .ent file itself has many under the "entity" section. Many of these parameters, however, are merely the initial state of the entity and are modified in gameplay (such as the boolean isRagdolling).

From ArchiveXL item additions, this kind of file is usually called a **root entity**.

### Mesh entity / Component entity

**For player items**, an .ent file can serve as a **wrapper**, splitting components out of the .app file by putting them in their own file.

{% content-ref url="entity-.ent-files/" %}
[entity-.ent-files](entity-.ent-files/)
{% endcontent-ref %}

## Components

Not a file type but an internal data structure and part of [.ent](file-formats.md#.ent-entity) or [.app](file-formats.md#.app-appearance-definition) files. Components are how the game adds anything to the in-game world, from pag3d data over player interaction prompts to explosion sounds.

{% content-ref url="components/" %}
[components](components/)
{% endcontent-ref %}

## .inkatlas (Texture mapping)

## .mesh (3d object)

A 3d object, holding [appearances](../../modding-guides/npcs/appearances-change-the-looks/), [materials](../materials/), and [rigging](../3d-modelling/meshes-and-armatures-rigging.md). Meshes for inanimate objects also tend to contain the physics parameters of these objects, whereas NPC meshes tend to contain some garment parameters.

A mesh can have several **submeshes**, which can be displayed or hidden via [chunkmasks](../../modding-guides/items-equipment/influencing-other-items.md#partsoverrides).&#x20;

## .mi / .mt / .remt

A material definition for a shader. You can assign those to **CMaterialInstance** entries in your mesh and then define their qualities by changing their parameters.&#x20;

{% hint style="info" %}
For further detes on materials, see [here](../materials/). \
For an explanation on .mi files, see [here](materials/re-using-materials-.mi.md).
{% endhint %}

### Relevant properties:&#x20;

|                                                                       |                                                                                          |
| --------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| Different per material — see parameters/\[2] for a list of properties | <p>e.g. BaseColor, Metalness, NormalStrength<br>or VectorField, FresnelColor, Albedo</p> |
|                                                                       |                                                                                          |

<figure><img src="../../.gitbook/assets/materials_eye_gradient_mi.png" alt=""><figcaption></figcaption></figure>

## .opusinfo/.opuspak (audio)

OpusPaks are collections of opus audio files, they are described by the `sfx_container.opusinfo` file. For more info see the Audio Files page:

{% content-ref url="audio-files.md" %}
[audio-files.md](audio-files.md)
{% endcontent-ref %}

## .streamingsector (world data)

This file holds world environment information and -properties. Due to its complexity, information is grouped on its sub-page.&#x20;

{% content-ref url="the-whole-world-.streamingsector/" %}
[the-whole-world-.streamingsector](the-whole-world-.streamingsector/)
{% endcontent-ref %}

## .wem (audio)

A Wwise audio file, usually containing a **voice-over** or **music**. You can find more info on the Audio files page:

{% content-ref url="audio-files.md" %}
[audio-files.md](audio-files.md)
{% endcontent-ref %}

## .xbm (Texture)

A regular texture file. Can be exported to .png via WolvenKit, edited, and imported back into the game. The type of texture is often indicated at the end of the filename. For instance, diffuse textures are specified as "\_d" and normals are specified as "\_n".

{% hint style="info" %}
If you stick to the game's naming schema, Wolvenkit will auto-detect the right import settings for you.
{% endhint %}

### Normal maps

Can be either blue or yellow (inverted), both exist. For a guide how to make your own, see [here](../../modding-guides/textures-and-luts/self-made-normal-maps/).&#x20;

Cyberpunk normal maps are swizzled (a technique originally employed in DTX-5).&#x20;

* The red channel stores the X axis
* The green channel stores the Y axis
* The blue channel is empty, since the Z-data will be calculated from red and blue.&#x20;

### Texture Atlases

Texture atlases contain multiple textures that the game may choose at random (such as blood splatters, as seen in **fx\_blood\_splatter\_2x2\_01\_d.xbm**) or play sequentially (as seen in **splash\_texture.atlas\_n.xbm**, used by the game for the blood puddle animation). Texture atlases won't always have "atlas" in their filename, but can still be quickly identified by the size of the grid. For instance, "3x3" in the filename means a grid of nine textures. In the asset browser, right-clicking on the file and selecting "Find Files Using This" will take you to files that allow further customization of how the game interacts with the grid.

### Relevant properties:&#x20;

|         |                                                                                                                                              |
| ------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| IsGamma | <p>Override in-game gamma (lighting)? <br><br>- Set to "false" for normals<br>- Set to "true" for diffuse/albedo and any parts of the UI</p> |
|         |                                                                                                                                              |

## W2RC File Format Table

| Extension                                                                                                               |                                                                                 Description                                                                                | Fully Parsed |
| ----------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :----------: |
| [actionanimdb](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/actionanimdb.txt)                         |                             Animation databases that rename and organize animations for use in scripts and other files such as animation graphs                            |              |
| [acousticdata](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/acousticdata.txt)                         |                                                                                    Audio                                                                                   |              |
| [aiarch](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/aiarch.txt)                                     |                                                                               Pathfinding/AI                                                                               |              |
| [animgraph](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/animgraph.txt)                               |    Animation and physics graphs, used for visual scripting of all animations associated to an entity, as well as physics behavior of dangling objects such as necklaces    |              |
| [anims](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/anims.txt)                                       |                                                             Collections of individual animations and their data                                                            |              |
| [app](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/app.txt)                                           |                                                Mesh appearance configurations, as well as wound/dismemberment configurations                                               |              |
| [archetypes](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/archetypes.txt)                             |                                                                                      ?                                                                                     |              |
| [areas](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/areas.txt)                                       |                                                                               Terrain related                                                                              |              |
| [audio\_metadata](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/audio\_metadata.txt)                   |                                                                                      ?                                                                                     |              |
| [audiovehcurveset](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/audiovehcurveset.txt)                 |                                                                                      ?                                                                                     |              |
| [behavior](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/behavior.txt)                                 |                                               A.I. behavior graphs, can be used to influence NPC reactions to various stimuli                                              |              |
| [bikecurveset](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/bikecurveset.txt)                         |                                                                                      ?                                                                                     |              |
| [bk2](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/bk2.txt)                                           |                                                                                 Bink video                                                                                 |              |
| [bnk](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/bnk.txt)                                           |                                                                                 Bink video                                                                                 |              |
| [camcurveset](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/camcurveset.txt)                           |                                                                             Camera curve preset                                                                            |              |
| [cfoliage](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/cfoliage.txt)                                 |                                                                                      ?                                                                                     |              |
| [charcustpreset](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/charcustpreset.txt)                     |                                                                           Character editor preset                                                                          |              |
| [cminimap](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/cminimap.txt)                                 |                                                                                   Minimap                                                                                  |              |
| [community](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/community.txt)                               |                                                                                Quest related                                                                               |              |
| [conversations](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/conversations.txt)                       |                                                                              Cutscene related                                                                              |              |
| [cooked\_mlsetup](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/cooked\_mlsetup.txt)                   |                                                                                 See mlsetup                                                                                |              |
| [cooked\_anims](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/cookedanims.txt)                         |                                                                                  See anims                                                                                 |              |
| [cookedapp](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/cookedapp.txt)                               |                                                                                   See app                                                                                  |              |
| [credits](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/credits.txt)                                   |                                                                          Configuration for credits                                                                         |              |
| [cubemap](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/cubemap.txt)                                   |                                                                            6-sided cube texture                                                                            |              |
| [curveset](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/curveset.txt)                                 |                                              Determines the curve graph values of things such as fall damage and level scaling                                             |              |
| [devices](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/devices.txt)                                   |                                                                                      ?                                                                                     |              |
| [dtex](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/dtex.txt)                                         |                                                                                      ?                                                                                     |              |
| [effect](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/effect.txt)                                     |                Master file for visual effects such as particles and decals. Holds parameters and has a second tab for editing the associated .particle file.               |              |
| [ent](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/ent.txt)                                           |                                       Entity, master file that contains all components and parameters of which an entity is comprised                                      |              |
| [env](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/env.txt)                                           |                                                                           Environment definition                                                                           |              |
| [envparam](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/envparam.txt)                                 |                                                                                      ?                                                                                     |              |
| [envprobe](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/envprobe.txt)                                 |                                                                                      ?                                                                                     |              |
| [es](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/es.txt)                                             |                                          Behavior parameters for attacks, weapons and explosions. Highly influential on gameplay.                                          |              |
|                                                                                                                         |                                                                                                                                                                            |              |
| [facialcustom](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/facialcustom.txt)                         |                                                                                      ?                                                                                     |              |
| [facialsetup](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/facialsetup.txt)                           |                                                                                      ?                                                                                     |              |
| [fb2tl](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/fb2tl.txt)                                       |                                                                                      ?                                                                                     |              |
| [fnt](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/fnt.txt)                                           |                                                                                    Font                                                                                    |              |
| [folbrush](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/folbrush.txt)                                 |                                                                                Foliage brush                                                                               |              |
| [foldest](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/foldest.txt)                                   |                                                                        Destructible foliage element                                                                        |              |
| [fp](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/fp.txt)                                             |                                                                                      ?                                                                                     |              |
| [gamedef](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/gamedef.txt)                                   |                                                                        Game main configuration file                                                                        |              |
| [garmentlayerparams](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/garmentlayerparams.txt)             |                                                                                      ?                                                                                     |              |
| [genericanimdb](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/genericanimdb.txt)                       |    Animation database that determines which animations should play based on various enum inputs (see associated .csv to see which parameter corresponds to what number)    |              |
| [gidata](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/gidata.txt)                                     |                                                                                      ?                                                                                     |              |
| [gradient](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/gradient.txt)                                 |                                                                                      ?                                                                                     |              |
| [hitrepresentation](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/hitrepresentation.txt)               |                      Hit detection for different body parts, as well as visual feedback based on whether the material is flesh, metal, cyberware, etc.                     |              |
| [hp](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/hp.txt)                                             |                                                                                Hair profile                                                                                |              |
| [ies](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/ies.txt)                                           |                                                                                      ?                                                                                     |              |
| [inkanim](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/inkanim.txt)                                   |                                                                                UI animation                                                                                |              |
| [inkatlas](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/inkatlas.txt)                                 |                                                                              UI texture atlas                                                                              |              |
| [inkcharcustomization](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/inkcharcustomization.txt)         |                                                                            UI character related                                                                            |              |
| [inkfontfamily](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/inkfontfamily.txt)                       |                                                                                   UI font                                                                                  |              |
| [inkfullscreencomposition](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/inkfullscreencomposition.txt) |                                                                                     UI                                                                                     |              |
| [inkgamesettings](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/inkgamesettings.txt)                   |                                                                                 UI settings                                                                                |              |
| [inkhud](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/inkhud.txt)                                     |                                                                                     UI                                                                                     |              |
| [inklayers](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/inklayers.txt)                               |                                                                                     UI                                                                                     |              |
| [inkmenu](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/inkmenu.txt)                                   |                                                                                     UI                                                                                     |              |
| [inkshapecollection](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/inkshapecollection.txt)             |                                                                                     UI                                                                                     |              |
| [inkstyle](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/inkstyle.txt)                                 |                                                                                     UI                                                                                     |              |
| [inktypography](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/inktypography.txt)                       |                                                                                     UI                                                                                     |              |
| [inkwidget](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/inkwidget.txt)                               |                                                                                     UI                                                                                     |              |
| [interaction](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/interaction.txt)                           |                                                                                     UI                                                                                     |              |
| [journal](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/journal.txt)                                   |                                                                                 Quest info                                                                                 |              |
| [journaldesc](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/journaldesc.txt)                           |                                                                                 Quest info                                                                                 |              |
| [lane\_connections](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/lane\_connections.txt)               |                                                                                      ?                                                                                     |              |
| [lane\_polygons](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/lane\_connections.txt)                  |                                                                                      ?                                                                                     |              |
| [lane\_spots](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/lane\_spots.txt)                           |                                                                                      ?                                                                                     |              |
| [lights](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/lights.txt)                                     |                                                                                      ?                                                                                     |              |
| [lipmap](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/lipmap.txt)                                     |                                                                                      ?                                                                                     |              |
| [location](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/location.txt)                                 |                                                                                      ?                                                                                     |              |
| [locopaths](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/locopaths.txt)                               |                                                                                      ?                                                                                     |              |
| [loot](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/loot.txt)                                         |                                                                                      ?                                                                                     |              |
| [mappins](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/mappins.txt)                                   |                                                                                 Pins on map                                                                                |              |
| [mesh](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/mesh.txt)                                         |                                Mesh/model, often containing physics settings (for inanimate objects) and some garment parameters (for NPCs)                                |              |
| [mi](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/mi.txt)                                             |                                                                    Instanced external shaders/materials                                                                    |              |
| [mlmask](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/mlmask.txt)                                     |                                                                      Masks for multilayer supershader                                                                      |              |
| [mlsetup](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/mlmask.txt)                                    |                                                                    Setup file for multilayer supershader                                                                   |              |
| [mltemplate](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/mltemplate.txt)                             |                                                                  Template file for multilayer supershader                                                                  |              |
| [morphtarget](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/morphtarget.txt)                           |                                                                           Blend shapes/shape keys                                                                          |              |
| [mt](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/mt.txt)                                             |                                                                                 Base shader                                                                                |              |
| navmesh                                                                                                                 |                                                                            AI navigation meshes                                                                            |              |
| [null\_areas](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/null\_areas.txt)                           |                                                                                      ?                                                                                     |              |
| [opusinfo](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/opusinfo.txt)                                 |                                                                                    Audio                                                                                   |              |
| [opuspak](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/opuspak.txt)                                   |                                                                                    Audio                                                                                   |              |
| [particle](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/particle.txt)                                 |                                          Parameters for particles and decals, can be configured in the second tab of .effect files                                         |              |
| [phys](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/phys.txt)                                         |                                                      Nvidia PhysX physics parameters, also present in many .mesh files                                                     |              |
| [physicalscene](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/physicalscene.txt)                       |                                                      Nvidia PhysX physics parameters, also present in many .mesh files                                                     |              |
| [physmatlib](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/physmatlib.txt)                             | Physics Material definitions. Governs bullet penetration, A.I. visibility through different materials, friction, etc., but tweaks to it are only partially applied in-game |              |
|                                                                                                                         |                                                                                                                                                                            |              |
|                                                                                                                         |                                                                                                                                                                            |              |
| [poimappins](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/poimappins.txt)                             |                                                                          Point of Interest Map pin                                                                         |              |
| [psrep](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/psrep.txt)                                       |                                                                                      ?                                                                                     |              |
| [quest](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/quest.txt)                                       |                                                                                    Quest                                                                                   |              |
| [questphase](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/questphase.txt)                             |                                                                              Quest progression                                                                             |              |
| regionset                                                                                                               |                                                                                      ?                                                                                     |              |
| [remt](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/remt.txt)                                         |                                                                  Similar to **mt**, difference is unclear                                                                  |              |
| [reslist](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/reslist.txt)                                   |                                                                                Resource list                                                                               |              |
| [rig](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/rig.txt)                                           |                                                  Rig/skeleton for animation, definition of bone groups and ragdoll physics                                                 |              |
| [scene](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/scene.txt)                                       |                                                                                  Cutscene                                                                                  |              |
| [scenesversions](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/scenesversions.txt)                     |                                                                             Cutscene versioning                                                                            |              |
| [smartobject](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/smartobject.txt)                           |                                                                                      ?                                                                                     |              |
| [smartobjects](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/smartobjects.txt)                         |                                                                                      ?                                                                                     |              |
| [sp](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/sp.txt)                                             |                                                                                Skin profile                                                                                |              |
| [spatial\_representation](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/spatial\_representation.txt)   |                                                                                      ?                                                                                     |              |
| [streamingquerydata](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/streamingquerydata.txt)             |                                                                                   Terrain                                                                                  |              |
| [streamingsector](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/streamingsector.txt)                   |                                                                       The world in manageable pieces                                                                       |              |
| [streamingsector\_inplace](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/streamingsector\_inplace.txt) |                                                                                   Terrain                                                                                  |              |
| [streamingworld](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/streamingworld.txt)                     |                                                                            Links all the sectors                                                                           |              |
| [terrainsetup](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/terrainsetup.txt)                         |                                                                                   Terrain                                                                                  |              |
| [texarray](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/texarray.txt)                                 |                                                                              Multiple textures                                                                             |              |
| [traffic\_collisions](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/traffic\_collisions.txt)           |                                                                                      ?                                                                                     |              |
| [traffic\_persistent](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/traffic\_persistent.txt)           |                                                                                      ?                                                                                     |              |
| [voicetags](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/voicetags.txt)                               |                                                                                      ?                                                                                     |              |
| [w2mesh](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/w2mesh.txt)                                     |                                                                 Leftover **mesh** file with RED3 extension                                                                 |              |
| [w2mi](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/w2mi.txt)                                         |                                                                  Leftover **mi** file with RED3 extension                                                                  |              |
| [workspot](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/workspot.txt)                                 |                                                                                      ?                                                                                     |              |
| [xbm](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/xbm.txt)                                           |                                                                                   Texture                                                                                  |              |
| [xcube](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/xcube.txt)                                       |                                                                                   Texture                                                                                  |              |

## Generic Format

\<explanation>

### Generic FIle Format Table

| Extension                                                                     | Description                                                                                                          |
| ----------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| [csv](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/csv.txt) | Standard CSV file, spreadsheets containing definitions for various parameters and enums that are used in other files |
| [wem](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/wem.txt) | Audio file                                                                                                           |



## Archive Format

#### File Structure

| Name        | Type/Size                                | Info                                                                                 |
| ----------- | ---------------------------------------- | ------------------------------------------------------------------------------------ |
| Header      | [Header](file-formats.md#undefined)      | See [specification of Header](file-formats.md#undefined) below.                      |
| Custom Data | [Custom Data](file-formats.md#undefined) | WolvenKit only. See [specification of custom data](file-formats.md#undefined) below. |
| Files       | data                                     | Raw file data                                                                        |
| File List   | [File List](file-formats.md#undefined)   | See [specification of file list](file-formats.md#undefined) below.                   |

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

| Name                    | Type/Size                                                    | Info                                                                   |
| ----------------------- | ------------------------------------------------------------ | ---------------------------------------------------------------------- |
| FileTableOffset         | uint32                                                       | Always 8                                                               |
| FileTableSize           | uint32                                                       |                                                                        |
| CRC                     | uint64                                                       | Checksum of ???                                                        |
| FileEntryCount          | uint32                                                       | Number of files                                                        |
| FileSegmentCount        | uint32                                                       | Number of file segments                                                |
| ResourceDependencyCount | uint32                                                       | Number of resource dependencies                                        |
| FileRecords             | [File Record](file-formats.md#file-record)\[FileEntryCount]  | See [specification of file record](file-formats.md#file-record) below. |
| FileSegments            | [File Segment](file-formats.md#undefined)\[FileSegmentCount] | See [specification of file segment](file-formats.md#undefined) below.  |
| ResourceDependencies    | uint64\[ResourceDependencyCount]                             |                                                                        |

#### File Record

| Name                      | Type/Size  | Info                                                         |
| ------------------------- | ---------- | ------------------------------------------------------------ |
| NameHash64                | uint64     | FNV1A64 hash of the filename                                 |
| Timestamp                 | int64      | Windows filetime of file creation                            |
| NumInlineBufferSegments   | uint32     | Number of inline buffers                                     |
| SegmentsStart             | uint32     | Index of the first [file segment](file-formats.md#undefined) |
| SegmentsEnd               | uint32     | Index of the last [file segment](file-formats.md#undefined)  |
| ResourceDependenciesStart | uint32     | Index of the first resource dependency                       |
| ResourceDependenciesEnd   | uint32     | Index of the last resource dependency                        |
| SHA1Hash                  | uint8\[20] | SHA1 hash of the file                                        |

#### File Segment

| Name   | Type/Size | Info                      |
| ------ | --------- | ------------------------- |
| Offset | uint64    | Offset of the data        |
| ZSize  | uint32    | Size of compressed data   |
| Size   | uint32    | Size of uncompressed data |

[^1]: 
