---
description: >-
  This page explains how to spawn and use custom resources, and how to best
  share them with other modders
---

# Adding custom resources / props

## Summary

**Created:** Mar 18 2025 by [keanuWheeze](https://app.gitbook.com/u/WBUIHettvKP7ke8K6KFd7L9ZTtG2 "mention")\
**Last documented edit**: Oct 20 2025 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page will show you how to register existing props with WorldBuilder.

## Custom resource list

To permanently add any custom resource (E.g. `.ent`, `.mesh`, `.mi` etc.) to the list of things you can spawn via the "Spawn New" tab, you can do the following:

### With Wolvenkit (recommended)

From the File menu, select Add New... and then&#x20;

{% hint style="success" %}
You can spawn things from their resource path without registering them with WorldBuilder. On the "Spawn New" tab, paste it into the search bar, and when you are told that it was not found, select "Spawn anyway".
{% endhint %}

*

    * Locate the data folder, found in `Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks\mods\entSpawner\data\spawnables\...`
    * Find the specific sub folder for the type of resource you wish to spawn
      * E.g. For entity templates `.ent`, this would be `...\spawnables\entity\templates`
    * Create a new `.txt` file in the sub-folder
    * Add all the resource paths you want to the file, each path being on a new line

    <figure><img src="../../../../.gitbook/assets/OSCustomResourcesFolderStructure" alt="" width="563"><figcaption><p>Example of how it looks like when you have added your text file containing the cutom paths, in this case containing <code>.ent</code> paths</p></figcaption></figure>

## Importing AMM props

* AMM props are just entity files `.ent`
* To add existing AMM props (Including such from other prop packs) to the "Spawn New" list, do:
  * Select the `Entity -> Template (AMM)` category
  * Click the "Generate AMM props" button

{% hint style="success" %}
AMM props are just entity files (`.ent` ). The only difference is that when using the prop import feature, instead of showing the raw resource path in the list, it shows the alias / names which have been assigned
{% endhint %}

## Sharing custom resource packs

* If you add some spawnable custom resources to the game (Such as custom entities or meshes), and want to share those in an easy-to-use way with other builders, you can use two methods:
  * It's usually best to share them as a custom [favorites' category](../ui-tabs-explained/tab-favorites-and-prefabs.md) (Or multiple categories). This allows assigning more meaningful names, and tags, for easier browsing and searching of your resources.
  * Additionally, you can share them as custom resources lists, as [explained above](adding-custom-resources-props.md#custom-resource-list)

## Cache Exclusions

* WB caches a lot of data, including the list of appearances an entity / mesh has
* This can lead to issues if you e.g. spawn a custom entity before adding custom appearances, then spawn it after you've made changes to it in WolvenKit
  * Since the list of appearances is cached, it will be empty even after adding apps to your `.ent`
* In order to avoid caching you can add a cache exclusion in the settings:

<figure><img src="../../../../.gitbook/assets/OSCacheExclusion" alt="" width="563"><figcaption><p>Now WB will always load the appearance and BBox information from the resource itself, instead of using cached data</p></figcaption></figure>



