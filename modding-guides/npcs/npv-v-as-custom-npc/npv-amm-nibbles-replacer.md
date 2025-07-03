---
description: How to add your NPV to Photomode's list of spawnable characters
---

# NPV: Photomode (formerly Nibbles Replacer)

## Summary <a href="#summary" id="summary"></a>

**Published**: Oct 30 2023 **by @manavortex**\
**Last documented update:** January 4 2025 **by @nutboy**

This page shows you how to **add your NPV to Photomode's spawnable character list.** It is part of the guide for creating an [.](./ "mention") .

### Wait, this is not what I want!

* If you want to update your custom pose packs to work with photo mode NPCs, check [archivexl-adding-photo-mode-poses](../../animations/animations/archivexl-adding-photo-mode-poses/ "mention")
* If you want to add more appearances to vanilla photomode NPCs, check [xBaebsae's tutorial](https://xbaebsae.jimdofree.com/cyberpunk-2077-guides/cp2077-expand-appearances-in-photomode-npcs/)
* If you are trying to make or edit a NPV Nibbles replacer, read on. Nibbles Replacer is no longer compatible as of patch 2.2, and this guide will show you how to make a new Photomode NPV.

## Nibbles Replacer and Photo Mode

{% hint style="info" %}
This is a history lesson. If you don't care, skip straight to [#how-to-create-a-photomode-npv](npv-amm-nibbles-replacer.md#how-to-create-a-photomode-npv "mention").

You don't need to install any of the mods mentioned below if you don't want to.
{% endhint %}

With 2.2, CDPR added up to three spawnable Photo Mode NPCs. Before that, you could only spawn **Nibbles the cat** — and modders took full advantage. The result was the [Nibbles Replacer](https://www.nexusmods.com/cyberpunk2077/mods/8125), a mod by xbaebsae.

### What did the Nibbles Replacer do?

By integrating the Photo Mode with [Appearance Menu Mod](https://www.nexusmods.com/cyberpunk2077/mods/790), modders tricked the game into believing that NPCs were valid alternate appearances for Nibbles the cat.

### What does the new photo mode do?

* Adds up to 250 new spawnable NPC to the character list (this number has yet to be tested)
* Spawn different kinds of NPVs without exiting Photomode and managing Nibbles "slots"
* Switch NPC appearances directly in photo mode
* NPC now can spawn props and weapons if a pose has them

***

## How to create a Photomode NPV

Requirements:

<table><thead><tr><th width="253.5"></th><th>minimum version</th></tr></thead><tbody><tr><td>Cyberpunk 2077</td><td>Game version 2.2</td></tr><tr><td><a href="https://www.nexusmods.com/cyberpunk2077/mods/4198?tab=files">ArchiveXL</a></td><td>1.19 or newer</td></tr><tr><td>Wolvenkit</td><td>Wolvenkit > 8.15.1, <a href="https://github.com/WolvenKit/WolvenKit-nightly-releases/releases">Nightly</a> published after Jan 25 2025</td></tr><tr><td>Optional: <a href="https://github.com/psiberx/cp2077-archive-xl/releases">PhotomodeEx</a></td><td>1.0</td></tr></tbody></table>

## Prerequisites:

* You have a custom NPC Wolvenkit project with an [.app file](../../../for-mod-creators-theory/files-and-what-they-do/appearance-.app-files) and a [root entity](../../../for-mod-creators-theory/files-and-what-they-do/file-formats/entity-.ent-files/#root-entity) file.\
  If you don't have one, you can download the template project from [.](./ "mention")
* You have configured your modder name in [Wolvenkit's settings](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/settings#your-name) (click the link if you haven't)

<details>

<summary>Optional: Adding your NPV's files to a new Wolvenkit project</summary>

If someone else made your NPV and you don't have the original Wolvenkit project, or you're scared of fucking up your existing NPV project, you can create a new Wolvenkit project and add the necessary files from your Mod Browser.

Here's how:

1. Open Wolvenkit and create a new project. Avoid using special characters such as ! or #
2. In your new project, open the Asset Browser. Toggle the Mod Browser button to on.
3. Scroll down to your installed NPV's mod folder.\
   \
   Note: Mod files are in alphabetical order of archive name, but split into two sections for capitalized archive names and lowercase archive names.

4) Open the NPV mod folder. Locate both the `.app` and the `.ent` file. Double click to add them to your project.\
   \
   Note: You may have an .app for a Nibbles replacer as well as your NPV's regular AMM app. Use the AMM app (not the Nibbles replacer app) if you want to keep your character's appearance names.

When you are done creating the photo mode files, you can delete the .app and .ent files you added. (Don't worry, the guide will show you a reminder)

After you are done creating the photomode files, you can combine the projects by merging their source folders in the Windows Explorer.

</details>

## Step 1: Create photo mode files

{% hint style="info" %}
If you made any mistakes, you can simply repeat the process. Either delete the files that you want to regenerate, or check the `Overwrite Existing File` box in the dialogue.
{% endhint %}

#### 1. Open your NPV's project in Wolvenkit

#### 2. Open the dialogue

Click on File > Add Files > Add Photomode Files.\
\&#xNAN;_If the command stays disabled, restart WolvenKit_

<figure><img src="../../../.gitbook/assets/4 (6).png" alt=""><figcaption></figcaption></figure>

#### 2. Fill out the dialogue

Wolvenkit will pre-fill everything based on your project name and your file names, but you can still customize the options. (Keep reading)

<figure><img src="../../../.gitbook/assets/3 (5).png" alt=""><figcaption><p>If you have more than one .app or .ent already in the project, you can select the correct one from the drop down.</p></figcaption></figure>

3. Double-check the **NPC name**, as Wolvenkit guesses it from your project and file names and you will see it every time you spawn your NPC in the photo mode picker. Remove any special characters from the file names.
4. Make sure that the right `.app` and `.ent` file are selected (if multiple of those are in the project, Wolvenkit can't tell which you want)\
   \
   \&#xNAN;_Note: You may have an .app for a Nibbles replacer as well as your NPV's regular AMM app. Use the AMM app (not the Nibbles replacer app) if you want to keep your character's appearance names._ \\
5. Next to NPC Name, select the body type of the character you're adding from the drop down. (Selecting the wrong one _may_ lead to horrors.)
6. When you click "Finish", Wolvenkit will generate everything you need to spawn a photo mode NPC. You should now see something like this (Project browser's `source` tab):

<figure><img src="../../../.gitbook/assets/2 (4).png" alt=""><figcaption></figcaption></figure>

<details>

<summary>If you created an extra project just for photo mode:</summary>

**Do not** delete the new `_photomode.app` and `_photomode.ent`!

Delete the original `.app` and `.ent` file (they are a part of your NPV's mod, you don't need them in this mod as well).

<img src="../../../.gitbook/assets/1 (5).png" alt="" data-size="original">

</details>

{% hint style="success" %}
You are done creating your photo mode files! You can now head to [#step-2-install-your-photomode-npv](npv-amm-nibbles-replacer.md#step-2-install-your-photomode-npv "mention").

If you want to know more about the process, feel free to expand the boxes below.
{% endhint %}

<details>

<summary>Wolvenkit just did the following things for you:</summary>

Created `your_modder_name\photomode\npc_name_photomode` and added the following files:

* Create an icon: It added the `.inkatlas` and the `.xbm` texture it uses, and connected them (we'll customize it in [#step-3-add-a-custom-icon-for-your-character](npv-amm-nibbles-replacer.md#step-3-add-a-custom-icon-for-your-character "mention"))
* Create a photomode `.ent` file: It created a copy of your original `.ent` file, then configured it to use the [npc-animations.md](../../../for-mod-creators-theory/files-and-what-they-do/file-formats/animations-.anims/npc-animations.md "mention") required by photo mode
* Create a copy of your original `.app` file and registered it in the photomode `.ent`. In this file, your character's [facial-animations.md](../../../for-mod-creators-theory/files-and-what-they-do/file-formats/animations-.anims/facial-animations.md "mention") have been configured to be photo mode compatible (including [xBaebsae's Photomode expression pack](https://www.nexusmods.com/cyberpunk2077/mods/7912))
* Create a .json: For photo mode to know your NPC's name, it needs a translation file

Added the following control files under `resources`:

* `.archive.xl`: Tells ArchiveXL to load your `.json` file, and that your `.ent` file is a photo mode .ent that needs animation support
* `.yaml`: Tells ArchiveXL about the photo mode character you're adding, such as the

</details>

## Step 2: Install your Photomode NPV

It's time to test your Photomode NPV!

1. Click [install](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/menu/toolbar#install-and-launch) in Wolvenkit's toolbar and open your game.
2. Enter Photomode. In the characters tab, you should see a new icon at the very bottom (you might need to scroll) with blue text:

<figure><img src="../../../.gitbook/assets/17 (1) (1).png" alt=""><figcaption></figcaption></figure>

3. Click the icon and your character will appear!

## Step 3: Add a custom icon for your character

In this step, we'll change the blue `ICON` text to your very own texture.

{% hint style="info" %}
There is a detailed guide for [images-importing-editing-exporting.md](../../textures-and-luts/images-importing-editing-exporting.md "mention"), so this guide will only give you a quick overview.
{% endhint %}

1. In the [Export Tool](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/tools/tools-import-export#export-tool), check the box next to the `.xbm`
2. Click on `Export Selected`

<figure><img src="../../../.gitbook/assets/9 (4).png" alt=""><figcaption></figcaption></figure>

3. This will export a PNG to your `raw` folder:

<figure><img src="../../../.gitbook/assets/10 (4).png" alt=""><figcaption></figcaption></figure>

4. Open this PNG in Photoshop or an image editor of your choice and update it with an image of your character.

{% hint style="danger" %}
**Do not** change the size of the image width or height.
{% endhint %}

<details>

<summary>How to create a good icon</summary>

Check out these articles in the Wiki:\
\
[images-importing-editing-exporting.md](../../textures-and-luts/images-importing-editing-exporting.md "mention")\
[game-icons-the-inkatlas-file.md](../../../for-mod-creators-theory/files-and-what-they-do/file-formats/game-icons-the-inkatlas-file.md "mention")\
[custom-in-game-icons.md](../../custom-icons-and-ui/custom-in-game-icons.md "mention")

</details>

5. Save over the PNG in the raw folder. **Do not** change the file name.\
   You should be able to see a preview of the icon in Wolvenkit when selecting the .png:

<figure><img src="../../../.gitbook/assets/12 (3).png" alt=""><figcaption><p>Example icon of my NPV</p></figcaption></figure>

6. Use the [Import Tool](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/tools/tools-import-export#import-tool) to import your `.png` back into the `.xbm`. Set [**Texture Group**](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export/textures#texture-group) to `TEXG_Generic_UI`
7. Click import selected. It will overwrite the existing placeholder .xbm in your project files.
8. Select your `.inkAtlas` file or open it and check the `Part Mapping` tab to check if your new icon appears:

<figure><img src="../../../.gitbook/assets/15 (1) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/16 (1) (1).png" alt=""><figcaption></figcaption></figure>

9. Press install and check in game to see your new character icon!

<figure><img src="../../../.gitbook/assets/19 (1) (1).png" alt=""><figcaption></figcaption></figure>

***

## Optional: Giving your Photomode NPC Weapons for Poses

Some poses spawn props, and if the pose calls for a certain weapon type (melee, handgun, etc.), it will spawn a default weapon for your NPC. You can customize your NPC further by adding specific in-game weapons to their inventory to spawn instead.

Check "AcceptedWeaponConfig" in [poses-animations.md](../../../for-mod-creators-theory/references-lists-and-overviews/cheat-sheet-tweak-ids/poses-animations.md "mention") to see a list of the types of weapons that can spawn in poses.

Here's how to give your NPC weapons:

1. Open your NPC's .yaml
2. You should see a section like this:

```yaml
Character.your_characters_name_Photomode_Puppet
  $type: Character
  entityTemplatePath: your_characters_name.ent
  displayName: your_characters_name
  persistentName: PhotomodePuppet
  attachmentSlots: [ AttachmentSlots.WeaponRight, AttachmentSlots.WeaponLeft ]
```

Add a new line underneath it, and copy and paste this:

```yaml
  effectors:
    - !append
      $type: AddItemsEffector
      itemsToAdd:
        - item:
```

3. Find the record for the weapon(s) you'd like to add to your character's inventory. There are a few ways of doing this:
4. Check the [CET Console commands list](https://onedrive.live.com/view.aspx?resid=EF6891140DE637B3%21221903\&authkey=!AE_n4RTzwmVHwy8).\
   Find the weapon(s) you want (you can CTRL + F to search by name).\
   In the "Command" column you'll see a CET command that reads `Game.AddToInventory("Items.Item_Name")`, Copy the `Items.Item_Name` and paste it into your yaml after `- item`.\
   \
   It should now read:

```yaml
  effectors:
  - !append
    $type: AddItemsEffector
    itemsToAdd:
      - item: 
```

Alternatively, you can search "Items." in the Tweak Browser in Wolvenkit and find your weapons.

<figure><img src="../../../.gitbook/assets/image (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

5. If you want to give your NPC more than one weapon, copy and paste `- item:` to a new line for each weapon you want . Spaces are important, make sure it's in line with the item entry above it. Multiple items registered properly will look like this:

```yaml
  effectors:
  - !append
    $type: AddItemsEffector
    itemsToAdd:
      - item: Items.Item_Name
      - item: Items.Item_Name
      - item: Items.Item_Name
```

6. Save your yaml, check poses with weapons in game to see them.

## Troubleshooting

### My custom poses aren't working!

{% hint style="warning" %}
If you want to update your custom pose packs to work with photo mode NPCs, check [updating-photomode-pose-packs-for-2.2.md](../../animations/animations/archivexl-adding-photo-mode-poses/updating-photomode-pose-packs-for-2.2.md "mention")
{% endhint %}

### My NPV isn't showing up in Photomode!

* Make sure you have AMM's "Photomode Enhancements" turned off in the AMM settings

### My image texture is completely white!

Check [images-importing-editing-exporting.md](../../textures-and-luts/images-importing-editing-exporting.md "mention") -> [#importing-a-texture](../../textures-and-luts/images-importing-editing-exporting.md#importing-a-texture "mention")
