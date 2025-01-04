---
description: How to update pose packs for Patch 2.2. and ArchiveXL 1.19
---

# Updating Photomode Pose Packs for 2.2

## Summary <a href="#summary" id="summary"></a>

**Published**: January 3 **by @nutboy**\
**Last documented update:** January 4 2025 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page is for both modders AND mod users who made or installed pose packs before patch 2.2 released, and want pose packs to be compatible with:

* new vanilla Photomode NPC
* modded Photomode NPV added with ArchiveXL

Luckily you only need to edit the `.yaml` and the `.xl` file!&#x20;

You can use [python scripts](updating-photomode-pose-packs-for-2.2.md#by-python-script) to update all pose packs in your mod folders, or update each pose pack [by hand](updating-photomode-pose-packs-for-2.2.md#by-hand).

## By python script

{% hint style="danger" %}
MAKE A BACKUP OF YOUR MOD FILES.&#x20;

Create a folder on your desktop (or anywhere that isn't your Cyberpunk2077 folder) with a copy of all the .xl files in your `archive/pc/mods` folder, and also make a copy of your `r6/tweaks` folder before proceeding.

Tip: The quick and dirty way I do this is by selecting the files or folder I want to make a backup of, and then right clicking and sending it to a zip file. \
If I mess up, I unzip the backup file and overwrite the files in my mod folders.&#x20;
{% endhint %}

1. **Download** these two Python Scripts from GitHub using the download button ⬇ on the far right. \
   Save them somewhere in your computer. (I have a dedicated folder for Python scripts now)&#x20;
   1. [**Convert Photomode XL files**](https://github.com/nut-boy/CyberpunkScripts/blob/main/convert_xl_for_photomodeNPV.py)
   2. [**Convert Photomode YAML files**](https://github.com/nut-boy/CyberpunkScripts/blob/main/convert_yaml_for_photomodeNPV.py)

{% hint style="warning" %}
DO NOT RUN THE SCRIPTS MORE THAN ONCE ON YOUR MOD FOLDERS. \
This will add the scope and poses multiple times and potentially create issues. If you think you made a mistake, restore your yamls and your xls from your backup before following these steps again.
{% endhint %}

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

{% hint style="info" %}
**I**f you're a modder who makes pose packs, you can also use these scripts on your mod's packed folder (instead of your installed mods folder) to automate updating for patch 2.2 NPCs & ArchiveXL 1.19 Photomode NPVs.&#x20;

If you already updated your mod for 2.2, please use the scripts on a version of your mod made for 2.13 so it doesn't create duplicates. Read on below for more info.
{% endhint %}

## By hand

### Update the .xl file

{% hint style="success" %}
If your XL already includes the new photomode NPC entities, delete those entries and add the scope only.
{% endhint %}

1. If your file already has entries for the new photo mode poses, **delete** them
2. Now, go to [.](./ "mention") -> [#the-.xl-file](./#the-.xl-file "mention"), and follow the steps there.

### Update the .yaml

If you don't have any of those sections (because your poses are only for one body gender), you can skip that part of the process.

#### 1. Create a yaml anchor

Find the line `photo_mode.character.femalePoses:`  and change it:

```yaml
#before
photo_mode.character.femalePoses:
#after
photo_mode.character.femalePoses: &AddPosesF
```

Find the line `photo_mode.character.malePoses:`  and change it:

```yaml
#before
photo_mode.character.malePoses:
#after
photo_mode.character.femalePoses: &AddPosesM
```

#### **2. Update NPC poses**

1. If your file already has entries for the new photo mode poses, **delete** them
2. Now, go to [.](./ "mention") -> [#the-.yaml-file](./#the-.yaml-file "mention") -> [#id-3.-telling-photo-mode-about-the-poses](./#id-3.-telling-photo-mode-about-the-poses "mention"), and follow the steps there.

{% hint style="success" %}
You're done! **You can now use your pose pack with Photomode NPCs & AXL Photomode NPV.**&#x20;
{% endhint %}
