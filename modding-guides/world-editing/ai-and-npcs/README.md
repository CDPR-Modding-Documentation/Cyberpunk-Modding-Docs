---
description: >-
  This section contains all things related to NPCs and how to place them in the
  world using World Builder
icon: users
---

# AI and NPCs

## Theory

* NPCs in the game world are spawned via two different ways:
  * Crowd NPCs
  * Community NPCs

### Crowd NPCs

* Crowd NPCs are as the name suggests spawned as part of the regular crowd that walks the street, they are not fully understood yet

## Community NPCs

* Community NPCs are all the other NPCs, that includes everyone from the shopkeepers, quest NPCs, enemy NPCs to NPCs hanging out in specific spots
* Communities allow to define a wide combination of things, allowing for very dynamic setups (E.g. NPC type, amount and spot depending on the time of day):
  * What NPCs
  * When should they spawn
  * How many
  * Where should they spawn
  * Setups such as making them patrol along a spline

{% hint style="success" %}
Communities can not only be used for spawning an placing NPCs, but anything that has a TweakDB record, e.g. Vehicles
{% endhint %}

## Guides

* [Placing AISpot nodes](placing-aispot-nodes.md): These serve as markers for NPCs, defining a workspot to be used
* [Creating Communities](creating-communities.md): Explains how to create a community, and make it's NPCs use AISpot's
