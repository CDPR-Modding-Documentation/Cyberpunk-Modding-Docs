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

Start by finding the .app file of an original weapon of the type you want to make and adding it to your project. We will change that file, rather than assembling anything by hand.

In the app file, you can also find the value for the yaml file's `$base` property:

<figure><img src="../../../../.gitbook/assets/archivexl_weapons_basetype.png" alt=""><figcaption></figcaption></figure>

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
2. Configure the yaml as described above
3. Set up **one** (1) appearance for testing by assigning the correct visual tags. Do not delete the other appearances yet while you make sure that the one you selected
   1. shows up in inventory/photo mode
   2. shows up in first person
4.  Change the path and appearance of any mesh components to those of your new mesh. Make sure that it

    1. shows up in inventory/photo mode
    2. shows up in first person
    3. is in the right position where V's hands are concerned (~~at least as much as for the Tactician shotgun~~)
    4. all parts are visible
    5. the correct mesh appearance is displayed.

    Fix any issues that might arise. Don't forget that you can split off individual meshes for individual pieces, too.
5. Once everything works, delete all other appearances, then duplicate and adjust the one you customized to show your color variants.
