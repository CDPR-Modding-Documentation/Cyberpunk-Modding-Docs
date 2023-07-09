---
description: Adding weapons
---

# Weapons

## Summary

**Created by @manavortex**\
**Published July 08. 2023**

Weapons work a little different from regular ArchiveXL items, starting right at the root entity. With the help of @**Apart** and **psiberx,** I was able to figure out the process and document it for you.

{% hint style="info" %}
This guide assumes that you are at least somewhat familiar with ArchiveXL item additions as per the "[Adding new Items](./)" guide. If you have no idea where to start, make sure that you set up a working shirt and then start making the changes below.
{% endhint %}

## Selecting the base

Start by finding the .app file of an original weapon of the type you want to make (Theres a list [here](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators/references-lists-and-overviews/equipment/weapons)) and adding it to your project. We will change that file, rather than assembling anything by hand.

In the app file, you can also find the value for the yaml file's `$base` property:

<figure><img src="../../../../.gitbook/assets/archivexl_weapons_basetype.png" alt=""><figcaption></figcaption></figure>

## Getting the mesh\_entity.ent

You need the correct mesh entity to go with your appearance file. You can find them under `base\weapons`\ - search for the name of your weapon, or just navigate through the folders.&#x20;

This file makes the weapon show up in photo mode. Instead of going into the PartsValues, it will be linked in the app file's root as `baseEntity` (there's a screenshot below). Leave it alone for now, it's easier to make the appearances working correctly in the .app file and then copying over an entire component array.

## Factory: .app instead of root\_entity

Instead of a root entity file, you need to point your factory.csv directly to your iron's app file (the one from the section above).

<figure><img src="../../../../.gitbook/assets/archivexl_weapons_factory.png" alt=""><figcaption></figcaption></figure>

## Appearance selection

An equipment item's lookup chain goes from the `appearanceName` in the yaml to the `root_entity`, where the `appearanceName` will lead to the correct appearance in the `.app` file.

With a weapon, all that happens through **`visualTags`**.

### Define the field in the yaml:

<figure><img src="../../../../.gitbook/assets/archivexl_weapons_yaml.png" alt=""><figcaption></figcaption></figure>

### Define the visual tag in your .app file:

**visualTags (violet)**: Must match the visualTags in your `.yaml` file. If multiple entries match, one will be chosen at random.

{% hint style="info" %}
Unlike with an entity file, the appearance name doesn't matter. You can name all of them `foo`, and as long as you had the visual tags right, it still works (I would advise against it, though)
{% endhint %}

<figure><img src="../../../../.gitbook/assets/archivexl_weapons_appfile.png" alt=""><figcaption><p><strong>visualTags (violet)</strong>: Must match the visualTags in your .ent file. If multiple entries match, one will be chosen at random.</p></figcaption></figure>

## Step by step

As the process of this is finicky and there can be all sorts of sudden unexpected behaviour, here's the best way to go about this:

1. Find the .app file of a suitable base weapon, add it to your project, and rename it. Don't change anything for now,  future you might need them for testing.
2. Find the correct .ent file under `base\weapons`\ . The number of components should be the same as in any appearance's component array (red arrow on the screenshot above)
3. Configure the yaml as described [above](weapons.md#define-the-field-in-the-yaml)
4. Set up **one** (1) appearance for testing by assigning the correct visual tags. Do not delete the other appearances yet while you make sure that the one you selected
   1. shows up in inventory/photo mode
   2. shows up in first person
5.  Change the path and appearance of any mesh components to those of your new mesh. Make sure that it

    1. shows up in your inventory with your meshes
    2. shows up in first person with your meshes
    3. shows up in photo mode at all (it shouldn't be invisible, but will still have the default appearance)
    4. all parts are visible
    5. is in the right position where V's hands are concerned (~~at least as much as for the Tactician shotgun~~)
    6. the correct mesh appearance is displayed.

    Fix any issues that might arise. Don't forget that you can split off individual meshes for individual pieces, too.
6. Once everything works, delete all other appearances, then duplicate and adjust the one you customized to show your color variants.
7. Now, finally, copy a working appearance from the .app file to your mesh entity (which you have linked in the app file's root as `baseEntity`). This will make your weapon show up in photo mode.

If you wish to add a custom icon, follow the steps in the [corresponding guide](../../everything-else/custom-in-game-icons.md).



## Adding custom player HUD icon



<figure><img src="../../../../.gitbook/assets/Screenshot 2023-07-09 231525.jpg" alt=""><figcaption><p>Custom HUD created for the rebar club.</p></figcaption></figure>

To add custom HUD icon:

1. Add `base\gameplay\gui\widgets\ammo_counter\atlas_ammo_counter.inkatlas` and `base\gameplay\gui\widgets\ammo_counter\atlas_ammo_counter.xbm` to your project.
2. Export `base\gameplay\gui\widgets\ammo_counter\atlas_ammo_counter.xbm` as PNG and create custom icon in chosen editing software. You can follow the same instructions as for creating custom inventory icon above.
3. Import your PNG over the xbm with those settings:

<figure><img src="../../../../.gitbook/assets/Screenshot 2023-07-09 232152.jpg" alt=""><figcaption><p>HUD Icon import settings.</p></figcaption></figure>

4. Edit the inkatlas file as in icon creation guide.
5. Add those in your yaml file. The `atlasResourcePath` should correspond to where your inkatlas file is located, `atlasPartName` should corespond to which slot was used in the inkatlas file for your custom icon, `$type` should be as on the screenshot.

<figure><img src="../../../../.gitbook/assets/yamlhudiconweapon.png" alt=""><figcaption></figcaption></figure>
