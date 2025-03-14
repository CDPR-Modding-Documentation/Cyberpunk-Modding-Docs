---
description: >-
  This page briefly explains how to place and preview AISpot Nodes, using Object
  Spawner
---

# Placing AISpot Nodes

{% hint style="warning" %}
This guide only explains how to place AISpot Nodes, for them to be actually be used by NPCs, you will need to [setup a community](creating-communities.md)
{% endhint %}

## Usage

* AISpot Nodes define workspots that NPCs created via communities can use
* A workspot is simply a location at which a NPC will play a set of animations

## Requirements

### Tools

* [Object Spawner](https://github.com/justarandomguyintheinternet/CP77_entSpawner/releases) (v.0.91 or newer)
* [ArchiveXL](https://github.com/psiberx/cp2077-archive-xl)
* [Codeware ](https://github.com/psiberx/cp2077-codeware/releases)(1.15.0 or newer)
* [WolvenKit](https://github.com/WolvenKit/WolvenKit) (With latest version of Object Spawner import script)

### Knowledge

* You need to have a basic understanding of:
  * Working with WolvenKit
  * Using Object Spawner (Spawning things and [importing](../exporting-from-object-spawner.md) into WolvenKit)

## Spawning AISpots

{% hint style="warning" %}
You **must** assign a unique NodeRef to each AISpot, in order for it to be usable
{% endhint %}

* In order to spawn a new AISpot, select the corresponding spawn category in Object Spawner:
  * `AI -> AI Spot`
* When you spawn an AISpot, it will by default use Judy to preview the animation
  * This may not always work (Judy will just stand there), since not all workspots support all body rigs
  * For more information on this, see below

### Previewing Options

* To know what rigs a workspot supports, take a look at the `AI Spot -> Previewing Options -> Supported Rigs` header

<figure><img src="../../../.gitbook/assets/aiSpotSupportedRigs" alt="" width="301"><figcaption><p>Example AI Spot, and its workspot's supported rigs</p></figcaption></figure>

* Here you can also change whether you want a NPC to preview the spot, and also which NPC should do so
  * A list of all NPC records can be found in Object Spawner `Entity -> Record` (Search for `Character.`)
* Additionally, you can change the speed of the animation during the preview
  * This is helpful since each time you move the spot, the animation will restart

### Spot Options

* `Is Infinite`: If set to false, the NPC will try and go to the next AISpot defined in its community entry, once it is done with the current one
* Markings: For information on markings, check the [community](creating-communities.md#markings) guide
* As mentioned above, you **must** assign a unique NodeRef to your AISpot, in order for it to be useable
