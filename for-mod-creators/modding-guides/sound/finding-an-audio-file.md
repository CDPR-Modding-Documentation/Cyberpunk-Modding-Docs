# Finding an audio file

This guide explains how to use website called [Cyberpunk 2077 SFX Explorer](https://cp-sfx.zhincore.eu). It is an open source tool made by @zhincore on Discord.

## Finding a sound effect

In the sound [effects section of the website](https://cp-sfx.zhincore.eu/sfx) you can search for sounds using the filtering options or by events, tags or sound hash. Once you find what you're searching for, open the detail window by clicking on the list item, there you can find where the files is located.

For `.opuspak` sounds you need to use a took like [SoundFX Search and Replace](https://www.nexusmods.com/cyberpunk2077/mods/11075) to extract/replace it. Use the sound's hash to find it.

For sounds in a "Separate .wem file", you can usually find the file in WolvenKit Asset Browser, again, by the sound's hash.

If the sound is marked a virtual or nonexistent, you're out of luck for now and must find other way. Perhaps your wanted sound is a voice-over and you can find it using the following section.

## Finding a voice-over

The [voice-over and subtitles](https://cp-sfx.zhincore.eu/subtitles) sections allows you to search for the game's voice-overs using it's subtitles, quest ID or other filtering options. Again, once you find what you need, click on it to open the detail window.&#x20;

Usually you want the path to the voice-over audio, if no audio was found, it probably doesn't exist in the game (otherwise ping @zhincore that it's missing). If it was found, it might've been found in various forms, for male vs. female V and in normal, holocall or helmet variant. Choose the one you want and click on it's path to copy it. This will give you the exact path that you can paste into WolvenKit to find that file. If you want different localization than en-us, change it in the path (e.g. to `fr-fr`).

If you want the subtitles itself, if it was found, click on the "Subtitles found in" path to copy it, you can find it in WolveKit using the path and using the String ID you can find the specific subtitles.
