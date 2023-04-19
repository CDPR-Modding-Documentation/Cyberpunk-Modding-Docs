---
description: Some detail on the Streaming Sector files
---

# Streaming Sectors

StreamingSectors are the files that define the world in Cyberpunk, they tell the engine what goes where, and define everything from the meshes you see and how you can interact with them, to the locations of lights, sounds and fx. They call up the NPCs, they define the minimap.&#x20;

The fundamental bits of the structure are 2 main lists, the nodes, and the nodeData. The nodes define the assets that make up the sector, and the nodeData tells the engine where to put them.  Theres a nodeRef list as well, but I've been unable to work out what exactly it is yet. Theres also some bits that define variants, that seem to be how sectors change after missions, again, not worked those out yet.

List below is the node types I've found so far while building the blender sector import script.

|                                             |                                                                                                                                              |
| ------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| MinimapDataNode                             |                                                                                                                                              |
| worldAISpotNode                             |                                                                                                                                              |
| worldAcousticSectorNode                     |                                                                                                                                              |
| worldAmbientAreaNode                        |                                                                                                                                              |
| worldBendedMeshNode                         |                                                                                                                                              |
| worldBuildingProxyMeshNode                  | Proxy mesh for building at further distance\*\*                                                                                              |
| worldCableMeshNode                          |                                                                                                                                              |
| worldCollisionNode                          |                                                                                                                                              |
| worldCompiledCommunityAreaNode\_Streamable  |                                                                                                                                              |
| worldCompiledSmartObjectsNode               |                                                                                                                                              |
| worldDestructibleEntityProxyMeshNode        |                                                                                                                                              |
| worldDeviceNode                             |                                                                                                                                              |
| worldEffectNode                             |                                                                                                                                              |
| worldEntityNode                             | Defines an object defined by an ent file (door, vending machine, fan etc)                                                                    |
| worldEntityProxyMeshNode                    |                                                                                                                                              |
| worldFoliageNode                            |                                                                                                                                              |
| worldGINode                                 |                                                                                                                                              |
| worldGIShapeNode                            |                                                                                                                                              |
| worldGISpaceNode                            |                                                                                                                                              |
| worldGenericProxyMeshNode                   | Proxy mesh for objects at distance\*\*                                                                                                       |
| worldGuardAreaNode                          |                                                                                                                                              |
| worldInstancedDestructibleMeshNode          | as worldInstancedMeshNode but breakable                                                                                                      |
| worldInstancedMeshNode                      | Instanced copies of a static mesh uses a worldTransformBuffer in the nodeData to define the number of copies and positions of all the copies |
| worldInstancedOccluderNode                  |                                                                                                                                              |
| worldInterestingConversationsAreaNode       |                                                                                                                                              |
| worldInteriorAreaNode                       |                                                                                                                                              |
| worldLightChannelShapeNode                  |                                                                                                                                              |
| worldLightChannelVolumeNode                 |                                                                                                                                              |
| worldPerformanceAreaNode                    |                                                                                                                                              |
| worldPhysicalDestructionNode                |                                                                                                                                              |
| worldPopulationSpawnerNode                  |                                                                                                                                              |
| worldReflectionProbeNode                    |                                                                                                                                              |
| worldRoadProxyMeshNode                      | Road Mesh\*\*                                                                                                                                |
| worldRotatingMeshNode                       |                                                                                                                                              |
| worldStaticDecalNode                        | Static Decal, nodeData has x,y,z not sure how engine decides what to project to                                                              |
| worldStaticFogVolumeNode                    |                                                                                                                                              |
| worldStaticMeshNode                         | Static mesh, nodeData has position data                                                                                                      |
| worldStaticOccluderMeshNode                 |                                                                                                                                              |
| worldStaticParticleNode                     |                                                                                                                                              |
| worldStaticSoundEmitterNode                 |                                                                                                                                              |
| worldTerrainCollisionNode                   |                                                                                                                                              |
| worldTerrainMeshNode                        | The ground\*\*                                                                                                                               |
| worldTrafficCompiledNode                    |                                                                                                                                              |
| worldTriggerAreaNode                        |                                                                                                                                              |

\*\* Not handled by the script yet.
