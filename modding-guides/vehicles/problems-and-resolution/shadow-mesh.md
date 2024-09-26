---
description: Shadow Mesh for Non-RT Environment
layout:
  title:
    visible: true
  description:
    visible: true
  tableOfContents:
    visible: true
  outline:
    visible: true
  pagination:
    visible: true
---

# Shadow mesh

The shadow mesh is This is the mesh required for the vehicle to create shadows in an environment where ray tracing shadows are not used



1. Shadow mesh doesn't need a lot of polygons. It only needs to have a minimal shape to create a shadow



2. You don't need stickers, decals, and glass when you make a shadow mesh



3. The shadow mesh must have the same position value as the original mesh



_**Shadow mesh**_

<figure><img src="../../../.gitbook/assets/image (249).png" alt=""><figcaption></figcaption></figure>

_**Original mesh**_

<figure><img src="../../../.gitbook/assets/image (250).png" alt=""><figcaption></figcaption></figure>



_**If the following problems occur**_

<figure><img src="../../../.gitbook/assets/image (251).png" alt=""><figcaption></figcaption></figure>

If you made a shadow mesh and put it in

and

If it looks like the picture above

In the "\~shadow.mesh" file

renderResourceBlob -> header -> renderChunkInfos -> rendChunk -> render Mask

<figure><img src="../../../.gitbook/assets/image (252).png" alt=""><figcaption></figcaption></figure>

Turn off options except "MCF\_RenderInShadows"
