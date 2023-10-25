# R\&R: Your own Wolvenkit project

## Summary <a href="#summary" id="summary"></a>

**Created by @manavortex**\
**Published September 30 2023**

This page is a part of the [Recolours and Refit guide](broken-reference) and will walk you through the process of creating your own Wolvenkit project. Here, we will:

* create our project
* solve load order via **project name**
* get the files from the mod that we want to change

**Time to complete:**&#x20;

* \~30 minutes for the tutorial
* once you know how it works: < 5 minutes to create a project and add the correct files from a mod

{% hint style="info" %}
The principles you learn here are universal. Once you have understood how this works, you can recolour and refit **any Cyberpunk item**.
{% endhint %}

{% hint style="warning" %}
If you are editing modded items, you should **seek permission** first. For your personal use, you can (legally) do what you want, but making mods takes **time and effort**.&#x20;

Please respect mod creators' wishes in that regard.&#x20;

You can check find the standard permissions on a mod's Nexus page, `Description` tab, under the **Permissions and Credit** header right next to the requirements.
{% endhint %}

### Prerequisites

The links in the check list go to more detailed guides. For the exact things you have to do if you can't check the boxes, see  the previous section of the guide ->[Broken link](broken-reference "mention"),

* [ ] You have [Wolvenkit installed](http://127.0.0.1:5000/s/-MP\_ozZVx2gRZUPXkd4r/getting-started/download) and configured
* [ ] You have [MLSetupBuilder installed](../../../modding-tools/mlsetup-builder.md#installation) and [configured](./#netrunner-suit-preview)
* [ ] You have [installed the mod](./#install-the-mod)

## Why do I want a Wolvenkit project?

To edit an appearance, you need to **make a mod**, and for that, you need a Wolvenkit project.&#x20;

As soon as you have changed the first file, you can [install your mod](http://127.0.0.1:5000/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/menu/toolbar#install-and-launch) and check if it is working.&#x20;

There are two ways you can go about the process: do either a **full repack** of my mod, or **create a compatibility archive**. This section will explain the differences, the [next one](r-and-r-your-own-wolvenkit-project.md#creating-your-wolvenkit-project) will walk you through the process of setting things up for either of those options.

|                          | Full Repack                             | Compatibility Archive                  |
| ------------------------ | --------------------------------------- | -------------------------------------- |
| Needs original mod?      | no, is a full replacement               | yes                                    |
| Can update original mod? | no, and doing so will nuke your changes | yes                                    |
| Needs load order?        | No, replaces original mod               | yes, needs to load before original mod |

{% hint style="success" %}
Once you've made your decision, you can proceed to the next section and [create your Wolvenkit project](r-and-r-your-own-wolvenkit-project.md#creating-your-wolvenkit-project). If you aren't certain yet, you can keep reading to find the pros and cons listed more clearly.
{% endhint %}

### A full repack

Your mod completely **overwrites** the original mod, creating your own local copy.&#x20;

{% hint style="info" %}
I do this with mods for my own personal use — I don't care if the original mod is updated, my character will only ever wear that one custom variant.
{% endhint %}

#### Pros:&#x20;

* Anything I do to the mod in the future won't affect you

#### Cons:&#x20;

* Anything I do to the mod in the future won't affect you
* If you update or reinstall the original mod, you will overwrite your changes
* If you're anything like me, you'll lose track of which files you have or haven't modified

### A patch

You'll create a compatibility mod that will exist **together** with the original.

{% hint style="info" %}
I do this with mods where I only want to change little things, e.g. removing a submesh. When the original mod updates, I can update my compatibility mod in <5 minutes.
{% endhint %}

#### Pros:&#x20;

* You can still update and reinstall the original without overwriting your changes
* Your mod has only exactly those files that you've actually changed

#### Cons:

* You have to keep the original installed
* Only works together with the original
* Updates on the original mod **might** necessitate an update on your part
* Your mod has to load **before** the original, so you need to fix load order. (This guide will tell you how)

This is where you pick any of those options.

## Creating your Wolvenkit project

{% hint style="warning" %}
The .archive that Wolvenkit packs for you will have the same name as your project. Stick to the recommendations in Step 4, or read the expandable box to learn more.
{% endhint %}

1. From Wolvenkit's menu bar, select File -> New Project
2.  Fill the fields in the dialogue:\


    <figure><img src="../../../../.gitbook/assets/wolvenkit_create_project.png" alt=""><figcaption></figcaption></figure>
3. `Creation Location`: This is where your loose files are going to live. From here, Wkit can pack it as a mod and install it to your game directory. \
   Select any folder outside of your game directory.
4. `Project Name`:  The name of your project, and subsequently, the name of your .archive file.&#x20;
   * If you want to **overwrite**: Name it the same as the original mod's `.archive` (`_ArchiveXL_Netrunner_Variants`)
   *   If you want to **patch**: It needs to come before the original in [ascii sort order](https://theasciicode.com.ar/). Pick any of the following:

       * `_ArchiveXL_Netrunner_0_Refit`
       * `_ArchiveXL_NetrunnerVariants`
       * `_00_ArchiveXL_Netrunner_Variants`

       My personal preference is the first, as the .archive files will show up&#x20;

<details>

<summary>Why do we name it like that?</summary>

In Cyberpunk, any file can only **be modded once**. When something has altered a texture or mesh, everyone else can get lost.

At some point during start-up, Cyberpunk 2077 will open up the mod directory, grab a list of all mods, and load them. Naturally, it will start at the top of that list, so your mod needs to be **further up** than the original.

We achieve that via **file name** - hence #4 on the above list.&#x20;

</details>

## Add files from the mod to your project

This part will show you how to add files to your project (you can't change them if you don't).&#x20;

### Prerequisites&#x20;

You have installed the mod from [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/9314).

### Why are we doing this?

{% hint style="success" %}
Skip to [#how-to-export-files](r-and-r-your-own-wolvenkit-project.md#how-to-export-files "mention") if you don't care.
{% endhint %}

To alter an existing item, you need to **create a mod** that will overwrite the original resource. This mod must modify that file **first** - which is where the load order comes in.

{% hint style="danger" %}
Do not move or rename any of those files, they need to be exactly where Wolvenkit puts them.
{% endhint %}

The section&#x20;

1. describes the process of [#how-to-export-files](r-and-r-your-own-wolvenkit-project.md#how-to-export-files "mention")
2. tells you which files to use it on for \
   [#selected-files-recolour](r-and-r-your-own-wolvenkit-project.md#selected-files-recolour "mention")\
   [#selected-files-refit](r-and-r-your-own-wolvenkit-project.md#selected-files-refit "mention")

{% hint style="info" %}
For the general documentation on adding files to your project, see [here](../../../modding-cyberpunk-2077/analysing-other-mods.md#step-1-switch-to-mod-browser).&#x20;
{% endhint %}

### How to export files

1. In Wolvenkit, open the Asset Browser (pinned at the right-hand side by default), and toggle the switch to "Mod Browser".

<figure><img src="../../../../.gitbook/assets/wolvenkit_assetbrowser.png" alt=""><figcaption></figcaption></figure>

2. Find `_ArchiveXL_Netrunner_Variants`, then click on it. It will be near the bottom of the list, together with your other mods starting with `_`
3. You can now **browse the archive**, or use [Wolvenkit's search bar](http://127.0.0.1:5000/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files) (next to the big red toggle button) to find files inside the archive by searching for `archive:ArchiveXL_Netrunner`.
4. Once you have found the correct items (for [recolour](r-and-r-your-own-wolvenkit-project.md#selected-files-recolour) or [refit](r-and-r-your-own-wolvenkit-project.md#selected-files-refit)), this is how you add them to the project:

<figure><img src="../../../../.gitbook/assets/wolvenkit_add_files_to_folder.png" alt=""><figcaption></figcaption></figure>

### Selected files: full repack

If you want to overwrite the complete mod, run this query in Wolvenkit's Mod Browser:&#x20;

```
archive:ArchiveXL_Netrunner
```

1. Add all files to the project — everything.
2. Now, switch the Project Explorer to `Resources`. It will be empty; you have to create the following folder structure:

```
resources                       << you are here
  - manavortex
  - r6
    - scripts
      - manavortex
```

Find and copy the following files from your **game directory** into the subfolders of `resources` (there'll be a screenshot in a minute)

#### \_ArchiveXL\_Netrunner\_variants.yaml

From: `Cyberpunk 2077\r6\tweaks\manavortex`\
To: `resources\manavortex`

#### ArchiveXL\_Netrunner\_variants\_atelier.reds

From: `Cyberpunk 2077\r6\scripts\manavortex`\
To: `resources\r6\scripts\manavortex`

#### \_ArchiveXL\_Netrunner\_variants.archive.xl

From:  either\
&#x20;   vanilla install: `Cyberpunk 2077\archive\pc\mod`\
&#x20;   REDmod: `Cyberpunk 2077\mods\RANDOMNUMBER_ArchiveXL_Netrunner_variants\archives`\
To: `resources`

<figure><img src="../../../../.gitbook/assets/netrunner_suits_resource_files.png" alt=""><figcaption></figcaption></figure>

### Selected files: Emissive

#### **TL;DR: via search browser query**

```
archive:ArchiveXL_Netrunner > emissive > .mi
```

Add all those files to your project, then skip the rest of this page and go to [r-and-r-emissive.md](r-and-r-emissive.md "mention")

### Selected files: Recolour

All material colour definitions are stored in `.mlsetup` files, which we'll be editing in [r-and-r-colour-editing.md](r-and-r-colour-editing.md "mention").

#### **TL;DR: via search browser query**

```
archive:ArchiveXL_Netrunner > .mlsetup > material > colour

e.g.
archive:ArchiveXL_Netrunner > .mlsetup > snake > blue
archive:ArchiveXL_Netrunner > .mlsetup > carbon > bronze
archive:ArchiveXL_Netrunner > .mlsetup > carbon > white > bronze
```

<figure><img src="../../../../.gitbook/assets/netrunner_suit_add_textures.png" alt=""><figcaption></figcaption></figure>

#### File structure explained

* All material definitions in this mod are in the folder `manavortex\torso\netrunning_suit\textures`
* The first level subfolders group the `.mlsetup` files by material (e.g. `nylon`, `snake`, `other`)
* The texture files inside the folders are named like `material_baseColor_accentColor`. Base colour and accent colour **should** correspond with the in-game suit name.&#x20;
* If there is a subfolder inside the material folder, the `mlsetup`s inside are using the **secondary `mlmask`**. That's not going to mean anything to you, but we'll get back to it on [r-and-r-colour-editing.md](r-and-r-colour-editing.md "mention").



If the names aren't clear enough or if you can't guess which file you have to take, you can open `netrunner_recolours_translation.json` in Wolvenkit:

<figure><img src="../../../../.gitbook/assets/netrunner_guide_open_translation_file.png" alt=""><figcaption></figcaption></figure>

Expand the `root` node and then the `entries` node. By selecting a node, you can see the translation text. The field for `secondaryKey` contains the colour variant, which corresponds to the mlsetup file name:

<figure><img src="../../../../.gitbook/assets/netrunner_suits_translation_file.png" alt=""><figcaption></figcaption></figure>

### Selected files: Refit

For a refit, you only need two files (one if you don't care about the emissive properties):

#### female body gender

<table><thead><tr><th width="200">mesh</th><th>path in files</th></tr></thead><tbody><tr><td>suit</td><td><code>manavortex\torso\netrunning_suit\meshes\pwa_netrunning_suit.mesh</code></td></tr><tr><td>emissive</td><td><code>manavortex\torso\netrunning_suit\meshes\pwa_emissive.mesh</code></td></tr></tbody></table>

#### male body gender

<table><thead><tr><th width="200">mesh</th><th>path in files</th></tr></thead><tbody><tr><td>suit</td><td><code>manavortex\torso\netrunning_suit\meshes\pma_netrunning_suit.mesh</code></td></tr><tr><td>emissive</td><td><code>manavortex\torso\netrunning_suit\meshes\pma_emissive.mesh</code></td></tr></tbody></table>

Simply add both files to your project, then hit up the [r-and-r-refitting-step-by-step.md](r-and-r-refitting-step-by-step.md "mention") section to get them fixed.

## OK, what now?

Depending on which files you added, you now proceed to the next guide:&#x20;

[r-and-r-colour-editing.md](r-and-r-colour-editing.md "mention") / [r-and-r-emissive.md](r-and-r-emissive.md "mention")

[r-and-r-refitting-step-by-step.md](r-and-r-refitting-step-by-step.md "mention")

<figure><img src="../../../../.gitbook/assets/meme_cat_onward.png" alt=""><figcaption><p>Source: Steve Gorton and Tim Ridley, Alexander Hafemann/Getty Images</p></figcaption></figure>
