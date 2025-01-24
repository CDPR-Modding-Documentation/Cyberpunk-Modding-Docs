---
description: >-
  This page describes how to use worldCompiledCommunityAreaNode and
  worldCommunityRegistryNode
---

# How to use worldCommunityRegistry and worldCompiledCommunity

{% hint style="warning" %}
This guide explains the theory on how to setup communties, and how they tie into quests

For actually creating communities, it is recommended to instead follow the [communities with Object Spawner guide](../world-editing/creating-communities.md)
{% endhint %}

## Summary

**Published:** Nov 10 by [Sergey](https://app.gitbook.com/u/N691cVEMA0Nmecc6QHIAM73aI0z1 "mention")\
Last documented update: Dec 4 by [Sergey](https://app.gitbook.com/u/N691cVEMA0Nmecc6QHIAM73aI0z1 "mention")

### Wait, this is not what I want!

* If you want to learn about [.](./ "mention"), please check the corresponding section.
* If you want to learn about [world-editing](../world-editing/ "mention"), please check the corresponding section.
* [NodeRefs](../../for-mod-creators-theory/files-and-what-they-do/the-whole-world-.streamingsector/noderefs.md) explained.
* [Broken link](broken-reference "mention")

## Requirements

* [ArchiveXL](../../for-mod-creators-theory/core-mods-explained/archivexl/) 1.17.0+

## Basics

There are two types `worldCompiledCommunityAreaNode`  and `worldCompiledCommunityAreaNode_Streamable`

The difference between them is only that `worldCompiledCommunityAreaNode` must be registered in `AlwaysLoaded` type of `.streamingsector`

`worldCompiledCommunityAreaNode_Streamable` can be registered in other types of `.streamingsector` (exterior/quest/etc)

## Theory

Working with `worldCompiledCommunityAreaNode` and `worldCommunityRegistryNode`

In general, we are specifying in `worldCompiledCommunityAreaNode` all our spots where we want to spawn NPCs/etc by its `entryName`/`phase`.

For example in the quest **Riders on the Storm** CDPR reactivates all needed NPCs by their reference, entry name, and phase name.

<figure><img src="../../.gitbook/assets/image (7) (1).png" alt=""><figcaption></figcaption></figure>

Setup your Wkit project.

Create `.questphase` `.streamingblock` and `.streamingsector` files&#x20;

<figure><img src="../../.gitbook/assets/image (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

1.  Create `archiveXL` file and specify your `.streamingblock` and `.questphase` files&#x20;

    <figure><img src="../../.gitbook/assets/image (4) (1).png" alt=""><figcaption></figcaption></figure>

    <figure><img src="../../.gitbook/assets/image (6) (1).png" alt=""><figcaption><p>we will use .questphase file later</p></figcaption></figure>


2.  Create NodeRefs for `worldAiSpotNode` and `worldCompiledCommunityAreaNode`&#x20;

    <figure><img src="../../.gitbook/assets/image (8) (1).png" alt=""><figcaption></figcaption></figure>


3.  Create `worldAiSpotNode` and its `worldNodeData` and assign created `NodeRef`before

    <figure><img src="../../.gitbook/assets/image (10) (1).png" alt=""><figcaption><p>In the spot property u need to specify workspot that you want to use</p></figcaption></figure>


4.  Create `worldCompiledCommunityAreaNode` and its `worldNodeData`&#x20;

    <figure><img src="../../.gitbook/assets/image (12) (1).png" alt=""><figcaption></figcaption></figure>

    **Important**:\
    \- In the `Node/area/entriesData` we specify an `entryName/phaseName/spotId(AiSpoNodeHash)` so in the future, we can `Activate/Reactivate/Deactivate` its entities by these params\
    \- `sourceObjectId` - it should match `id`of registry item
5.  Create `worldCommunityRegistryNode` and its `worldNodeData`&#x20;

    <figure><img src="../../.gitbook/assets/image (13) (1).png" alt=""><figcaption></figcaption></figure>



Details about the registry:

**Important:**

`communitiesData` - there are we specifying the type of NPC its template, entryName, and all possible phases&#x20;

<figure><img src="../../.gitbook/assets/image (14).png" alt=""><figcaption><p>In this example, i set Panam with entryName panam and phase A to be able to activate on the spot we created earlier</p></figcaption></figure>

`workspotsPersistentData` - there we are adding a new spot into the engine's global registry by the hash of our `AiSpotNode`

<figure><img src="../../.gitbook/assets/image (16).png" alt=""><figcaption></figcaption></figure>

Trying to spawn:

I set the point in front of H10 V's apartment so we should see Panam spawning once we send a command. To do so we need to create a few nodes in our `.questphase`

In our .xl file, we set that`.questphase` will trigger whenever we enter the apartment.

<figure><img src="../../.gitbook/assets/image (17).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (18).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (19).png" alt=""><figcaption></figcaption></figure>

Then you can deactivate/reactive with SpawnManager
