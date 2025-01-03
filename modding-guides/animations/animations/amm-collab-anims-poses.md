---
description: How to add your poses to AMM
---

# AMM: Collab anims/poses

## Summary <a href="#summary" id="summary"></a>

**Created by @manavortex**\
**Published April 16 2023**

#### **Versions:**&#x20;

| Wolvenkit         | >= 8.9.0 (or whatever works for you)         |
| ----------------- | -------------------------------------------- |
| AppearanceMenuMod | >= 2.2 (earlier versions won't support this) |

This guide will teach you how to add custom animations to **AppearanceMenuMod**'s `Pose` tab.

**Difficulty level:** You're able to read ;) You don't even need to know your way around Wolvenkit for this one!

### Wait, this is not what I want!

To add poses to photo mode, check [archivexl-adding-photo-mode-poses](archivexl-adding-photo-mode-poses/ "mention").

{% hint style="info" %}
This tutorial will use `animation` and `pose` interchangeably. An animation is simply a pose that moves.
{% endhint %}

## Prerequisites

1. You have an `.anims` file, either a game file or one that you have [made yourself](poses-animations-make-your-own/)
2. You have a [Wolvenkit project](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects#create-a-new-wolvenkit-mod-project)
3. You have a text editor like [Notepad++](https://notepad-plus-plus.org/downloads/)
4. You have **one** of the following things:
   1. The **Easy AMM Poses** tool ([Nexus](https://www.nexusmods.com/cyberpunk2077/mods/13904) | [Github](https://github.com/stndn0/Easy-AMM-Poses))
   2. The template project ([Nexus](https://www.nexusmods.com/cyberpunk2077/mods/8107))
   3. **Not recommended:** A different template project or game files that you want to adjust. _If you don't know what you're doing yet, this may lead to frustration_

## Overview

The screenshots show the example project, but it's absolutely no problem if you set up everything on your own: the guide will tell you which path goes where.

<figure><img src="../../../.gitbook/assets/amm_custom_poses_file_structure.png" alt=""><figcaption></figcaption></figure>

{% hint style="success" %}
If you have downloaded the example Wolvenkit project, you can start it (the "Install" button has an "Install and launch" option in the dropdown) to see everything in action: \
\- Spawn an NPC (generic male or female)\
\- Switch to the `Poses` tab\
\- Find the `Netrunner making AMM mods` category and select one of the poses\
\- Your NPC should now move!
{% endhint %}

### Easy AMM poses

Instead of following the process below, you can use the [Easy AMM poses ](https://www.nexusmods.com/cyberpunk2077/mods/13904)generator, which will walk you through the process.&#x20;

The pose generator will generate the entire structure out of your `.anim` file and your user input. You can then follow the steps under [#connecting-the-files](amm-collab-anims-poses.md#connecting-the-files "mention") to move your files around.

Visual learners rejoice: There is a video!

{% embed url="https://www.youtube.com/watch?v=u4dW-kUs184" %}

## Connecting the files

Start by customizing your file structure. If you leave it as it is and publish the mod and somebody else does the same, only one of the two will work. Create a folder structure that is unique to you.

{% hint style="info" %}
It is good practice to leave `base` for the game files, and simply have a folder with your username at the root level of `archive`.&#x20;
{% endhint %}

{% hint style="danger" %}
Your file structure **must not** contain spaces, capital letters, or any funky characters, or the game might not find your files. Stick to `a-z`, `0-9`, `-` and `_`, and you're safe.
{% endhint %}

### File structure: The .lua

1. Any lua poses for AMM must be inside `Custom Poses`,  but you can rename `your_optional_subfolder` to whatever you want (or even delete it).
2. Rename `amm_tutorial.lua` to something that identifies your pose pack, e.g. `netrunner_coding`
3. Open the file in your text editor. Let's look at the first half of the entries (we'll check the second half later):

```lua
return {
  -- Your beautiful name :)
  modder = "your_name_here",
  
  -- A custom category for your poses that will appear on the list in the tab. 
  -- You could use your name or a description of your pose pack. 
  -- You can also add your stuff to a category that somebody else has already defined.
  category = "Netrunner making AMM mods",
  
  -- relative path to your ent file. You can copy this from Wolvenkit.
  -- Don't forget to add the extra slashes!
  entity_path = "tutorial\\amm_custom_poses\\making_addons\\ops\\amm_tutorial.ent",
  
  -- we'll get to these at "Custom Poses: The .lua"
  anims = { --[[ here be code ]]  }
}
```

4. Change `modder` to your name so people know who made this.
5. Change `category` to the name of your pose pack. This will be used for AMM to sort your poses into categories, which people will use to browse, so don't go overboard.
6. Change `entity_path`: Right-click on your .ent file in WKit and select `Copy relative Path` and paste it into the lua.&#x20;
7. Replace all `\` in your entity path with `\\`. **This is critical and your mod will not work if you don't!**

### File structure: The .ent

{% hint style="info" %}
Entity files tell the game what to load. You can learn more about them [here](../../../for-mod-creators-theory/files-and-what-they-do/entity-.ent-files/) if you are curious, but you don't have to.
{% endhint %}

Open the `components` array, find the component with the name of `amm_workspot_collab`, and set the depotPath of workspotResource to the relative path of your [`.workspot`](amm-collab-anims-poses.md#file-structure-the-.workspot) file.

Do not change anything else — we're done here.

<figure><img src="../../../.gitbook/assets/amm_custom_poses_ent_file.png" alt=""><figcaption></figcaption></figure>

### File structure: The .anim

{% hint style="info" %}
You don't need to change anything here yet, we'll be doing this [in the next step](amm-collab-anims-poses.md#custom-poses-the-.anims).
{% endhint %}

An .anims file is targeting a specific rig and holds a list of animations. These hold the pose data; they're what you overwrite when [importing from Blender](https://xbaebsae.jimdofree.com/cyberpunk-2077-tutorials/cp2077-custom-poses-and-animations/).

### File structure: The .workspot

Scroll to the bottom of the file and  find the node named `workspotTree`. Open it and find the list `finalAnimsets`.&#x20;

Each of the `workWorkspotAnimsetEntries` inside `finalAnimset` connects animation files and rigs.&#x20;

{% hint style="info" %}
You can delete entries if you don't have animations for that rig.
{% endhint %}

{% hint style="info" %}
The tutorial version uses the same .anim file for V's first person animations. Looks weird, but works. You can change it later on your own.
{% endhint %}

<figure><img src="../../../.gitbook/assets/amm_custom_poses_workspot_animfile.png" alt=""><figcaption></figcaption></figure>

For each of the entries you keep, make sure that the following paths point at the right animset:

* `animations.cinematics[0].animSet`
* `loadingHandles[0]`

{% hint style="warning" %}
If you have launched the game before, make sure to delete the file&#x20;

`Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks\mods\AppearanceMenuMod\Collabs\Custom Poses\your_optional_subfolder\amm_tutorial.lua`
{% endhint %}

{% hint style="success" %}
A good time to check: make sure that everything works again and that the files are correctly connected. If not, check the [troubleshooting section](amm-collab-anims-poses.md#troubleshooting) of this guide.
{% endhint %}

## Custom poses

Now that we have the basic structure covered, let's talk about pose names. This time, we start at the end and make our way backwards.&#x20;

### Custom poses: The .anims

{% hint style="info" %}
Files for each type of rig are included in the example files, but you can also find them yourself by searching Wolvenkit for `rigName > .anims` or `character > .anims` (e.g. `massive > .anims` or `Smasher > .anims`)
{% endhint %}

Find and open your .anims file. Here's what you're looking at:

<figure><img src="../../../.gitbook/assets/amm_custom_poses_anim_file.png" alt=""><figcaption></figcaption></figure>

Open the animations array to see data for all defined animations (poses). You can make more by duplicating them, delete obsolete entries and change their names; any other changes are coming from Blender.

{% hint style="info" %}
An animation's name must match the `.lua` and the `.workspot`, spelling mistakes will break it. They must not contain spaces, use `_` instead. AMM will take care of that for you.
{% endhint %}

### Custom poses: The .workspot

Open your .workspot file and expand the following nodes:&#x20;

* workspotTree
  * rootEntry
    * list

First, we're going to look at `workSequences.`This data type is used for pose transitions and -definitions (e.g. an NPC standing up). For our purpose, we don't need any of the fancy stuff.&#x20;

While this list in the example file contains two `workSequences,` you're gonna need one per however many animations/poses you have. Duplicate to your hearts content.



<figure><img src="../../../.gitbook/assets/amm_custom_poses_workSequence.png" alt=""><figcaption><p>Here's how a workSequence looks. Note the duplicate ID property - and each of those has to be unique!</p></figcaption></figure>

{% hint style="info" %}
You need one workSequence for each of your animations!
{% endhint %}

1. Open the `workSequence` and expand both `id` and `list`.
2. Expand the first list entry (`workAnimClip`) and its proprety `id`.
3. Point it at the right animation: Change the `workAnimClip`'s property `animName` to the name of your animation (_green on screenshot_)
4. Make sure the IDs in the workSequence are unique. (You can skip this for the two entries from the template - if you continue they pattern they establish, all id's will be incremented and unique.)
   1. Find the `workSequence`'s property `id` and increment its numeric value +1 from the previous `id` (_orange on screenshot_)
   2. Find the `workAnimClip`'s property `id` and increment its numeric value +1 from the previous `id` (_orange on screenshot_)
5. To clarify - our first example `workSequence` had a property `id` of 2 and its `workAnimClip`'s propery `id` was 3. Our second example `workSequence` had a property `id` of 4 and its `workAnimClip` had a property `id` of 5. Therefore, your next `workSequence` should have a property `id` of 6 and its `workAnimClip`'s property `id` should be 7, and so on. **But good news!** WolvenKit's File Validation can fill in these numbers for you. Visit [this page](https://wiki.redmodding.org/wolvenkit/wolvenkit-app/file-validation) for more information.
6. **Optional, but recommended:** Set the `workSequence`'s property `idleAnim`  to the name of your appearance (_purple on screenshot_). This is purely for your convenience, as you can see which is which when scrolling through the list.

{% hint style="danger" %}
The numeric values for all the`id` properties - under `workSequence and workAnimClip -` need to be **unique** within the scope of the `workspotTree`. As soon as you have duplications here, things will be out of order.
{% endhint %}

### Custom poses: The .lua

As of version 2.2, AMM doesn't know anything about the file structure. For that reason, you need to tell it about the poses you added, and the anims array is how you do that.

```lua
  anims = {        
      ["Man Average"] = {                       -- male body gender, e.g. spawned masc V, Johnny, Viktor, Takemura…
        "sit_chair_table_keyboard__2h_on_keyboard__make_amm_addon",
        "sit_chair_table_keyboard__2h_on_keyboard__01__thinking",
      },                    
      ["Woman Average"] = {                     -- female body gender, e.g. spawned femme V, Panam, Judy, Mamá Welles…
        "sit_chair_table_keyboard__2h_on_keyboard__make_amm_addon",
        "sit_chair_table_keyboard__2h_on_keyboard__01__thinking",      
      },                   
      ["Big"] = {},                             -- any body gender: big folks, e.g. Jackie, River, Rhino…
      ["Child"] = {},                           -- any body gender: children
      ["Fat"] = {},                             -- any body gender: fat folks, e.g. Dexter
      ["Man Massive"] = {},                     -- Smasher      
      ["Player Man"] = {},                      -- first person: male body gender V
      ["Player Woman"] = {},                    -- first person: female body gender V
  }
```

The lists tell AMM which poses belong to which rig, allowing to hide them when they aren't supported. As you can see, it's no problem if there are duplicate names, and you can even reuse entries in the workspotTree — the game knows which animation to use because of the [file structure above](amm-collab-anims-poses.md#connecting-the-files).

## Troubleshooting

{% hint style="warning" %}
If you have launched the project in its default state before starting to customize it, delete the file&#x20;

`Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks\mods\AppearanceMenuMod\Collabs\Custom Poses\your_optional_subfolder\amm_tutorial.lua`
{% endhint %}

{% hint style="info" %}
A pose gets correctly added by AMM if you see it in the list and can delete it.
{% endhint %}

### AMM doesn't show my poses

The problem is in your `.lua`, AMM fails to pick up the pose information you provided. You can check `AppearanceMenuMod.log`, which might tell you what's wrong, but it's probably fastest to just start over from the template `.lua` file.&#x20;

{% hint style="info" %}
Make sure that you don't add or delete any commas or quotation marks.
{% endhint %}

### I click, but nothing happens (no pose shows up in AMM)

The problem is between your `.lua` and your `.ent` file: the poses were registered correctly with AMM, but Cyberpunk can find nothing to spawn.&#x20;

### The NPC briefly T-poses, and then the game crashes

Check your [`.workspot` file](amm-collab-anims-poses.md#file-structure-the-.workspot) for copy-paste mistakes when hooking up your .anim files.

### My custom pose changes are ignored

The error is between Blender and your .anims file. Double-check names and make sure that you actually imported.

### The wrong pose is triggered

You messed up the indices in the `.workspot` file. [Go back](amm-collab-anims-poses.md#custom-poses-the-.workspot) and make sure that they're all unique.



