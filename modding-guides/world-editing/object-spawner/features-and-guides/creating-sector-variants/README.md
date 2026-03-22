---
description: This guide explains how to add variants to your sectors, using World Builder
---

# Creating Sector Variants



## Summary

Published: Mar 18 2025 by [keanuWheeze](https://app.gitbook.com/u/WBUIHettvKP7ke8K6KFd7L9ZTtG2 "mention")\
Last documented edit: Mar 22 2026 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page walks you through creating sector variants with WorldBuilder

### Wait, that's not what I want!

* For an example, check [sector-variants-practical-example-and-project.md](sector-variants-practical-example-and-project.md "mention")
* For how to manually create sector variants, check [Switching between sector states](../../../archived-guides/switching-between-sector-states.md) (archived)

## Why do I need sector variants?

This feature allows **switching** between multiple versions of the same build **while the game is running**, for example

* turning Johnny or Nibbles on and off
* "Moving" smartframes around&#x20;
* Having multiple presets, for example light colours and -brightness
* turning an entire build on and off (great for non-immersive mods and shenanigans)

Variants allows you to make all sorts of World Edits - imagination is your sole limit.

{% hint style="info" %}
Despite the name, you can have as many variants in a single .archive as you want.
{% endhint %}

## Requirements

### Tools

* WorldBuilder ([github](https://github.com/justarandomguyintheinternet/CP77_entSpawner/releases) | [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/20660))
* [ArchiveXL](https://github.com/psiberx/cp2077-archive-xl)
* [Codeware ](https://github.com/psiberx/cp2077-codeware/releases)(1.15.0 or newer)
* [WolvenKit](https://github.com/WolvenKit/WolvenKit) ([Stable](https://github.com/WolvenKit/WolvenKit/releases) | [Nightly](https://github.com/WolvenKit/WolvenKit-nightly-releases/releases))
* The latest version of World Builder import script (Wolvenkit will update scripts during start)

### Knowledge

* You need to have a basic understanding of:
  * Working with WolvenKit
  * Using World Builder (Spawning things and [importing](../../exporting-from-object-spawner.md) into WolvenKit)

## General Setup

If you want to use variants, keep them in mind during the building process — group things that belong together.

* You will be able to assign each group, which sits directly within the main group, to a variant

<figure><img src="../../../../../.gitbook/assets/sectorVariantValidGroupsExample" alt="" width="248"><figcaption><p>Example of what groups will be assignable</p></figcaption></figure>

* In the above example, you will be able to assign each of the three groups to a variant
  * All objects placed directly within the root group (The group that you saved and export), will be part of the **default** variant

## Assigning variants

* Once you have added your group(s) to the export, you can start assigning variants
* Variant settings can be found under the equally named header (One per group)
* By default, each group will be assigned to the `default` variant, meaning they will be always active

<figure><img src="../../../../../.gitbook/assets/sectorVariantExample" alt=""><figcaption><p>Example of a variants setup for a group, in the export tab</p></figcaption></figure>

* Variant Node Ref:
  * This **MUST** be set to an unique NodeRef in order for the variants to be controllable
* Below you can assign a variant to each group
  * You can assign multiple groups to the same variant
  * Optionally change whether the variant should be active by default

## Testing variants

* In order to quickly toggle variants on and off, during development and testing, you can use the following commands in the CET-Console:

```lua
Game.GetWorldStateSystem():TogglePrefabVariant(CreateNodeRef("$/yourRefName"), "variantName", true) -- Toggle variant on
Game.GetWorldStateSystem():TogglePrefabVariant(CreateNodeRef("$/yourRefName"), "variantName", false) -- Toggle Variant off
```

## User Configurable Variants

* In order for mod users to quickly and conveniently toggle variants, one could e.g. hook up the [above](./#testing-variants) code to some UI
* To make it easier, below there will be a ready to use Native Settings UI based menu, that allows toggling variants
* In order to configure it, simply change the values at the top of the `init.lua` file:
  * `settingsMainName/settingsSubName` : Controls the names displayed for the category, in Native Settings UI
  * `defaultMutuallyExclusiveVariants`: Here you define string selectors for variants which should be mutually exclusive (Only one active at a time)
    * `ref`: This is the variant node ref
    * `displayName`: This is a more human-readable string, gets actually shown in the UI
    * `currentIndex`: This is the default state (Will override what is defined during export)
    * `variants`: This array contains the variants which should be mutually exclusive, with a display name
  * `defaultAdditiveVariants`: Here you define simple switches for variants which can be mixed and matched
    * `ref`: This is the variant node ref
    * `variant`: The name of the variant, as defined during export
    * `displayName`: This is a more human-readable string, gets actually shown in the UI
    * `defaultState`: The default state of the variant (Overrides what is set during export)

{% file src="../../../../../.gitbook/assets/VariantSwitcherUpdated.rar" %}

## Practical example and project template

You can find more documentation and a project template with WB saves/export template/export files included in it to visualize how it all works in game and on wolvenkit at the following page : \
[sector-variants-practical-example-and-project.md](sector-variants-practical-example-and-project.md "mention")
