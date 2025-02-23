---
description: Documentation on .quest* and .scene files
---

# Quests: .scene files

## Summary

**Last documented update**: January 26, 2025 by [Zhincore](https://app.gitbook.com/u/OsI9JXgCSSbt40hb327iBDif7Xv1 "mention")

This page will explain how **quests** and **scenes** work.

{% hint style="warning" %}
This page is INCOMPLETE! If you know more about quests, please [edit it](https://app.gitbook.com/invite/-MP5ijqI11FeeX7c8-N8/H70HZBOeUulIpkQnBLK7)!
{% endhint %}

## Node types

Scenes and quests contain various types of node, here is a list of what we know about them:

### Audio

#### QuestAudioNode

Allow the quest to play a sound event (can be found in [SoundDB](https://sounddb.redmodding.org/sfx)).

#### AudioMixNode

Controls various states defined in the `cooked_metadata.audio_metadata` file using _signals_ (or _signposts_ as named in WolvenKit).
