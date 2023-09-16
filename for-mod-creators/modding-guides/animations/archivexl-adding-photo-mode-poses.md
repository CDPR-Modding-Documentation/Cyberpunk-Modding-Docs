---
description: How to hook up custom photo mode poses with ArchiveXL
---

# ArchiveXL: adding Photo Mode Poses

## Summary <a href="#summary" id="summary"></a>

**Created by @manavortex**\
**Published May 09 2023**

This guide will walk you through **adding poses** to Cyberpunk 2077's photo mode with **ArchiveXL**.

**Difficulty:** You know how to read ;)&#x20;

{% hint style="danger" %}
This guide will teach you how to hook up an existing .anims file to the photo mode. If you don't have an .anims file, you can find a dummy file in the AMM [pose guide](../animations/amm-collab-anims-poses.md), or you can learn [how to make your own](https://xbaebsae.jimdofree.com/cyberpunk-2077-tutorials/cp2077-custom-poses-and-animations/).
{% endhint %}

**It uses the following versions:**

* Cyberpunk 2077 game version 1.6.2 Hotfix
* [WolvenKit](https://github.com/WolvenKit/WolvenKit-nightly-releases/releases) >= 8.9.0
* [TweakXL](https://www.nexusmods.com/cyberpunk2077/mods/4197) 1.1.4
* [ArchiveXL](https://www.nexusmods.com/cyberpunk2077/mods/4198) 1.4.5 (the first version supporting this feature)
* [Red4ext](https://www.nexusmods.com/cyberpunk2077/mods/2380) 1.12.0

{% hint style="info" %}
You do not need any pose mode extender like PMU or MPAF anymore, although the ArchiveXL feature is compatible wiith all of them.
{% endhint %}

{% hint style="success" %}
Check out [this tool](https://wolv-photomode-tools.netlify.app/) by @wolv, it will generate yaml files for you
{% endhint %}

## Getting the files

Download either of these files:&#x20;

* full Wolvenkit project ([Nexus](https://www.nexusmods.com/cyberpunk2077/mods/8287))
* Wolvenkit source folder ([Nexus](https://www.nexusmods.com/cyberpunk2077/mods/8287))

## Setting up the files

At any point during this guide, you can press the green `Install` button on Wolvenkit's toolbar to check the mod in Wolvenkit.

### Step 1: Rename the folders

{% hint style="info" %}
This step is optional, but if you want to release your mod, you **have** to complete it (or cause mod conflicts for your users. Don't cause mod conflicts for your users.)
{% endhint %}

We usually do this at the very end and I'm leaving you alone with it. However, this time we start by renaming the folders.

The screenshot below shows **suggestions**. Name your files and folders whatever you want, as long as they have no uppercase letters.

<figure><img src="../../../.gitbook/assets/archiveXL_photomode_file_structure.png" alt=""><figcaption></figcaption></figure>

### The .xl file

This file tells Cyberpunk to load your custom poses and will be in the same folder as the .archive file for your mod. It looks like this:

<pre><code><strong>animations:
</strong>  - entity: base\characters\entities\player\photo_mode\player_wa_photomode.ent
    set: tutorial\animations\netrunner_making_poses\pwa.anims
  - entity: base\characters\entities\player\photo_mode\player_ma_photomode.ent
    set: tutorial\animations\netrunner_making_poses\pma.anims
  - entity: base\characters\entities\player\photo_mode\johnny_photomode.ent
    set: tutorial\animations\netrunner_making_poses\pma.anims    
  - entity: base\characters\entities\photomode_replacer\photomode_npc_woman_average.ent
    set: tutorial\animations\netrunner_making_poses\pwa.anims
  - entity: base\characters\entities\photomode_replacer\photomode_npc_man_average.ent
    set: tutorial\animations\netrunner_making_poses\pwa.anims
localization:
  onscreens:
    en-us: tutorial\animations\netrunner_making_poses\localization.json

</code></pre>

You have to adjust the paths under `set` and `en-us` to your new changed folder structure.

{% hint style="info" %}
If you want to support more body types from the Nibbles Replacer, you can [switch to the Mod Browser](../analysing-other-mods/) and enter the following search query to find all the entities: \
`base\characters\entities\photomode_replacer > .ent`
{% endhint %}

Here's what those things do:

`animations:` A list of entities and animation files that you want to add to them\
`animations/entity:` The relative path to the photomode .ent file. There are just three of them.\
`animations/set:` The relative path to the .anims file in your Wolvenkit project.\
`localization/onscreens/en-us:` A file with translation strings. Holds the name of your photo mode pose set.

### localization.json

{% hint style="info" %}
You can name this file whatever you want, just make sure that you change the path and name in the .xl file.
{% endhint %}

* Change the yellow box `UI-Photomode-tutorial-netrunner-making-poses` to something unique to your mod.&#x20;
* The green text is the name that will show up in photo mode — the female variant is the default.

<figure><img src="../../../.gitbook/assets/archivexl_photomode_json.png" alt=""><figcaption></figcaption></figure>

### The .anim file(s)

If you have created your own animations (as a [replacer](https://xbaebsae.jimdofree.com/cyberpunk-2077-tutorials/cp2077-custom-poses-and-animations/) or for [AMM](../animations/amm-collab-anims-poses.md)), then you are already familiar with this kind of file.  If not, it is time to appropriate one from the game files - pick any, since the process is just like with a replacer.

Just as a reminder, here's how they look:

<figure><img src="../../../.gitbook/assets/archivexl_photomode_anim.png" alt=""><figcaption></figcaption></figure>

You will need the green text in your [.yaml file](archivexl-adding-photo-mode-poses.md#the-.yaml-file).&#x20;

{% hint style="info" %}
Optional: If you want your pose to move, you can set the duration in the .yaml as well!
{% endhint %}

### The .yaml file

This file will go into `r6/tweaks/yourfolder` and appends the poses that you defined to the photo mode. Without this file, the animations will be in the entity, but the photo mode won't know about them.&#x20;

{% hint style="success" %}
You can use [this tool](https://wolv-photomode-tools.netlify.app/) by @wolv to autogenerate your .yaml. If you do that, then you can skip this entire section and check [the result](archivexl-adding-photo-mode-poses.md#the-result).
{% endhint %}

It has three sections:

#### Adding the category

The first block will introduce your new category to the photo mode.&#x20;

{% hint style="info" %}
I recommend doing search and replace on `netrunner_making_poses`, because it's used a bunch of times.
{% endhint %}

* `PhotoModePoseCategories.netrunner_making_poses`: This is the name of the category, used to assign individual pose entries to your category.
* `displayName:` This must match the `secondaryKey` in your .json

<figure><img src="../../../.gitbook/assets/archivexl_photomode_yaml_1.png" alt=""><figcaption></figcaption></figure>

#### Define the pose entries

{% hint style="danger" %}
If one of your poses is called `idle_stand`, that will break a bunch of other mods. Please re-name it in both the .anims file and the .yaml before releasing.
{% endhint %}

Now comes a long list of entries. They'll look like this:

<figure><img src="../../../.gitbook/assets/archivexl_photomode_yaml_2.png" alt=""><figcaption></figcaption></figure>

{% hint style="success" %}
You need to add one of those for every pose from your .anim file that you want to show up in photo mode.
{% endhint %}

`PhotoModePoses.sit_chair_table_keyboard__2h_on_keyboard__make_amm_addon`: This is the unique key to assign your pose to your pose set. You'll need it in the third block. \
`animationName`: This must match the animation name in your [.anim file](archivexl-adding-photo-mode-poses.md#the-.anim-file-s) (the green box).\
`category`: This must match the category in the first block.\
`displayName`: What'll show up in photo mode

### Telling photo mode about the poses

You register your poses for photo mode by creating the following entry categories:

```
photo_mode.character.malePoses
photo_mode.character.johnnyPoses
photo_mode.character.femalePoses
photo_mode.character.quadrupedPoses
```

An entry looks like this:

<figure><img src="../../../.gitbook/assets/archivexl_photomode_yaml_3.png" alt=""><figcaption></figcaption></figure>

The entries in the list **must** match the unique keys that you've defined in the second block, and you need one entry per pose. If you have different names for differently-gendered poses, you need to use the correct lists.

{% hint style="info" %}
`photo_mode.character.quadrupedPoses` enables Nibbles photo mode replacer support for AMM >= 2.2.4
{% endhint %}

## Finishing up

Before you can share your pose pack, you need to **change the paths**. If you don't and the next modder **also** doesn't, then only one of your mods will work.

You can find a full guide on changing the paths [here](../everything-else/moving-and-renaming-in-existing-projects.md).

If you rename files or folders under resources, remember to delete the old control files from your game directory.

## The result

{% hint style="info" %}
At any point during this guide, you can press the green `Install` button on Wolvenkit's toolbar to check the mod in Wolvenkit.
{% endhint %}

<figure><img src="https://i.imgur.com/1nMpUSy.png" alt=""><figcaption><p>She has no idea what she's doing</p></figcaption></figure>

<figure><img src="https://i.imgur.com/eakqwZu.png" alt=""><figcaption><p>Fortunately, you can hire specialists</p></figcaption></figure>
