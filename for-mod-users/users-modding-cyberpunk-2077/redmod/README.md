---
description: https://www.cyberpunk.net/en/modding-support
---

# REDmod

## Summary

**Last documented edit:** Sep 08 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page will tell you the following things:

* [#what-is-redmod-and-what-does-it-do](./#what-is-redmod-and-what-does-it-do "mention")
* [#how-to-install-redmod](./#how-to-install-redmod "mention")

### Wait, that's not what I want!

* If you just want to turn it on, check [here](usage.md#activating-mods).
* If you're looking for the log, go to your [Cyberpunk 2077 game directory](../the-cyberpunk-2077-game-directory/) and find it under\
  `tools\redmod\bin\REDmodLog.txt`
* If you are a mod developer, check [redmod](../../../for-mod-creators-theory/modding-tools/redmod/ "mention")

{% hint style="info" %}
**I just want to know which to use!**

Unless the mod author says otherwise, do **not** use REDmod.
{% endhint %}

## What is REDmod, and what does it do?

{% hint style="success" %}
TL;DR: You trade a **longer initial startup** for **shorter loading screens**.&#x20;

But REDmods come **second** in [load order](../load-order.md). The easiest way to avoid these altogether is **not using REDmod**, which is why it never took off.&#x20;
{% endhint %}

REDmod is a **modding framework** with a set of command line **tools** to **precompile** mods before launch.&#x20;

**If you don't speak Netrunner:** \
During game launch, the modded content will be **added** to the game's regular file. Your in-game **loading screens** will be much **faster**.

### When do I need it?

{% hint style="info" %}
Unless the Nexus page **explicitly tells you** that it's REDmod only (or you are **making** a mod), assume that you don't.&#x20;
{% endhint %}

As of September 2024, the only thing we can't do without REDmod is **adding new sounds** (replacing existing sounds is fine). The [Audioware](https://www.nexusmods.com/cyberpunk2077/mods/12001) mod attempts to mitigate that.

## How to install REDmod

REDmod is shipped as free DLC with the game. You need to add it inside the platform store (GOG, Steam, Epic). You can click the link below, or find more detailed instructions further down on the page.

* [DLC Link on GOG](https://www.gog.com/game/cyberpunk\_2077\_redmod)
* [DLC Link on Steam](https://store.steampowered.com/app/2060310/Cyberpunk\_2077\_REDmod/)
* [DLC Link on Epic](https://store.epicgames.com/p/cyberpunk-2077)

{% hint style="warning" %}
If you're accessing Cyberpunk through Steam Family Sharing, you'll be unable to install REDMod (thanks, Steam!). In this case, you can ask the person who's family sharing with you for their `Tools` folder.
{% endhint %}

### GOG

<figure><img src="../../../.gitbook/assets/dlc_gog_store.png" alt=""><figcaption></figcaption></figure>

### Steam

<figure><img src="../../../.gitbook/assets/dlc_steam_store.png" alt=""><figcaption></figcaption></figure>

When REDmod is installed correctly you will find a new folder `tools/redmod` inside your game root directory, with subfolders: `bin`, `scripts`, `tweaks`.
