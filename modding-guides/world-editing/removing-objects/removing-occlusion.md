---
description: Guide on how to remove occlusion nodes, on a sector basis
---

# Removing Occlusion Nodes

## Finding and Removing Occlusion

Author: spirit

Last update: September 24th 2024

***

### Introduction

If you ever tried to build a structure outside of the usual game bounds and encountered textures popping in and out seemingly at random you have encountered occlusion mesh nodes. This article will explain how to find and remove them, touch on their purpose and provide starting points for optimization.

Occlusion Mesh Example:

![OcclusionMesh](https://github.com/user-attachments/assets/bc9ab7c5-123c-4d66-b555-3e8a9fc2b7ff)

### Required Tools

* [**Wolvenkit 8.14.0+**](https://github.com/WolvenKit/WolvenKit)
* [**HotRedTools 1.1.4+**](https://github.com/psiberx/cp2077-red-hot-tools/releases)
* [**ArchiveXL 1.16.9+**](https://www.nexusmods.com/cyberpunk2077/mods/4198)

***

## Instructions

#### In the Game

1. Navigate to the location where you want to remove the occlusion mesh nodes
2. Open the CET Menu and find World Inspector
   1. Switch to the Scan Tab
   2. Click on Scan world nodes
   3. Make sure the Group is set to All, Distance to 50m or more depending on your area, and Filter to "Occl"
3. Expand each item in the list to reveal the detailed information

> \[!NOTE] World Inspector cannot find all occlusion mesh nodes, so trying to remove them using Removal Editor will not remove all actual occlusion mesh nodes from the area.

![WorldInspector Steps](https://github.com/user-attachments/assets/cbf42569-4f80-4b52-9e10-f4bc6bbfd8ae)

#### In Wolvenkit

1. Create and open a new project in Wolvenkit
   1. Search and `Right Click > Add selected items to project` for each world sector you found in the World Inspector to your project in Wolvenkit
   2. Click on `Tools > Script Manager` at the top
      1. Find the "RemoveOcclusionFromSectors" script and run it
   3. An .xl file that removes the occlusion mesh nodes has now been created in your "resources" folder in Wolvenkit
   4. Open the resources directory in file explorer
   5. Move the file to `{GameDirectory}\archive\pc\mod`

![wkit\_step1(1)](https://github.com/user-attachments/assets/16618eb2-bf8f-4939-a9a7-c8b768d5a29f) ![wkit\_scriptman1](https://github.com/user-attachments/assets/c92da98c-778e-4a20-bc5f-d0b7936d9b60) ![wkit\_scriptman2](https://github.com/user-attachments/assets/ecd005c1-fc6d-4c85-8e4e-2cdd856849a7) ![open\_in\_explorer](https://github.com/user-attachments/assets/3d48519c-4a94-491f-a153-e97b31e8996f)

#### Back in the Game

1. In the "Hot Reload" tool go to the Archives tab and click on reload extensions, now you need load a game save and the occlusion mesh nodes should be removed.

![hotreload](https://github.com/user-attachments/assets/18509c63-bd2b-4ae1-a36a-bec41701b54c)

### Troubleshooting

If you followed the steps but not all of the occlusion has been removed you can try:

* restarting your game fully
* increasing the "Distance" in "World Inspector" and redo the steps from that point on
* adding world sectors that World Inspector doesn't find occlusion mesh nodes in

Lastly, if none of these worked you can join the [Discord](https://discord.gg/Epkq79kd96) where we can troubleshoot the issue together.

## The Purpose of Occlusion Mesh Nodes

> \[!NOTE] This section, but especially the optimization part needs further testing and documentation.

They are a performance optimization method that selectively blocks geometry that is behind it from being rendered, therefore improving fps. But since most other objects also do that the performance loss from removing them in a select few world sectors is almost negligible (assuming there are no holes in the world or they are filled with other props).

### Optimization

The simple approach to optimize performance is to add each world sector separately and test which ones remove only the occlusion that is in your way. Another more advanced option is to add new occlusion mesh nodes that consider your structure.
