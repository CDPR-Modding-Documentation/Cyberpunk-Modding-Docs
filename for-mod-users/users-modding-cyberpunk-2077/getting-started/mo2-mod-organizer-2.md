---
description: How to use MO2 - it's that simple
---

# MO2 (Mod Organizer 2)

MO2 (**Mod Organizer 2**, [Nexus](https://www.nexusmods.com/skyrimspecialedition/mods/6194?tab=files) | [github](https://github.com/ModOrganizer2/modorganizer/releases)) is a free mod manager widely used in modding Bethesda games like Skyrim or Fallout. It supports Cyberpunk and is easy to use.

Using MO2 leaves your base game directory untouched, and you can easily install and uninstall mods, update old mods or use profiles.

{% hint style="warning" %}
Please ask on their [Discord server](https://discord.com/invite/ewUVAqyrQX) if you need help with MO2 beyond the scope of this guide.
{% endhint %}

### Installing mods

* Install MO2 by downloading from  [Nexus](https://www.nexusmods.com/skyrimspecialedition/mods/6194?tab=files) (yes, Skyrim Nexus) or [github](https://github.com/ModOrganizer2/modorganizer/releases).

### Installing CET and Red4Ext

{% hint style="warning" %}
With MO2 >= 2.5.2, RootBuilder no longer supports CET or Red4Ext – force load them instead (see below).
{% endhint %}

The .dll files for CET and Red4Ext have to be **force loaded** or **installed manually**.

1. Select Cyberpunk from your list of games
2. Click on `Edit` to open the `Modify Executables` window
3. Check the box next to `Force load libraries (*)`
4. Click on `Configure Libraries`
5. Add the following files:&#x20;
   1. `bin/x64/plugins/version.dll` (for Cyber Engine Tweaks)
   2. `bin/x64/winmm.dll` (for Red4Ext)

<figure><img src="../../../.gitbook/assets/image (1).png" alt=""><figcaption></figcaption></figure>

## Install the rest of your mods

* Install the rest of the mods simply with the Nexus "install with manager" button
* Always launch the game through MO2

That's all.&#x20;

