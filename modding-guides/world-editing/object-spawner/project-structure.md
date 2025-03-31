---
description: This page explains how to organize and group big builds
---

# Project Structure

## Purpose

* Especially for larger builds, it is important to keep in mind how the game actually deals with loading the world
* Since the build is to be converted into a native world edit, meaning all the loading etc. is handled by the game engine itself, it is important to structure it similarly to the vanilla world

{% hint style="warning" %}
Not adhering to a similar structure as the game-world can lead to performance issues and bugs
{% endhint %}

## Structure

### About Sectors

* The vanilla game world is made up of streamingsector's (`.streamingsector`files), each containing a cluster of nodes in a general area
* Which nodes are part of which sector is determined automatically during the build process of the game
* Sectors have so-called [extents](exporting-from-object-spawner.md#streaming-ranges), a volume around the contained nodes, in which the player needs to be in order for the sector to be streamed in
* Only once the sector is streamed in, **can** the nodes which it contains be streamed in, and be visible
  * Each node additionally has its [own streaming-distance](exporting-from-object-spawner.md#streaming-ranges), defining at what distance it shows

{% hint style="info" %}
Sector extents can be configured during the [export](exporting-from-object-spawner.md) process from WB

Each node's own streaming-distance can be controlled under it's "World Node" header
{% endhint %}

## Applying structure to WB

{% hint style="success" %}
A _root group_ in WB is a group which is not part of another group, meaning it can be saved.

Each root group will become it's own streaming sector during export.
{% endhint %}

* To avoid unnecessary streaming in of parts of a build, you should separate parts of the build which are relatively far away into separate root groups
* That way, during export, each part of your build will become its own streaming sector, allowing the game to only load the part of your build which is relevant
*   E.g. Imagine you have an apartment build, with a lobby part at ground level, and the actual apartment at the 23rd floor.

    * If you put both parts into the same root group, thus the same sector, the game would always load lobby + apartment
    * Putting each part into its own root group, thus sector, means the game can load the lobby while you're at ground level, with the other part only being loaded once the player is close

    <figure><img src="../../../.gitbook/assets/image.png" alt=""><figcaption><p>Two root groups will turn into two saved groups, will turn into two sectors each with their own streaming box extents</p></figcaption></figure>
