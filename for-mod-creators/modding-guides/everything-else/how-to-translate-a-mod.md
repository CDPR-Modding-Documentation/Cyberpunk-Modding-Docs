---
description: >-
  [Knowledge of WolvenKit at BASIC level is required] Below we will explain how
  to translate any mod
coverY: 0
---

# How to translate a Mod

## Summary

Published: 19 Mar 2024 by [iwasniko](https://app.gitbook.com/u/2YqtOa5pIqh3hmxj7vpeWFgLCmr1 "mention")\
Last documented edit: 19 Mar 2024 by [iwasniko](https://app.gitbook.com/u/2YqtOa5pIqh3hmxj7vpeWFgLCmr1 "mention")

This guide will teach you how to translate a mod. It will cover the following processes:

* [#translating-audio-files](how-to-translate-a-mod.md#translating-audio-files "mention")
* [#translating-in-game-texts](how-to-translate-a-mod.md#translating-in-game-texts "mention")

There are mainly two ways to translate a mod. One is to use WolvenKit, GIT and GitHub. On the other hand, the author of the mod provides the files (an Excel sheet for example) where the sentences to be translated are written.&#x20;

### Prerequisites

You need a Wolvenkit Project with the relevant files from the original mod:&#x20;

* &#x20;`.wem` for audio translations
* &#x20;`.json` for text translations

For how to get there, see [analysing-other-mods](../analysing-other-mods/ "mention")

## Translating audio files

Most mods will be using in-game files for this. You'll run into one of two cases:

#### The files are linked

The mod is only "pointing" at the original game files, and they're loaded from the player's local copy and will be in whatever language they're running.&#x20;

{% hint style="warning" %}
TODO: Which file(s) defines those? If there is no original mod author and the mod links to in-game files, how can we [custompath](custompathing-assets.md) them?
{% endhint %}

If you want to translate them anyway, you need to **add the audio files** from your translated version to your Wolvenkit project and send them to the original mod's author.

#### The files are included

{% hint style="info" %}
You can listen to audio files by simply selecting them in the Wolvenkit Project Browser and using the built-in audio player. See [Audio files](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-cli/usage/video-and-audio-files-cli#audio-files "mention") on the Wolvenkit wiki for a screenshot.
{% endhint %}

Assuming that the original mod author did not rename the files, this makes it easier for you.

1. [search Wolvenkit](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files) with each file name
2. Add the file to your Wolvenkit project
3. Overwrite the original file

When you pack your mod now, it will use the translated files. If it doesn't, make sure to check your load order.

<details>

<summary>The files were all re-named, how do I find them?</summary>

You'l have no choice but to find the right file from hand in the sources, which means you have to [search Wolvenkit](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files) for the extension `.wem`.

To filter the files by quest, use [reference-quest-ids.md](../../references-lists-and-overviews/reference-quest-ids.md "mention") and filter the folder names by quest ID. If you don't know which quest a line belongs to, you might be lucky and find it per search (Hotkey: `Ctrl+F`) on the [Cyberpunk Transcript](https://arasakas-ronin.netlify.app/).

</details>

## Translating in-game texts

If you are lucky, you are translating this for someone else, and the person has given you an excel sheet. Otherwise, you need to edit the mod's `.json` files (see [#prerequisites](how-to-translate-a-mod.md#prerequisites "mention")).

{% hint style="info" %}
The JSON files are actually **encoded** – this means that you have to edit them in Wolvenkit, or [export them to JSON](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export/import-export-as-json#export-as-json). (Yo dawg, I hear you like exporting as JSON!)
{% endhint %}



## Publishing your changes

When you are done translating you can **contact the original mod author** to see if they want to include your changes into the main mod.&#x20;

If not, then you can pack your mod as a standalone addition and upload it independently. In this case, it is important to consider the [load-order.md](../../../for-mod-users/users-modding-cyberpunk-2077/load-order.md "mention"): your mod has to load _first._
