---
description: How to use MO2 - it's that simple
---

# MO2 (Mod Organizer 2)

MO2 (**Mod Organizer 2**, [Nexus](https://www.nexusmods.com/skyrimspecialedition/mods/6194?tab=files) | [Github](https://github.com/ModOrganizer2/modorganizer/releases)) is a free, widely-used mod manager, especially popular for Bethesda games like Skyrim or Fallout. It fully supports **Cyberpunk 2077** and is praised for its ease of use.

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

### Installing CET and Red4Ext (the script extenders)

{% hint style="warning" %}
CET and Red4Ext have to be **installed manually**
{% endhint %}

#### Manually Install CET and RED4ext

1. Download **Cyber Engine Tweaks (CET)** and **RED4ext** from Nexus Mods manually
2. Install them by extracting their files to the game folder.

<details>

<summary>But what about Root Builder?!</summary>

Both the developer of MO2 and the guy who wrote the Cyberpunk plugin do [not recommend](https://discord.com/channels/717692382849663036/788213273530335233/1300415018864742461) Root Builder. If it's working for you, feel free to keep using it, but this is **not** the advised option for new users.

</details>

### **Installing Mods from Nexus** <a href="#installing-mods-from-nexus" id="installing-mods-from-nexus"></a>

1. Go to the Nexus Mods website for Cyberpunk 2077 mods.
2. Download mods via the "Mod Manager Download" button. MO2 will start to automatically download the mod.
3. In MO2, open the **Downloads** tab and double-click the mod to install it.
4. After installation, ensure the mod is enabled by checking it in the **Plugins** list or the **Installed Mods** section.

### **Adding Mods from Other Sources**

If you have mods from external sources:

* Download the mod and move it to the **Downloads** folder by using the file folder dropdown in MO2 ("Open Downloads folder").
* Alternatively, drag and drop the mod into the **Downloads** tab within MO2.

***

### Launching the Game

{% hint style="warning" %}
**You always have to launch the game through MO2 if you use MO2 as mod manager.**
{% endhint %}

1. **Always Launch the Game through MO2**:
   * If you're using MO2 as your mod manager, make sure to run Cyberpunk 2077 via MO2.
   * Steam will still track your playtime and achievements.
2. **Run the Game**:
   * After setting up all your desired mods, click **Run** in MO2 to launch Cyberpunk 2077.

### Tips and Best Practices

* Stay up to date with the latest versions of both **MO2** and the mods for the best experience and compatibility.

## Troubleshooting

### Some mods aren't working!

* Make sure that CET and RED4ext are installed **manually** (check [#installing-cet-and-red4ext-the-script-extenders](mo2-mod-organizer-2.md#installing-cet-and-red4ext-the-script-extenders "mention"))
* Make sure that your MO2 instance is **not** directly in the [the-cyberpunk-2077-game-directory](../the-cyberpunk-2077-game-directory/ "mention"). This has been confirmed to cause problems and is a non-optional step.
