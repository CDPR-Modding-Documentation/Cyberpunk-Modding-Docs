---
description: >-
  Shows mod users and mod creators how to update their pose packs for NPCs added
  in Patch 2.2 and NPV added with AXL 1.19
---

# How to Update Pose Packs for Photomode NPC/NPV

## Summary <a href="#summary" id="summary"></a>

**Published**: January 3 **by @nutboy**\
**Last documented update:** January 3 2025 **by @nutboy**

This page is for both modders AND mod users who made or installed pose packs before patch 2.2 released, and want pose packs to be compatible with:

* new vanilla Photomode NPC
* modded Photomode NPV added with ArchiveXL

Luckily you only need to edit the `.yaml` and the `.xl` file!&#x20;

Use **scripts** to update every single pose pack in your mod folders, or update each pose pack **manually**.&#x20;

{% hint style="danger" %}
MAKE A BACKUP OF YOUR MOD FILES.&#x20;

Create a folder on your desktop (or anywhere that isn't your Cyberpunk2077 folder) with a copy of all the .xl files in your `archive/pc/mods` folder, and also make a copy of your `r6/tweaks` folder before proceeding.

Tip: The quick and dirty way I do this is by selecting the files or folder I want to make a backup of, and then right clicking and sending it to a zip file. \
If I mess up, I unzip the backup file and overwrite the files in my mod folders.&#x20;
{% endhint %}

## How to update all installed pose packs with Python scripts:

{% hint style="warning" %}
DO NOT RUN THE SCRIPTS MORE THAN ONCE ON YOUR MOD FOLDERS. \
This will add the scope and poses multiple times and potentially create issues. If you think you made a mistake, restore your yamls and your xls from your backup before following these steps again.
{% endhint %}

1. **Download** these two Python Scripts from GitHub using the download button ⬇ on the far right. \
   Save them somewhere in your computer. (I have a dedicated folder for Python scripts now)&#x20;
   1. [**Convert Photomode XL files**](https://github.com/nut-boy/CyberpunkScripts/blob/main/convert_xl_for_photomodeNPV.py)
   2. [**Convert Photomode YAML files**](https://github.com/nut-boy/CyberpunkScripts/blob/main/convert_yaml_for_photomodeNPV.py)
2. [Follow the wiki guide for running Python scripts if this is your first time.](../../../../for-mod-creators/modding-guides/everything-else/running-python-scripts.md) Setup is fast and easy.
3. **First we'll process the .xl files.** \
   Open the folder containing your Python scripts in one window, and your `archive/pc/mods` folder in another window.
4. In the Python scripts window, type `cmd` into the address bar and press enter. \
   Command prompt will open. \
   Type or paste `python convert_xl_for_photomodeNPV.py` and press enter again.
5. It will prompt you for the path to your mods folder. \
   Tab to your `archive/pc/mods` window and copy the ENTIRE path from the address bar (double click it to highlight) including `C:` or the drive letter.&#x20;
6. Paste the path into the command prompt window, press enter. \
   It will process all your .xl files and add the necessary scope to them. .xls are done!
7. Next, we'll process the .yaml files. In the window currently open to `archive/pc/mods`, navigate to your `r6/tweaks` folder instead.&#x20;
8. Go back to Command Prompt. \
   Since this next file is processing .yamls, we need to give Python a yaml addon. \
   Type or paste `pip install pyyaml` into command prompt and press enter.  \
   It will confirm the install.
9. Next, type or paste `python convert_yaml_for_photomodeNPV.py` and press enter to run the script.&#x20;
10. When prompted, go back to your `r6/tweaks` folder. \
    Copy the the ENTIRE path from the address bar (double click it to highlight), including `C:` or the drive letter.&#x20;
11. Paste it into the command prompt window, press enter.
12. It will process all your .yaml files and add the necessary characters to them. Your .yamls are done!&#x20;
13. Open your game, look for any broken pose packs. If they don't work correctly in new Photomode even after using the scripts, it's likely there was an issue in the formatting of the original mod file. You can check over the pose pack's yaml/xl for errors yourself (if you feel comfortable doing this) or ask the modder to revise it.&#x20;

{% hint style="warning" %}
**I**f you're a modder who makes pose packs, you can also use these scripts on your mod's packed folder (instead of your installed mods folder) to automate updating for patch 2.2 NPCs & ArchiveXL 1.19 Photomode NPVs.&#x20;

If you already updated your mod for 2.2, please use the scripts on a version of your mod made for 2.13 so it doesn't create duplicates. Read on below for more info.
{% endhint %}

## How to update individual pose packs manually:

**First, update the .XL file:**

<details>

<summary>How it works</summary>

With ArchiveXL 1.19, we are using a **scope** rather than an actual entity "file" to assign poses. The photomode [scope](../../../../for-mod-creators-theory/core-mods-explained/archivexl/archivexl-resource-patching.md) contains multiple `.ent` files, including the **player's ent as well as all the new Photomode NPCs' ents.**&#x20;

You can see the full [list of ents contained in the Photomode scope on the ArchiveXL Github.](https://github.com/psiberx/cp2077-archive-xl/blob/main/archive/source/resources/PhotoModeScope.xl)

When creating an NPV for Photomode using AXL, you also register their new Photomode `.ent` to the corresponding scope for their body gender in their .xl file.&#x20;

ArchiveXL automatically merges their .ent into the scope list when you open your game.&#x20;

This eliminates the need to list NPV entities separately in the XL file!&#x20;

</details>

1. Keep the existing entities in your .xl for backwards compatibility with pre-2.2 game versions and Nibbles replacer.

{% hint style="warning" %}
If you're a modder who already updated your XL to add all the new photomode NPC entities, delete those entries and add the scope only.
{% endhint %}

1. Add a new line under `animations:` and use the following format to register your `.anims` files:

<pre><code>animations:
  # female body gender - scope includes player + all NPCs + AXL photomode NPV
<strong>  - entity: photomode_wa.ent
</strong>    set: your_pwa.anims  

  # male body gender - scope includes player + all NPCs + AXL photomode NPV
  - entity: photomode_ma.ent
    set: your_pma.anims

  # male big body gender - scope includes all male big NPCs + male big AXL photomode NPV
  - entity: photomode_mb.ent
    set: your_pma.anims

  # male massive body gender - scope includes Adam Smasher + male massive AXL photomode NPV
  - entity: photomode_mm.ent
    set: your_pma.anims
   
<strong>  # nibbles - this is for the cat, not the replacer!
</strong>  - entity: photomode_cat.ent
    set: your_cat.anims
</code></pre>

Do not just copy and paste this entire  directly. You need to fill out your `set:` sections with the paths to the appropriate `.anims` files. See the [.xl file section of this tutorial for more info](how-to-update-pose-packs-for-photomode-npc-npv.md#the-.xl-file) on how to do this.

3. **Save your .xl file.** The .xl is now updated to support vanilla Photomode NPC and Photomode NPV!

{% hint style="danger" %}
Adding a scope to your pose pack .xl  is **required** for Photomode NPV to use modded poses. \
\
If you do not use this scope in your pose pack .xl, and instead list each 2.2 NPC entity separately, NPVs added to Photomode with ArchiveXL will **not** be able to use your poses.\
\
If you already added NPC entities to your pose pack for 2.2, just add the scope as well.
{% endhint %}

**Next, we update the .yaml:**&#x20;

1. **For female body poses:** \
   **C**hange `photo_mode.character.malePoses:` to include `&AddPosesF`\
   The new line should read: `photo_mode.character.femalePoses: &AddPosesF`\
   \
   **For male body poses:** \
   Change `photo_mode.character.malePoses:` to include `&AddPosesM`\
   The new line should read: `photo_mode.character.malePoses: &AddPosesM` \
   &#x20;
2.  **For female body poses:** \
    Copy and paste everything from the below template into your yaml.&#x20;

    ```


    photo_mode.character.altPoses: *AddPosesF
    photo_mode.character.bluemoonPoses: *AddPosesF
    photo_mode.character.evelynPoses: *AddPosesF
    photo_mode.character.hanakoPoses: *AddPosesF
    photo_mode.character.judyPoses: *AddPosesF
    photo_mode.character.lizzyPoses: *AddPosesF
    photo_mode.character.meredithPoses: *AddPosesF
    photo_mode.character.panamPoses: *AddPosesF
    photo_mode.character.purpleforcePoses: *AddPosesF
    photo_mode.character.redmenacePoses: *AddPosesF
    photo_mode.character.rogueoldPoses: *AddPosesF
    photo_mode.character.rogueyoungPoses: *AddPosesF
    photo_mode.character.songbirdPoses: *AddPosesF
    photo_mode.character.myersPoses: *AddPosesF
    ```

    \
    **For male body poses:** \
    Copy and paste everything from the below template into your yaml.

    ```


    photo_mode.character.adamPoses: *AddPosesM
    photo_mode.character.altjohnnyPoses: *AddPosesM
    photo_mode.character.johnnyPoses: *AddPosesM
    photo_mode.character.goroPoses: *AddPosesM
    photo_mode.character.jackiePoses: *AddPosesM
    photo_mode.character.kerryPoses: *AddPosesM
    photo_mode.character.riverPoses: *AddPosesM
    photo_mode.character.viktorPoses: *AddPosesM
    photo_mode.character.kurtPoses: *AddPosesM
    photo_mode.character.reedPoses: *AddPosesM
    ```
3. **Save your yaml.** You can copy and paste everything into an online YAML validator such as [Yamllint](https://www.yamllint.com/) to check your work.\
   \
   You're done! **You can now use your pose pack with Photomode NPCs & AXL Photomode NPV.**&#x20;
