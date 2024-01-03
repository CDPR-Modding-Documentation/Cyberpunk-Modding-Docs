---
description: How to create your V as an NPC
---

# NPV - V as custom NPC

**Created by @manavortex**\
**Published May 13 2023**

This guide will show you how to do the following things:&#x20;

* Setting up a Wolvenkit project with the prepared example files
* Creating your V's head in Blender (has its own [sub-page](npv-preparing-the-head-in-blender.md))
* Adding them as an NPC to spawn them with AppearanceMenuMod (has its own sub-page)

#### Difficulty:

Easy, but not trivial: you don't need any prior knowledge, but the process is complex, and if you miss steps or deviate from the instructions, things will end up not working for you.

{% hint style="success" %}
If you run into issues with this guide, the right place to ask for help is `#mod-dev-chat` on the [redmodding Discord server](https://discord.gg/redmodding).&#x20;
{% endhint %}

**This guide uses the following versions:**

* Cyberpunk 2077 game version >= 1.6
* Wolvenkit:&#x20;
  * for game versions < 2.0, use [8.10.0](https://github.com/WolvenKit/WolvenKit/releases/tag/8.10.0)
  * for game versions >= 2.0 / Phantom Liberty, use >= 8.11 ([Nightly](https://github.com/WolvenKit/WolvenKit-nightly-releases/releases) | [Stable](https://github.com/WolvenKit/Wolvenkit/releases))
* [Blender](https://www.blender.org/download/) 4.0 or 3.6
* [AppearanceMenuMod](https://www.nexusmods.com/cyberpunk2077/mods/790) >= 2.1

{% hint style="info" %}
This tutorial should cover your basic needs, but there are many more guides and resources about NPV creation outside of this wiki. You can find them [here](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/community-guides/npvs-v-as-npc-custom-npcs).&#x20;

If you want to edit original V's files, you're (generally) in the right place. You can find extra information on [a-new-head-for-v.md](../a-new-head-for-v.md "mention").
{% endhint %}

{% hint style="warning" %}
None of this would have been possible without **NoraLee**, who pioneered the process and taught me everything that I needed to know to set up these tools. This guide doesn't use any of their resources, but a lot of their knowledge. For the full guide with all edge-cases, bells, whistles and context, see their [Google Drive](https://drive.google.com/drive/folders/1R-knopKMhHDZuokPKaTt0nIDArXcQdrb).&#x20;

This is the speedrun version. If you want extra details and context, **please check Nora's Google Doc**.
{% endhint %}

## Preparation: The character preset

Due to the complexity of V's head mesh, you have to do a little bit of prep work here.

Don't worry, I'll walk you through it step by step.

To create a face, we need to know your character's values:&#x20;

* Eyes
* Eyebrows
* Nose
* Mouth
* Jaw
* Ears

Find the mirror in V's apartment and note down the **numerical values**.

<figure><img src="../../../../.gitbook/assets/npv_head_character_creator_numbers.png" alt=""><figcaption></figcaption></figure>

### Setting up the files

{% hint style="info" %}
**Body gender:**

As a rule of thumb, I'll document the process for an NPV with a female body gender, because ~~as we all know, the other doesn't exist~~ I have one of those. If yours has a male body gender, your **file paths** will be slightly different, but the process is exactly the same.
{% endhint %}

1. Create [a Wolvenkit project](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects#create-a-new-wolvenkit-mod-project)
2. Download the example files from [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/8328)
3. Merge the `source` folder in the download with the `source` folder in your Wolvenkit project directory
4. In **Wolvenkit**'s [archive tab](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/project-explorer#archive), find the prepared folders per body gender:

<table><thead><tr><th width="179">body gender</th><th>file path</th></tr></thead><tbody><tr><td>female</td><td><code>tutorial\npv\your_female_character</code></td></tr><tr><td>male</td><td><code>tutorial\npv\your_male_character</code></td></tr></tbody></table>

5. Delete the one you're not using (do one Wolvenkit project per NPC. No, really, I mean it.)
6. In **Wolvenkit**'s [resource tab](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/project-explorer#resources), delete the `.lua` file for the body gender that you don't want to use.

{% hint style="danger" %}
This tutorial assumes that you will rename and re-path your files **at the very end**, because the prepared files rely on a certain file structure. We'll get to it!
{% endhint %}

## Check if it works

This is a working Wolvenkit project — let's make sure that it works.&#x20;

{% hint style="success" %}
You can do this at any time during the tutorial to check your progress!
{% endhint %}

1. On the Wolvenkit toolbar, you'll find a button to [install the project](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/menu/toolbar#install-and-launch)
2. Switch it to "Install and launch"&#x20;
3. Click it
4. When the game starts, load a savegame
5. Open the CET overlay
6. Switch AMM to the "Spawn" tab
7. Search for `Tutorial`
8. Spawn `Tutorial Woman` or `Tutorial Man`

You should now see a person in front of you.

## Get cracking

Now it's time to do the actual work.&#x20;

* If you want to create your V's head for Cyberpunk, go to [npv-creating-a-custom-npc.md](npv-creating-a-custom-npc.md "mention")
* If you just want to set up the file structure, go to [npv-creating-a-custom-npc.md](npv-creating-a-custom-npc.md "mention")

{% hint style="danger" %}
Please remember that before sharing your NPV, you _**have**_ to change the paths! At the very least, rename the `tutorial` folders inside of `archive` and `resources` to your user name and then do a [fulltext search and replace in json](../../everything-else/moving-and-renaming-in-existing-projects.md).

However, you might want to do that **after** [preparing the head in Blender](npv-preparing-the-head-in-blender.md), as you would otherwise have to move the utility script around.
{% endhint %}

<figure><img src="https://64.media.tumblr.com/f9d975e408bb678ba2acddec9f76cbd8/c1517bdcdc3d9374-c8/s2048x3072/553431af3044de381134d1484df5b5b919049f42.pnj" alt=""><figcaption><p>You'll be editing these two</p></figcaption></figure>
