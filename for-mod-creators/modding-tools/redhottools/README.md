---
description: psiberx's RedHotTools - a powerful utility for better mod development
---

# RedHotTools

## Installation guide

You can download RedHotTools on [psiberx's github](https://github.com/psiberx/cp2077-red-hot-tools/releases):

<figure><img src="../../../.gitbook/assets/install_redhottools.png" alt=""><figcaption></figcaption></figure>

To install it, extract both downloaded files directly into your Cyberpunk 2077 game directory.

## What does it do?

Integrated with Cyber Engine Tweaks, Wolvenkit and VisualStudioCode, it offers the following features:

### Hot Reload

RHT can reload archives, scripts and tweaks for you at runtime without having to restart the game.

For documentation on how to do this, check [rht-hot-reload.md](rht-hot-reload.md "mention")

### Script checking

* See scripts validation and binding errors
* Prevent game from starting if scripts compilation fails

## Game object inspection

With the RHT overlay for Cyber Engine Tweaks, you can inspect game objects at runtime:

### Inspect

Here, you can inspect world nodes and their properties:

<figure><img src="https://cdn.discordapp.com/attachments/786226527360254014/1172328367899562004/rht-052-1.png?ex=655feadf&#x26;is=654d75df&#x26;hm=d68979b1a9c5e44354b69a5e2cddf021baac810d517feba0cce54a5272f4f176&#x26;" alt=""><figcaption></figcaption></figure>

### Scan

Here, you can scan for any nodes under the cursor:



<figure><img src="https://cdn.discordapp.com/attachments/786226527360254014/1172328368834891796/rht-052-3.png?ex=655feadf&#x26;is=654d75df&#x26;hm=06f9dea38eacec11fabc84590640ca6d523c7e1acbdde3b3d3d8401909fe64a0&#x26;" alt=""><figcaption></figcaption></figure>

### Lookup

Reverse search of world nodes and spawned entities



<figure><img src="https://cdn.discordapp.com/attachments/786226527360254014/1172328369162035250/rht-052-4.png?ex=655feae0&#x26;is=654d75e0&#x26;hm=0999916c58eb3825dc2165be42577413ce6853f744227d18ae235e9eeb1610ab&#x26;" alt=""><figcaption></figcaption></figure>

## Inspecting chunkmasks

RedHotTools lets you look up chunk masking of existing items at runtime.

{% hint style="info" %}
You can inspect chunkmasks of player or NPC equipment via AppearanceCreatorMod; check [submeshes-materials-and-chunks.md](../../files-and-what-they-do/3d-objects-.mesh-files/submeshes-materials-and-chunks.md "mention") -> [#acm](../../files-and-what-they-do/3d-objects-.mesh-files/submeshes-materials-and-chunks.md#acm "mention") for details.
{% endhint %}

### Components

For player or NPC clothing, you can use the Watch tab. Find the component in the corresponding puppet's component array:

<figure><img src="../../../.gitbook/assets/red_hot_tools_inspect_chunkmasks.png" alt=""><figcaption></figcaption></figure>

### Entities

TBD
