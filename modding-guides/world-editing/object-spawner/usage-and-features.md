---
description: >-
  Overview over what the current world editing mod is, how it operates and its
  biggest features
---

# Usage and Features

## What is World Builder

* World Builder is a tool that allows you to build new structures in the game world
* It is not restrained by pre-configured lists of things you can spawn, and gives you full access to all game resources, and most node types
* It is made for building, and tries to stay close to how other map editors might work (E.g. TW3 Redkit, RedEngine editor)

## How does it operate

* Building with World Builder is divided into two parts:
  * First, you build your creation using the tool, in-game and in real-time. This allows you to see what you are doing and how it looks in-engine, but some features will not be previewed (E.g. Device connections)
  * Then, you will convert your build into the final, **native world edit**, which then can take advantage of all the things that come with it being native (Better performance, easy usage, full features)

{% hint style="success" %}
World Builder tries to stay as close as possible to the way the game's world is built, since it's final step involves converting your build to a native world edit
{% endhint %}

* World Builder operates on a "Node" level, meaning everything you spawn is a type of node
  * This can range from entity nodes (Which are used to spawn simple entities, think AMM "props"), over a range of decorative node types like lights, decals, particles and sounds, to meta-nodes used for defining NPC spawns, performance optimization and area specific actions like safe zones.

{% hint style="info" %}
"Native World Edit" means the additions to the game world are present in the form of streamingsector files, which ArchiveXL then instructs the game to load
{% endhint %}

## Getting Started

{% hint style="info" %}
This is just an example of what you might want to do in order to get started, the most important thing is to just install the tool, experiment with it, try things out and have fun building
{% endhint %}

* Follow the [installation ](installation.md)guide
* Take a look at the [quick start](quick-start.md) example
* Learn how to [convert your build to the final native world edit](exporting-from-object-spawner.md)
* Familiarize yourself with the [recommended project structure](project-structure.md) and it's reasons
* Learn about the [3-D Editor mode](3-d-editor-mode.md), which can significantly speed up your workflow
* Take a look at the [list of supported nodes](supported-nodes.md) and get overwhelmed by the possibilities
* Read the [in-depth guides for the major parts of the tool](ui-tabs-explained/), and what features there are (And what to use them for)
* Take a look at any of the other, more specific guides found in the World Builder section and the general [World Editing](../) section

## Core Features

{% hint style="warning" %}
This is not an exhaustive list of all the features, but rather the biggest and most important ones
{% endhint %}

* Produces [native world edits](exporting-from-object-spawner.md)
* Access to [all game resources](ui-tabs-explained/tab-spawn-new.md), across [25 types of nodes](supported-nodes.md)
* [3-D Editor mode](3-d-editor-mode.md), similar to e.g. blender or redkit (Click to select, hotkeys, draggable arrows)
* [Asset preview](ui-tabs-explained/tab-spawn-new.md#asset-preview) for meshes, entities, decals, effects, particles, AISpots and sounds
* [Full undo and redo](ui-tabs-explained/tab-spawned.md#general-hotkeys)
* [Drag and drop](ui-tabs-explained/tab-spawn-new.md#spawn-position-options) of objects directly into the world
* [Scene view / hierarchy](ui-tabs-explained/tab-spawned.md#scene-view-controls) with loads of hotkeys, drag and drop and focus on organizing things
* [Favorites and prefabs](ui-tabs-explained/tab-favorites-and-prefabs.md) system with custom categories and tags
* [Randomized Nested Groups](features-and-guides/randomized-nested-groups.md)
* Modular UI
* [AMM decor preset import](ui-tabs-explained/tab-saved.md#amm-preset-import)
* [Drop to floor](ui-tabs-explained/tab-spawned.md#general-hotkeys) for groups and objects
* [RHT integration](ui-tabs-explained/tab-spawn-new.md#rht-integration) to send an existing world node directly to the WB search
* [Entity Instance Data](features-and-guides/entity-instance-data.md) support for entity type nodes
* [Sector variants support](features-and-guides/creating-sector-variants.md)
* [Devices with device connections](../devices/) (E.g. Elevators and custom FT points)
* [Collider shapes](supported-nodes.md#collision), scalable (With generation option for meshes)
* 5 types of area nodes, [easy creation of area outlines](features-and-guides/setting-area-outlines.md)
* [NPC Community support](../ai-and-npcs/) (Defining NPC placement, distribution and amount, per time of day)
