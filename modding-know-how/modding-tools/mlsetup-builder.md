---
description: Editing item materials
---

# MLSETUP Builder

## Introduction

**MlsetupBuilder** is a Cyberpunk 2077 modding tool used to edit and build .json versions of .mlsetup files, allowing easy access to data used to edit different, and special styles for the game models, with 3d viewport to display where the materials are to applied to each part of the model.

<figure><img src="../../.gitbook/assets/MLSB UI.png" alt=""><figcaption></figcaption></figure>

## Download

MLSB can be downloaded from the releases section on GitHub, the latest release this documentation refers to is the version 1.6.5

{% embed url="https://github.com/Neurolinked/MlsetupBuilder/releases/" %}

## Setup of export and preview function

{% hint style="info" %}
MLSB lets you edit mlsetup files without doing this, but you'll have neither auto-generated mlsetup files, nor previews and material previews.
{% endhint %}

Required: [WolvenKit CLI](https://github.com/WolvenKit/WolvenKit/releases) (not identical to normal WolvenKit)

Open the preferences via "File" -> "Preferences".&#x20;

For wolvenkit-CLI executable, put the path to your `WolvenKit.CLI.exe` (version >=1.5.2)

{% hint style="info" %}
Starting with version 1.6.5, this enables the auto-export function, where MLSB will generate an \*.mlsetup file when you save an \*.mlsetup.json
{% endhint %}

### Library and preview

{% hint style="info" %}
To take advantage of the **Preview** function, you need a folder with the meshes in \*.glb and the materials and mask layers. This takes about 20GB of disk space
{% endhint %}

Open the menu "Build" and select first "Repository" to uncook the archives:

<figure><img src="../../.gitbook/assets/image (3).png" alt=""><figcaption></figcaption></figure>

&#x20;For editing material, "Appearance" and "Decal materials" are most relevant, maybe "gamedata" as well.

<figure><img src="../../.gitbook/assets/image (1) (2).png" alt=""><figcaption></figcaption></figure>

{% hint style="danger" %}
This can take several hours!
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
