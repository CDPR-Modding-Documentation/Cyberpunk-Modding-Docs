---
description: Move and deform meshes with .rigs
---

# Armatures: .rig files

## Summary

Published: Oct 12 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
Last documented edit: Oct 12 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page contains **theory** about Cyberpunk's armature files.

### Wait, this is not what I want!

* To find out how armatures and meshes are connected, check [meshes-and-armatures-rigging.md](../3d-modelling/meshes-and-armatures-rigging.md "mention")
* To edit an armature, check TODO: insert link
* For a hands-on guide, check [poses-animations-make-your-own](../../modding-guides/animations/animations/poses-animations-make-your-own/ "mention")

## What's a rig?

A `rig` (also `armature`, the terms will be used interchangeable) is the **skeleton structure** used to control and animate [`meshes`](3d-objects-.mesh-files/).

Each armature is a hierarchical connection of bones (similar to a meatspace skeleton — the foot bone's connected to the leg bone).&#x20;

### Control

The armature controls the **pose** of the connected mesh. You can read more about this on the  [meshes-and-armatures-rigging.md](../3d-modelling/meshes-and-armatures-rigging.md "mention") page.

### Deform

Via **bone scaling**, the armature **deforms** the connected mesh. This is how custom rigs are used to change V's body shape.

To learn more about this, check TODO: insert link

