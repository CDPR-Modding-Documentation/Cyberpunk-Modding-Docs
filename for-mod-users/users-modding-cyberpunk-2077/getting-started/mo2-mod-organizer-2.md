---
description: How to use MO2 - it's that simple
---

# MO2 (Mod Organizer 2)

**Last documented update:** May 19 2025 by **MyNameIsSpirits**

MO2 (**Mod Organizer 2**, [Nexus](https://www.nexusmods.com/skyrimspecialedition/mods/6194?tab=files) | [Github](https://github.com/ModOrganizer2/modorganizer/releases)) is a free, widely-used mod manager, especially popular for Bethesda games like Skyrim or Fallout. It fully supports **Cyberpunk 2077** and is praised for its ease of use.

Using MO2 keeps your base game directory untouched and allows for easy mod installation, uninstallation, and updating. Additionally, you can create different profiles for mod configurations.

{% hint style="info" %}
If you need further help with MO2 beyond this guide, feel free to ask for assistance on their official [Discord server](https://discord.com/invite/ewUVAqyrQX).
{% endhint %}

## **Before we start...**

{% hint style="info" %}
**MO2 will not play nice with manually installed mods - remove them.**
{% endhint %}

MO2 keeps all of your mods in a separate location from Cyberpunk's base game directory: **however,** when you launch Cyberpunk through MO2, it will load mods from both MO2 **and** the game folders.

It's best to let MO2 handle all of your mods and leave the base game directory clean.

#### But I have so many mods to uninstall!

You don't need to go through your folders and manually delete all of your mods, nor should you reinstall the entire game. We have a handy [mod remover script](https://www.nexusmods.com/cyberpunk2077/mods/8597) (courtesy of our dear manavortex) that will automatically do it for you. After running it and validating your files, you will have a 100% clean installation of the game **and** a backup folder of the mods it removed, in case you change your mind about MO2 and want those mods back.

{% hint style="info" %}
I'll say it again: don't just reinstall the game. You'll be wasting your time. Use the mod remover.
{% endhint %}

### **Download and Install MO2**

1. Download MO2 from either [Nexus Mods](https://www.nexusmods.com/skyrimspecialedition/mods/6194) (yes, Skyrim Nexus) or [GitHub](https://github.com/Modorganizer2/modorganizer/releases)
2. Install MO2:
   * When installing, choose either the **Global Instance** option (recommended for multiple games)...
   * ...or choose **Portable Instance** if you want a separate installation of MO2 for each game.

{% hint style="danger" %}
**Do not install MO2 inside Cyberpunk's directory!** This has been confirmed to cause issues.
{% endhint %}

### **Setting Up the Game**

1. **Launch MO2.**
2. **Create a new instance**:
   * Browse to the Cyberpunk 2077 installation folder to create the new game instance.
3. **Customize your Profile Settings (Optional)**:
   * These can be left unchecked unless you need profile-specific INI files, save games, or automatic archive invalidation.
   * You can change these settings later as needed.

### Installing CET and Red4Ext (the script extenders)

{% hint style="warning" %}
You can either install these mods **manually**, or install Zash's plugin update (see [#plugin-installation-guide](mo2-mod-organizer-2.md#plugin-installation-guide "mention"))
{% endhint %}

#### Script extenders: Manual install

{% hint style="info" %}
If you would rather use the (experimental) plugin, read [#script-extenders-plugin-installation-guide](mo2-mod-organizer-2.md#script-extenders-plugin-installation-guide "mention")instead.
{% endhint %}

1. Download the mod from Nexus
2. Open the downloaded .zip file by double-clicking it
3. Drag and drop everything inside the folder directly into [the-cyberpunk-2077-game-directory](../the-cyberpunk-2077-game-directory/ "mention")
4. You're done

#### Script extenders: plugin installation guide

{% hint style="info" %}
If you would rather install the mods by hand, read [#script-extenders-manual-install](mo2-mod-organizer-2.md#script-extenders-manual-install "mention")instead.
{% endhint %}

There exists a plugin for MO2 that will allow you to install CET and RED4ext the same way as any other mod (i.e. not manually). This is nice if you prefer to keep all of your mods within MO2's mod list, but it is an optional process. If you don't care about having CET and RED4ext installed in MO2, then I would recommend you to install them manually as detailed above. Otherwise, read on.

I'm going to stress this as hard as I can: this plugin is not part of the main MO2 build and is therefore prone to bugs. I haven't had any issues with it so far, and I was able to guide someone who'd never even heard of MO2 previously, and they also have not experienced any issues.

**With that said,** there is always a possibility that something simply doesn't work as expected. If you're absolutely, totally, undoubtedly 100% sure that you followed the below steps correctly and it still doesn't work, I would advise you to visit the official MO2 Discord server linked at the top of this guide and seek help there.

<details>

<summary>Installing the plugin (must read!)</summary>

1. Head over to the [GitHub repository](https://github.com/ModOrganizer2/modorganizer-basic_games/blob/master/games/game_cyberpunk2077.py) and download the file `game_cyberpunk2077.py` by clicking on the top-right three-dot menu, and clicking "Download."
2. Place this file into `basic_games/games` which is located in the MO2 plugin folder. No need to go diving through all your folders to find it, you can find it easily:
   1.  Navigate to **Show Open Folders menu...** on the main MO2 screen.

       <figure><img src="../../../.gitbook/assets/image (620).png" alt=""><figcaption><p>Show Open Folders menu</p></figcaption></figure>
   2.  Click on **Open MO2 Plugins folder.**

       <figure><img src="../../../.gitbook/assets/image (619).png" alt=""><figcaption><p>Open MO2 Plugins</p></figcaption></figure>
   3. This will open the plugins folder in Windows Explorer. From here, go into the folder called `basic_games`, and then into `games`.
   4. This is where you'll drop the file you downloaded from GitHub. However, there will already be a file in here called `game_cyberpunk2077.py` which **you should back up in case something goes wrong** (simply copying it to your desktop will suffice, as long as you remember where you put it).
   5. After you've backed up the original file, now you can drop the file you downloaded from GitHub into this folder. Replace the original file if it asks you to (again, **back it up** first!).
3. At this point you have installed the plugin, but we're not done yet. Next you should install CET and RED4ext through MO2 (see [**Installing Mods from Nexus**](mo2-mod-organizer-2.md#installing-mods-from-nexus) below), replacing any previous installations of those mods if you had any.
4. Make sure your **Overwrite** folder is empty, backing up any files in there if you need.
   1. The **Overwrite** folder is where MO2 puts files generated by your mods while you're playing the game. For the sake of setting up our plugin, it's better to make sure it's empty to avoid potential file conflicts.
   2. The Overwrite is found at the very bottom of your installed mod list (not the Downloads tab). Double-click on **Overwrite** and delete everything in the window that pops up. If there's nothing in there, move onto the next step.
5.  Make sure Root Builder is disabled with the following steps.

    1.  Go to Settings.

        <figure><img src="../../../.gitbook/assets/image (621) (1).png" alt=""><figcaption><p>Settings</p></figcaption></figure>
    2. Head to the **Plugins** section.
    3. Search for **Root Builder** and make sure the **"Enabled"** checkbox is **not checked.** If Root Builder doesn't show up, that means you didn't have it installed in the first place. That's okay! You don't need to do anything more.

    <figure><img src="../../../.gitbook/assets/image (623) (1).png" alt=""><figcaption></figcaption></figure>
6. If you have CET and RED4ext installed manually, you should remove them from Cyberpunk's game folders. The easiest way to do this is via [mod remover](https://www.nexusmods.com/cyberpunk2077/mods/8597).
7. After you've done all of this, close and re-open MO2. If you've followed all of these steps correctly, you should receive a pop-up which you should say yes to.
8. Launch the game. If everything is done correctly, CET should open immediately and ask you to set a keybind. You've done it!

</details>

### **Installing Mods from Nexus** <a href="#installing-mods-from-nexus" id="installing-mods-from-nexus"></a>

1. Go to the [Nexus Mods](https://www.nexusmods.com/games/cyberpunk2077?modSort=new) website for Cyberpunk 2077 mods.
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
**When using MO2 as a mod manager, you always have to launch the game through MO2.**
{% endhint %}

1. **Always Launch the Game through MO2**:
   * If you're using MO2 as your mod manager, make sure to run Cyberpunk 2077 via MO2. Your mods will not be loaded otherwise.
   * Steam will still track your playtime and achievements.
2. **Run the Game**:
   * After setting up all your desired mods, click **Run** in MO2 to launch Cyberpunk 2077.

### Tips and Best Practices

* Stay up to date with the latest versions of both **MO2** and the mods for the best experience and compatibility.

## Troubleshooting

### Some mods aren't working!

* If you aren't using the updated plugin, make sure that CET and RED4ext are installed **manually** (check [#installing-cet-and-red4ext-the-script-extenders](mo2-mod-organizer-2.md#installing-cet-and-red4ext-the-script-extenders "mention"))
* If you **are** using the updated plugin and you're getting REDscript errors on startup, make sure you've restarted MO2 after updating the plugin.
* Make sure that your MO2 instance is **not** directly in the [the-cyberpunk-2077-game-directory](../the-cyberpunk-2077-game-directory/ "mention"). This has been confirmed to cause problems and is a non-optional step.
