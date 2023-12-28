---
description: How to get mods working on SteamDeck or other Linux distros
---

# Modding on Linux



{% hint style="info" %}
Find a guide how to optimize Cyberpunk 2077 settings for SteamDeck on [/r/SteamDeck](https://www.reddit.com/r/SteamDeck/)
{% endhint %}

## Summary

This page tells you how to set the launch options for Steam under Linux. If you have trouble after an update and have exhausted [all the usual steps](../user-guide-troubleshooting/users-troubleshooting-after-a-game-update.md), make sure to double-check them — sometimes, Steam helpfully deletes them for you to make sure that your game crashes on startup. For GoG or Epic Games Store, the steps are the same, but the location to set the launch options are different.

## TL;DR

You need to&#x20;

* Install `d3dcompiler_47`
* Install `vcrun2022`
* Adjust the Steam launch option to be:\
  `WINEDLLOVERRIDES="winmm,version=n,b" %command%`

If you can't get it to work, follow the steps below to apply the launch options via Protontricks, or search the `#red4ext-support` channel on the [modding discord](https://discord.gg/redmodding) to find out what else you can do.

## Setting Up Protontricks

{% hint style="warning" %}
Make sure that you are on the most recent version of Protontricks. This guide will follow how to perform these steps on a SteamDeck, but other KDE-based distros should be similar. Other Linux distros will need to go to their respective app stores to download Protontricks.
{% endhint %}

{% hint style="info" %}
If you don't want to read text, find a video documenting the process [here](https://youtu.be/CYKCOBaZpBU?t=110). Thanks to Connor for providing the screenshots and transcription!
{% endhint %}

To configure the necessary parameters, you can use the app Protontricks, which you can download through the built-in app browser "Discover":&#x20;

<figure><img src="../../.gitbook/assets/linux_modding_proton_1.png" alt=""><figcaption><p>Protontricks as Shown in Discover</p></figcaption></figure>

2. Open Protontricks (you can search for this by selecting start menu)

<figure><img src="../../.gitbook/assets/linux_modding_protontricks_2.png" alt=""><figcaption><p>Opening Protontricks</p></figcaption></figure>

3. When Protontrick opens, select Cyberpunk:

<figure><img src="../../.gitbook/assets/linux_modding_3.png" alt=""><figcaption><p>Finding Cyberpunk 2077 in Protontricks</p></figcaption></figure>

4. Choose "Select the default wineprefix":

<figure><img src="../../.gitbook/assets/linux_modding_4.png" alt=""><figcaption></figcaption></figure>

5. Add an override: Check **both** of the checkboxes below

<figure><img src="../../.gitbook/assets/protontricks_dll_1.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/protontricks_dll_2.png" alt=""><figcaption><p>Selecting <code>d3dcompiler_47</code></p></figcaption></figure>

<figure><img src="../../.gitbook/assets/protontricks_dll_3.png" alt=""><figcaption><p>Selecting <code>vcrun2022</code></p></figcaption></figure>

{% hint style="info" %}
If you do not see `vcrun2022` please verify you're on the latest version of Protontricks
{% endhint %}

Apply via "OK". You may receive an error below or similar. If you do, click "Yes" to continue the installation.

<figure><img src="../../.gitbook/assets/vc_run.png" alt=""><figcaption><p>Example Installation Warning</p></figcaption></figure>

## Launch Options

Switch to steam and make sure that the launch options are set as below:\
`WINEDLLOVERRIDES="winmm,version=n,b" %command%`

<figure><img src="../../.gitbook/assets/linux_modding_8.png" alt=""><figcaption><p>Setting Launch Options in Steam</p></figcaption></figure>

If this still doesn't work, check the [Cyber Engine Tweaks wiki](https://app.gitbook.com/s/-MP5jWcLZLbbbzO-\_ua1-887967055/getting-started/installing) for additional instructions, or find us on [Discord](https://discord.gg/redmodding) in `#mod-troubleshooting`.
