---
description: How to use MO2 - it's that simple
---

# MO2 (Mod Organizer 2)

MO2 (**Mod Organizer 2**, [Nexus](https://www.nexusmods.com/skyrimspecialedition/mods/6194?tab=files) | [github](https://github.com/ModOrganizer2/modorganizer/releases)) is a free mod manager widely used in modding Bethesda games like Skyrim or Fallout. It supports Cyberpunk and is easy to use.

Using MO2 leaves your base game directory untouched, and you can easily install and uninstall mods, update old mods or use profiles.

{% hint style="info" %}
Please ask on their [Discord server](https://discord.com/invite/ewUVAqyrQX) if you need help with MO2 beyond the scope of this guide.
{% endhint %}

### **Download and Install MO2**

* Install MO2 by downloading from  [Nexus](https://www.nexusmods.com/skyrimspecialedition/mods/6194?tab=files) (yes, Skyrim Nexus) or [github](https://github.com/ModOrganizer2/modorganizer/releases).
* Install MO2, selecting the **Global Instance** option (recommended). Choose **Portable Instance** if you want a separate MO2 installation for each game.

### **Setting Up the Game**

* After installing, launch MO2.
* Create a new game instance by browsing to the Cyberpunk 2077 installation folder.
* Configure profile settings (optional):
  * You can adjust these settings later, so it’s okay to leave them unchecked for now unless you need profile-specific settings.

### Installing CET and Red4Ext (the Script extenders)

{% hint style="warning" %}
CET and Red4Ext have to be either **installed manually or force loaded** (see below for details).
{% endhint %}

### **Installing Mods from Nexus**

* Go to the Nexus Mods website for Cyberpunk 2077 mods.
* Download mods via the "Mod Manager Download" button. MO2 will recognize these downloads.
* In MO2, open the **Downloads** tab and double-click the mod to install it.
* After installation, ensure the mod is enabled by checking it in the **Plugins** list or the **Installed Mods** section.

#### Adding Mods from Other Sources

* If you have mods from external sources:
  * Download the mod and move it to the **Downloads** folder by using the file folder dropdown in MO2 ("Open Downloads folder").
  * Alternatively, drag and drop the mod into the **Downloads** tab within MO2.

### **Launching the Game**

{% hint style="warning" %}
**You always have to launch the game through MO2 if you use MO2 as mod manager. Steam will still recognize your achievements!**
{% endhint %}

* After installing all desired mods, click **Run** in MO2 to launch Cyberpunk 2077.

### (Optional) Force-load CET and Red4Ext

1. Select Cyberpunk from your list of games
2. Click on `Edit` to open the `Modify Executables` window
3. Check the box next to `Force load libraries (*)`
4. Click on `Configure Libraries`
5. Add the following files:&#x20;
   1. `bin/x64/plugins/version.dll` (for Cyber Engine Tweaks)
   2. `bin/x64/winmm.dll` (for Red4Ext)

<div align="center">

<figure><img src="../../../.gitbook/assets/image (1) (1).png" alt=""><figcaption></figcaption></figure>

</div>

##

