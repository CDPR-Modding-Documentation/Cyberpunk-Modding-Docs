---
description: Small guide on how to find the in-game sound you're searching for.
---

# Finding an audio file

## Summary

**Published:** ??? **by** Xotak\
**Overhauled:** June 8, 2024 **by** Zhincore

This guide explains how to use [CyberSoundDB](https://sounddb.redmodding.org), an open source web tool made by Zhincore (@zhincore on [the Discord](https://discord.gg/Epkq79kd96)).

### Wait, this is not what I want!

* if you'd rather convert sound effects into a useable format , go to [converting-.wem-to-.wav.md](converting-.wem-to-.wav.md "mention")

## Finding a sound effect or music

In the [sound effects section of the website](https://sounddb.redmodding.org/sfx) you can search for sounds by events, tags or sound hash or using the filtering options. Once you find what you're searching for, open the detail window by clicking on the list item, there you can find where the files is located.

Sounds inside `.opuspak` can be extracted using [WolvenKit's Export tool](replacing-sounds-effects.md#exporting-sfx).

Sounds in a "Separate .wem file" can be simply found in [WolvenKit Asset Browser](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/video-and-audio) by the sound's hash.

If the sound is marked a virtual or nonexistent, you're out of luck for now and must find other way. Perhaps your wanted sound is a voice-over and you can find it using the section described bellow.

## Finding a voice-over

The [voice-over and subtitles section](https://sounddb.redmodding.org/subtitles) allows you to search for the game's voice-overs using their subtitles, by quest ID or other filtering options. Again, once you find what you need, click on it to open the detail window.&#x20;

Usually you want the path to the voice-over audio, if no audio was found, it probably doesn't exist in the game (otherwise ping @zhincore that it's missing). If it was found, it might've been found in various forms, for male vs. female V and in normal, holocall or helmet variant. Choose the one you want and click on it's path to copy it. This will give you the exact path that you can paste into WolvenKit to find that file. If you want different localization than en-us, change it in the path (e.g. to `fr-fr`).

If you want the subtitles itself, if it was found, click on the "Subtitles found in" path to copy it, you can find the file in WolvenKit using the path and using the String ID you can find the specific line.
