---
description: This guide explains how to add variants to your sectors, using World Builder
---

# Creating Sector Variants

{% hint style="success" %}
Further information on how sector variants work under the hood, and how to manually work with them can be found on the [Switching between sector states](../../archived-guides/switching-between-sector-states.md) page
{% endhint %}

## Usage

* Sector variants allow you to assign different parts of a sector to a variant
* You can then toggle those variants on / off, while the game is running
* This can be used to e.g. offer different variations of a build, within a single mod download, and allow the user to toggle different parts / layers at will
* Unlike the name "Variants" may suggest, you can have multiple ones active at the same time, allowing you to mix and match

## Requirements

### Tools

* [World Builder](https://github.com/justarandomguyintheinternet/CP77_entSpawner/releases)
* [ArchiveXL](https://github.com/psiberx/cp2077-archive-xl)
* [Codeware ](https://github.com/psiberx/cp2077-codeware/releases)(1.15.0 or newer)
* [WolvenKit](https://github.com/WolvenKit/WolvenKit) (With latest version of World Builder import script)

### Knowledge

* You need to have a basic understanding of:
  * Working with WolvenKit
  * Using World Builder (Spawning things and [importing](../exporting-from-object-spawner.md) into WolvenKit)

## General Setup

* Variants are something you should keep in mind during the building process, if you want to use them
* You will be able to assign each group, which sits directly within in main group, to a variant

<figure><img src="../../../../.gitbook/assets/sectorVariantValidGroupsExample" alt="" width="248"><figcaption><p>Example of what groups will be assignable</p></figcaption></figure>

* In the above example, you will be able to assign each of the three groups to a variant
  * All objects placed directly within the root group (The group that you saved and export), will be part of the **default** variant

## Assigning variants

* Once you have added your group(s) to the export, you can start assigning variants
* Variant settings can be found under the same named header (One per group)
* By default, each group will be assigned to the `default` variant, meaning they will be always active

<figure><img src="../../../../.gitbook/assets/sectorVariantExample" alt=""><figcaption><p>Example of a variants setup for a group, in the export tab</p></figcaption></figure>

* Variant Node Ref:
  * This **MUST** be set to some unique NodeRef, in order for the variants to be controllable
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

* In order for mod users to quickly and conveniently toggle variants, one could e.g. hook up the [above](creating-sector-variants.md#testing-variants) code to some UI
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
    * `defaultState`: The default state of the variant (Overrides what is set during export)&#x20;

{% file src="../../../../.gitbook/assets/variantSwitcher.zip" %}
