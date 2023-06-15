---
description: Documentation on .streamingsector files
---

# The whole world: .streamingsector

{% hint style="info" %}
If you want to know how to find a streaming sector, see [here](https://wiki.redmodding.org/wolvenkit/guides/modding-community/exporting-streaming-sectors-to-blender/finding-a-specific-sector).

For a list of interesting locations, see [here](http://localhost:5000/s/-MP\_ozZVx2gRZUPXkd4r/modding-community/world-editing/interesting-sectors).&#x20;

For a guide how to modify streaming sector files, see [here](../modding-guides/world-editing/).
{% endhint %}

StreamingSectors are the files that define the world in Cyberpunk, they tell the engine what goes where, and define everything from the meshes you see and how you can interact with them, to the locations of lights, sounds and fx. They call up the NPCs, they define the minimap.&#x20;

The fundamental bits of the structure are 2 main lists, the nodes, and the nodeData. The nodes define the assets that make up the sector, and the nodeData tells the engine where to put them.  Theres a nodeRef list as well, which seem to be the link that quests use to tie in to triggers etc via the .scene files. Theres also some bits that define variants, that seem to be how sectors change after missions, not worked those out yet.

## Theory

Streaming Sectors contain the world's data, holding a node tree that includes all its models and entities.&#x20;

{% hint style="info" %}
Other than the world environment, streaming sector files can also define

* navigation
* sound
* collision
* illumination

as there are several types.
{% endhint %}

### LOD data and grid sizes

The world is broken up into a grid, with several sizes of squares available (bit like graph paper with major and minor grid lines). The size of the grid in use is dependent on the Level of Detail (LOD) of the sector file your looking at, which is the last digit of the filename.&#x20;

Chunk sizes are as below.

| LOD | Interior | Exterior |
| --- | -------- | -------- |
| 0   | 32       | 64       |
| 1   | 64       | 128      |
| 2   | 128      | 256?     |

For every location, there can be multiple overlapping levels of LOD sectors with progressively more detail as you go down the levels.&#x20;

For instance, Lizzies bar is located at approximately -1200, 1562, 22:

<figure><img src="https://820263885-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-MP_ozZVx2gRZUPXkd4r%2Fuploads%2FZ097FOMFpAHkPdzsCNNF%2Fimage.png?alt=media&#x26;token=42873787-e4b7-4bea-8138-a24e3086b692" alt=""><figcaption><p>Via AMM: this targets the bouncer rather than the bar, but they're right next to each other, so it's fine.</p></figcaption></figure>

Filenames are structured as `sectortype_X_Y_Z.streamingsector` . If you preview a sector in wkit, the axes are shown as Z=-Y and Y=Z.

#### Calculating the files

I've left the detail of the process below for record, but if you just want a list of sectors I've created a python script to find the ones that a set of co-ordinates are in. You can find it [HERE](https://mybinder.org/v2/gh/Simarilius-uk/sectorStuff/5b8a8f5536002ec2d33c16103f79c53b6b93bd8e?urlpath=lab%2Ftree%2FAllBlocks.ipynb). Simply enter the co-ordinates in the player\_loc dict in block 3 then run all blocks. You'll be given 2 lists containing of all the interior and exterior sectors which contain the co-ords within their bounding boxes. The list also shows the distance from the centre of the sectors to the co-ords given.

From those co-ordinates we can calculate the sector files for interior/exterior sectors by dividing by the grid size for the LOD and rounding. (ie 1200/32=38 etc)

| LOD | Interior   | Exterior   |
| --- | ---------- | ---------- |
| 0   | -38\_49\_0 | -19\_24\_0 |
| 1   | -19\_24\_0 | -9\_12\_0  |
| 2   | -9\_12\_0  | -5\_6\_0   |

At the level 0 files the whole building isn't covered by 1 sector, so you end up needing 4, conversely the exterior level 2 is several city blocks.&#x20;

{% hint style="info" %}
For example, the **loft apartment** uses these files:&#x20;

`interior_-24_-16_1_1.streamingsector`: inner walls, floors, collision

`interior_-48_-31_2_0.streamingsector`: interior decoration, clutter

Note that the numbers are simply duplicated and rounded down. \
_No, I don't know how you round down 2\*16 to 31 either._
{% endhint %}

Some locations are partially defined in **quest sectors**, where parts of the location are locked away behind story triggers (for example half of V's apartment, as a lot of decoration will only be shown after completing quests). The exact process isn't fully understood as of May 2023.

## Node Types

List below is the node types I've found so far while building the blender sector import script.

<table><thead><tr><th width="427"></th><th></th></tr></thead><tbody><tr><td>MinimapDataNode </td><td></td></tr><tr><td>worldAISpotNode </td><td></td></tr><tr><td>worldAcousticSectorNode </td><td></td></tr><tr><td>worldAmbientAreaNode </td><td></td></tr><tr><td>worldBendedMeshNode </td><td></td></tr><tr><td>worldBuildingProxyMeshNode </td><td>Proxy mesh for building at further distance. Textures are normally embedded so cant export automatically currently.</td></tr><tr><td>worldCableMeshNode </td><td></td></tr><tr><td>worldCollisionNode </td><td>partial support, defines 3 types of collision, box, capsule and mesh. Can import the first 2.</td></tr><tr><td>worldCompiledCommunityAreaNode_Streamable </td><td></td></tr><tr><td>worldCompiledSmartObjectsNode   </td><td></td></tr><tr><td>worldDestructibleEntityProxyMeshNode</td><td></td></tr><tr><td>worldDeviceNode </td><td></td></tr><tr><td>worldEffectNode</td><td></td></tr><tr><td>worldEntityNode </td><td>Defines an object defined by an ent file (door, vending machine, fan etc)</td></tr><tr><td>worldEntityProxyMeshNode  </td><td></td></tr><tr><td>worldFoliageNode </td><td></td></tr><tr><td>worldGINode   </td><td></td></tr><tr><td>worldGIShapeNode </td><td></td></tr><tr><td>worldGISpaceNode </td><td></td></tr><tr><td>worldGenericProxyMeshNode </td><td>Proxy mesh for objects at distance. </td></tr><tr><td>worldGuardAreaNode </td><td></td></tr><tr><td>worldInstancedDestructibleMeshNode</td><td>as worldInstancedMeshNode but breakable</td></tr><tr><td>worldInstancedMeshNode </td><td>Instanced copies of a static mesh uses a worldTransformBuffer in the nodeData to define the number of copies and positions of all the copies</td></tr><tr><td>worldInstancedOccluderNode </td><td></td></tr><tr><td>worldInterestingConversationsAreaNode </td><td></td></tr><tr><td>worldInteriorAreaNode </td><td></td></tr><tr><td>worldLightChannelShapeNode</td><td></td></tr><tr><td>worldLightChannelVolumeNode </td><td></td></tr><tr><td>worldPerformanceAreaNode </td><td></td></tr><tr><td>worldPhysicalDestructionNode </td><td></td></tr><tr><td>worldPopulationSpawnerNode</td><td></td></tr><tr><td>worldReflectionProbeNode </td><td></td></tr><tr><td>worldRoadProxyMeshNode </td><td>Road Mesh. </td></tr><tr><td>worldRotatingMeshNode </td><td></td></tr><tr><td>worldStaticDecalNode </td><td>Static Decal, nodeData has x,y,z not sure how engine decides what to project to</td></tr><tr><td>worldStaticFogVolumeNode </td><td></td></tr><tr><td>worldStaticMeshNode </td><td>Static mesh, nodeData has position data</td></tr><tr><td>worldStaticOccluderMeshNode </td><td></td></tr><tr><td>worldStaticParticleNode </td><td></td></tr><tr><td>worldStaticSoundEmitterNode </td><td></td></tr><tr><td>worldTerrainCollisionNode </td><td></td></tr><tr><td>worldTerrainMeshNode </td><td>The ground, textures are embedded so cant export automatically currently.</td></tr><tr><td>worldTrafficCompiledNode </td><td></td></tr><tr><td>worldTriggerAreaNode</td><td></td></tr><tr><td>worldSmartObjectNode</td><td></td></tr><tr><td>worldStaticLightNode</td><td></td></tr><tr><td>worldInteriorMapNode</td><td></td></tr><tr><td>worldAdvertisementNode</td><td></td></tr><tr><td>worldMeshNode</td><td></td></tr></tbody></table>

