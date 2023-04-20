---
description: Editing item materials
---

# MLSETUP Builder

## Introduction

**MlsetupBuilder** is a Cyberpunk 2077 modding tool used to edit and build .json versions of .mlsetup files, allowing easy access to data used to edit different, and special styles for the game models, with 3d viewport to display where the materials are to applied to each part of the model.

<figure><img src="../../.gitbook/assets/MLSB UI.png" alt=""><figcaption></figcaption></figure>

## Download

MLSB can be downloaded from the releases section on GitHub, the latest release this documentation refers to is the version 1.6.6

{% embed url="https://github.com/Neurolinked/MlsetupBuilder/releases/" %}

## Setup of export and preview function

{% hint style="info" %}
MLSB lets you edit mlsetup files without doing this, but you'll have neither auto-generated mlsetup files, nor previews and material previews.
{% endhint %}

{% hint style="warning" %}
Before you do this, you should have extracted a [partial depot](https://wiki.redmodding.org/wolvenkit/guides/modding-community/eli5-getting-started/create-depot#steps-partial-depot).
{% endhint %}

{% hint style="danger" %}
This process requires [WolvenKit CLI](https://github.com/WolvenKit/WolvenKit/releases) (not identical to normal WolvenKit).\
ATTENTION: For MLSB versions <= 1.6.6, you need to use [WolvenKit.Console Version 1.5.2](https://github.com/WolvenKit/WolvenKit/releases/tag/8.4.3)
{% endhint %}

Open the preferences via "File" -> "Preferences".&#x20;

Set the following values:

|                      |                                                                                                                    |
| -------------------- | ------------------------------------------------------------------------------------------------------------------ |
| Game archives folder | C:\Your\Path\To\Cyberpunk 2077\archive\pc\content                                                                  |
| uncook folder        | You can find this folder in your WolvenKit's settings as "Depot Path"                                              |
| Wolvenkit Depot Path | You can find this folder in your WolvenKit's settings as "Depot Path"                                              |
| Wolvenkit-CLI.exe    | The executable file under the extracted [WolvenKit CLI](https://github.com/WolvenKit/WolvenKit/releases) directory |



{% hint style="danger" %}
`Uncook Folder` and **Wolvenkit Depot Path** have to be the same folder!

For MLSB versions <= 1.6.6, you need to use [WolvenKit.Console Version 1.5.2](https://github.com/WolvenKit/WolvenKit/releases/tag/8.4.3) and restart after changing the settings.
{% endhint %}

{% hint style="info" %}
Starting with version 1.6.5, adding the WKit.CLI enables the auto-export function, where MLSB will generate an \*.mlsetup file when you save an \*.mlsetup.json
{% endhint %}



### Library and preview

{% hint style="info" %}
To take advantage of the **Preview** function, you need a folder with the meshes in \*.glb and the materials and mask layers. This takes about 20GB of disk space
{% endhint %}

Open the menu "Build" and select first "Repository" to uncook the archives:

<figure><img src="../../.gitbook/assets/image (3) (1) (2).png" alt=""><figcaption></figcaption></figure>

&#x20;For editing material, "Appearance" and "Decal materials" are most relevant, maybe "gamedata" as well.

<figure><img src="../../.gitbook/assets/image (1) (2).png" alt=""><figcaption></figcaption></figure>

Click "**Uncook**". A file selector will open.&#x20;

Navigate to the same path you set under "Game archives folder", and press OK.

{% hint style="danger" %}
This process can take several hours!
{% endhint %}

After the process is complete, select "Microblends" to extract the microblends, normals, decals and layer masks.

\
There is also a dedicated thread on the [Cyberpunk 2077 Modding Discord Server](https://discord.com/channels/705931815109656596/939510887188947014) with the latest software updates.

## Video Guides

{% embed url="https://www.youtube.com/watch?v=uCOHjMPvpgc" %}
Credits to EzioMavericks for the video
{% endembed %}

{% embed url="https://www.youtube.com/watch?list=PLViyQUe4oow0l-amhDzneys9nzJxyH64n&v=vpT_crK5K1M" %}
[A playlist by the original author](https://www.youtube.com/playlist?list=PLViyQUe4oow0l-amhDzneys9nzJxyH64n)
{% endembed %}
