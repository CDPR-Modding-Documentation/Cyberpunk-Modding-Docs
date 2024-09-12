---
description: How to use MO2 - it's that simple
---

# MO2 (Mod Organizer 2)

{% hint style="warning" %}
With the release of <mark style="color:orange;">**Update 2.12**</mark> for **Cyberpunk 2077** and **Mod Organizer **<mark style="color:orange;">**2.5**</mark>, the installation process has been modified. To ensure everything works smoothly, please review the updated instructions below and adjust your installation procedures accordingly
{% endhint %}

MO2 (**Mod Organizer 2**, [Nexus](https://www.nexusmods.com/skyrimspecialedition/mods/6194?tab=files) | [Github](https://github.com/ModOrganizer2/modorganizer/releases)) is a free, widely-used mod manager, especially popular for Bethesda games like Skyrim or Fallout. It fully supports **Cyberpunk 2077** and is praised for its ease of use.&#x20;

Using MO2 keeps your base game directory untouched and allows for easy mod installation, uninstallation, and updating. Additionally, you can create different profiles for mod configurations.

{% hint style="info" %}
If you need further help with MO2 beyond this guide, feel free to ask for assistance on their official [Discord server](https://discord.com/invite/ewUVAqyrQX).
{% endhint %}

### **Download and Install MO2**

1. Download MO2 from either [Nexus Mods](https://www.nexusmods.com/skyrimspecialedition/mods/6194) (yes, Skyrim Nexus) or [GitHub](https://github.com/Modorganizer2/modorganizer/releases)
2. Install MO2
   * When installing, choose the **Global Instance** option (recommended for multiple games).
   * Or choose **Portable Instance** if you want a separate installation of MO2 for each game.

### **Setting Up the Game**

1. **Launch MO2**
2. **Create a new instance**:
   * Browse to the Cyberpunk 2077 installation folder to create the new game instance.
3. **Customize your Profile Settings (Optional)**:
   * These can be left unchecked unless you need profile-specific INI files, save games, or automatic archive invalidation.
   * You can change these settings later as needed.

### Installing CET and Red4Ext (the Script extenders)

{% hint style="warning" %}
CET and Red4Ext have to be either **installed manually or force loaded** (see picture below for details).
{% endhint %}

#### **Option A: Manually Install CET and RED4ext**

1. Download **Cyber Engine Tweaks (CET)** and **RED4ext** from Nexus Mods manually
2. Install them by extracting their files to the game folder.

#### Option B: Force-load **CET and RED4ext**

1. Download **Cyber Engine Tweaks (CET)** and **RED4ext** via the "Mod Manager Download" button and install as instructed below.
2. Download and install the [rootbuilder](https://kezyma.github.io/?p=rootbuilder#intall-col) plugin.
3. **In MO2, click "Modify Executables"**
   * Click on **Edit** to open the **Modify Executables** window.
   * Check the box next to **Force Load Libraries**.
   * Click **Configure Libraries** and add the following files:
     * `%MODS%/CyberEngineTweaks/root/bin/x64/plugins/version.dll` (for **Cyber Engine Tweaks**)
     * `%MODS%/RED4ext/root/bin/x64/winmm.dll` (for **RED4ext**)

***

### **Installing Mods from Nexus** <a href="#installing-mods-from-nexus" id="installing-mods-from-nexus"></a>

1. Go to the Nexus Mods website for Cyberpunk 2077 mods.
2. Download mods via the "Mod Manager Download" button. MO2 will start to automaticlly download the mod.
3. In MO2, open the **Downloads** tab and double-click the mod to install it.
4. After installation, ensure the mod is enabled by checking it in the **Plugins** list or the **Installed Mods** section.

### **Adding Mods from Other Sources**

If you have mods from external sources:

* Download the mod and move it to the **Downloads** folder by using the file folder dropdown in MO2 ("Open Downloads folder").
* Alternatively, drag and drop the mod into the **Downloads** tab within MO2.

***

### Launching the Game

{% hint style="warning" %}
**You always have to launch the game through MO2 if you use MO2 as mod manager.**&#x20;
{% endhint %}

1. **Always Launch the Game through MO2**:
   * If you're using MO2 as your mod manager, make sure to run Cyberpunk 2077 via MO2.
   * Steam will still track your playtime and achievements.
2. **Run the Game**:
   * After setting up all your desired mods, click **Run** in MO2 to launch Cyberpunk 2077.

### Screenshots

To force-load **CET** and **RED4ext** libraries directly through MO2:

<div align="center">

<figure><img src="../../../.gitbook/assets/image (1) (1).png" alt=""><figcaption><p>How to force load CET and Red4Ext on MO2</p></figcaption></figure>

</div>

### Tips and Best Practices

* Stay up to date with the latest versions of both **MO2** and the mods for the best experience and compatibility.

&#x20;

