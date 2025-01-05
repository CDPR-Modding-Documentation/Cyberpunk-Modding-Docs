---
description: How animations work in Cyberpunk
---

# Animations: .anims

## Summary

**Published**: Jun 28 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update**: Jun 28 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page explains how animations in Cyberpunk work.

### Wait, this is not what I want!

* For practical guides, check [animation-modding.md](../../modding-tools/redmod/animation-modding.md "mention") in the Modding Guides section.

{% hint style="info" %}
Animations are **extremely complex** and as of today, poorly-documented. You can find a lot of interesting discussions in the [animations channel](https://discord.com/channels/717692382849663036/813768799358156880) on our [discord](https://discord.gg/redmodding).

If you want to [join up](https://app.gitbook.com/invite/-MP5ijqI11FeeX7c8-N8/H70HZBOeUulIpkQnBLK7) and move that knowledge here, you are **more than welcome**! ([How and why to edit this wiki](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators/modding-tools/the-wiki))
{% endhint %}

## What is an animation?&#x20;

The process of binding [meshes](../3d-objects-.mesh-files/) (weapons, clothes, body parts) to an **armature** is called [rigging](../../3d-modelling/meshes-and-armatures-rigging/).&#x20;

The armature (also `rig` - think "skeleton") is made of **pose bones**. \
For every **frame**, these pose bones will be in a certain position (`keyframe`). Here lies the only difference between **static photo mode poses** and **animations**:&#x20;

* A static pose (photo mode) has a [fallback keyframe](./#fallback-frames) and a pose keyframe. Some custom poses have more, but these are not necessary.
* An animation has up to two [#fallback-frames](./#fallback-frames "mention"). All of its keyframes will be played in sequence.&#x20;

### Fallback frames

The keyframe at index 0 will be used while the animation resets, and acts whenever something in the pose can't be loaded, for example when the .anim file defines more frames than the pose in Blender.&#x20;

This may lead to **twitching** and will hopefully be resolved in a future Wolvenkit version.

