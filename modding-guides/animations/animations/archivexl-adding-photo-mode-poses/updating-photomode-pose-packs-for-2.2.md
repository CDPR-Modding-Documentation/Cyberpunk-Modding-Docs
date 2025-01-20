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
2. If it's your first time, follow the wiki guide for [running Python scripts.](../../../../for-mod-creators/modding-guides/everything-else/running-python-scripts.md) Setup is fast and easy.



### Processing the .xl files

1. Open the folder containing your Python scripts in Windows Explorer
2. Type `cmd` into the address bar, and press enter. This will open a command window.
3. Type the following and press enter (you can autocomplete with the `Tab` key) :

```batch
python convert_xl_for_photomodeNPV.py
```

4. The script will now ask you for the path to your mods folder
   * Open [the-cyberpunk-2077-game-directory](../../../../for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory/ "mention") in a Windows Explorer window
   * Browse to `archive/pc/mods`
   * Copy the folder path. If you need help, check [#copying-the-folder-path](../../../../for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory/#copying-the-folder-path "mention")
5. Right-click into the command window to paste the path (or press `Ctrl+V`)
6. Hit Enter

The script will now process all of your .xl files, adding the necessary scopes. That was it!

### Processing the .yaml files

Next, we'll process the .yaml files.&#x20;

1. Go back to the command window from the previous section's step 1
2. Type or paste `pip install pyyaml` into command prompt and press enter.  \
   It will confirm the install.
3. Type the following and press enter (you can autocomplete with the `Tab` key):

```batch
python convert_yaml_for_photomodeNPV.py
```

4. The script will now ask you for the path to your mods folder
   1. Open [the-cyberpunk-2077-game-directory](../../../../for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory/ "mention") in a Windows Explorer window
   2. Browse to `r6/tweaks`
   3. Copy the folder path. If you need help, check [#copying-the-folder-path](../../../../for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory/#copying-the-folder-path "mention")
5. Right-click into the command window to paste the path (or press `Ctrl+V`)
6. Hit Enter

### Checking the results

Open your game and look for any broken pose packs.&#x20;

If they don't work correctly in new Photomode even after using the scripts, it's likely there was an issue in the formatting of the original mod file.&#x20;

You can check over the pose pack's yaml/xl for errors yourself (if you feel comfortable doing this), or ask the modder to revise it.&#x20;

{% hint style="info" %}
**I**f you're a modder who makes pose packs, you can also use these scripts on your mod's packed folder (instead of your installed mods folder) to automate updating for patch 2.2 NPCs & ArchiveXL 1.19 Photomode NPVs.&#x20;

If you already updated your mod for 2.2, you can run the scripts anyway, but they won't (shouldn't) do anything that isn't empty lines.
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
photo_mode.character.malePoses: &AddPosesM
```

#### **2. Update NPC poses**

1. If your file already has entries for the new photo mode poses, **delete** them
2. Now, add the photo mode poses for NPCs:

{% hint style="success" %}
You're done! **You can now use your pose pack with Photomode NPCs & AXL Photomode NPV.**&#x20;
{% endhint %}
