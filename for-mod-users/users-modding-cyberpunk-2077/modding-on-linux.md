---
description: How to get mods working on a SteamDeck
---

# Modding on Linux



{% hint style="info" %}
Find a guide how to optimize CP for SteamDeck on [r/SteamDeck](https://www.reddit.com/r/SteamDeck/s/d6qimkY7lL)
{% endhint %}

## Summary

This page tells you how to set the launch options for Steam under Linux. If you have trouble after an update and have exhausted [all the usual steps](../user-guide-troubleshooting/users-troubleshooting-after-a-game-update.md), make sure to double-check them — sometimes, Steam helpfully deletes them for you to make sure that your game crashes on startup.

## TL;DR

You need to&#x20;

* install d3dcompiler\_47
* install vcrun2022
* Adjust the Steam launch option as specified in [#set-the-launch-options-by-hand](modding-on-linux.md#set-the-launch-options-by-hand "mention")

## Set the launch options by hand

Under Linux, you have to start the game by setting the following launch options for Cyberpunk:

```
WINEDLLOVERRIDES="winmm,version=n,b" %command% -modded
```

or the longer version with core frameworks (adjust as needed):

```
WINEDLLOVERRIDES="version.dll,winmm.dll,RED4ext.dll,ArchiveXL.dll,TweakXL.dll=n,b,Codeware.dll=n,b" %command% -modded
```

<figure><img src="../../.gitbook/assets/linux_modding_8.png" alt=""><figcaption></figcaption></figure>

If you can't get it to work, follow the steps below to apply the launch options via Protontricks, or search the #red4ext-support channel on the [modding discord](https://discord.gg/redmodding) for `winmm` to find out what else you can do.

## Setting the launch options via Protontricks

{% hint style="warning" %}
Make sure that you are on the most recent version of Protontricks.
{% endhint %}

{% hint style="info" %}
If you don't want to read text, find a video documenting the process [here](https://youtu.be/CYKCOBaZpBU?t=110). Thanks to Connor for providing the screenshots and transcription!
{% endhint %}

To configure the necessary parameters, you can use the app Protontricks, which you can download through the built-in app browser "Discover":&#x20;

<figure><img src="../../.gitbook/assets/linux_modding_proton_1.png" alt=""><figcaption></figcaption></figure>

2. Open Protontricks (you can search for this by selecting start menu)

<figure><img src="../../.gitbook/assets/linux_modding_protontricks_2.png" alt=""><figcaption></figcaption></figure>

3. When Protontrick opens, select Cyberpunk:

<figure><img src="../../.gitbook/assets/linux_modding_3.png" alt=""><figcaption></figcaption></figure>

4. Choose "Select the default wineprefix":

<figure><img src="../../.gitbook/assets/linux_modding_4.png" alt=""><figcaption></figcaption></figure>

5. Choose "run winecfg":

<figure><img src="../../.gitbook/assets/linux_modding_5.png" alt=""><figcaption></figcaption></figure>

6. Add an override: Check `either` of the blocks below

If you would rather do it via library, check the expandable block [below](modding-on-linux.md#via-library).

<figure><img src="../../.gitbook/assets/protontricks_dll_1.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/protontricks_dll_2.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/protontricks_dll_3.png" alt=""><figcaption></figcaption></figure>

<details>

<summary>via Library</summary>

\
Switch to the libraries tab and open the drop down menu

<img src="../../.gitbook/assets/linux_modding_6.png" alt="" data-size="original">

Select "version" and "Add"

<img src="../../.gitbook/assets/linux_modding_7.png" alt="" data-size="original">



Repeat the process for `d3dcompiler_47`



</details>

Apply via "OK". You're now done with Protontricks.

8. Switch to steam and make sure that the launch options are set.&#x20;

{% hint style="warning" %}
Please copy the most up-to-date command from the section[#set-the-launch-options-by-hand](modding-on-linux.md#set-the-launch-options-by-hand "mention"), then keep on reading here.
{% endhint %}

The result should be something like this (with the string that you copied from the start of the guide):\
`WINEDLLOVERRIDES="winmm.dll,version=n,b" %command%`

<figure><img src="../../.gitbook/assets/linux_modding_8.png" alt=""><figcaption></figcaption></figure>

If that didn't help you, check the [Cyber Engine Tweaks wiki](http://127.0.0.1:5000/s/-MP5jWcLZLbbbzO-\_ua1-887967055/getting-started/installing) for additional instructions, or find us on [Discord](https://discord.gg/redmodding) in `#mod-troubleshooting`.
