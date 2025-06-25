---
description: How to make your own custom ads
---

# Custom advertisements

#### Summary

**Published:** February 04 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented edit:** March 28 by [nremind](https://next.nexusmods.com/profile/nremind)

### Other guides on this

You can also check out [xlipstream's guide on Nexus](https://www.nexusmods.com/cyberpunk2077/mods/6756).

## Step 0: Create a Wolvenkit project

1. Create a [Wolvenkit project](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects#create-a-new-wolvenkit-mod-project) for your mod.
2. Download the Wolvenkit template project from [github](../../_example_mods_and_templates/world/advertising/ad_replacers_full__wolvenkit_source.zip). Download the zip file to your computer:

<figure><img src="../../.gitbook/assets/download_from_github.png" alt=""><figcaption></figcaption></figure>

3. The zip file you downloaded contains a folder named `source`. Extract it into the root directopry of your Wolvenkit project from step 1 so that it merges with the existing folder.

## Step 1: Edit the `.png` files

In your project's [raw folder](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/project-explorer#raw), you will find 200+ `.png` files — pretty much every ad in the game.

{% hint style="info" %}
That's probably a lot more files than you wanted, but the first version of this guide only has the all-in-one package. Maybe we'll split off additional templates later. For now, leave everything as it is because we'll delete the non-modified files in step 2.
{% endhint %}

Use your image editor of choice (or [photopea](https://www.photopea.com/)) to edit the files that you want to see in the game.

{% hint style="warning" %}
When editing textures, please keep in mind that you need to export transparency as an alpha mask. See [images-importing-editing-exporting.md](images-importing-editing-exporting.md "mention") for details.
{% endhint %}

## Step 2: Renaming and modifying files

{% hint style="info" %}
Start here if you have already made a advertisement replacer, and want to convert your mod into a extension.
{% endhint %}

At this point, you might be tempted to just import the files to overwrite the vanilla game textures. Wait! With only a few more steps, rather than creating a replacer, you can create your own advertisement that can be added to the game that does not interfere with other mods.

{% hint style="info" %}
Q: Why not just make a replacer?\
A: Replacers all target the same file to overwrite, creating conflicts with other mods. If instead of replacers, mod authors took a few extra steps to make their own advertisements, there would be more total advertisements available to show in the game. Who wouldn't want that?
{% endhint %}

First, establish a new name for your ad. The convention is to use the name of the ad you are editing (e.g. broseph), followed by your mod author name (e.g. nremind), followed by a 2 digit number (e.g. 01) all lower-case and seperated by underscores. So in this example, the full name would be broseph\_nremind\_01. This is important for ease of integration between mods, and allowing users to easily know who created the mod. Use this to replace all instances of broseph in all files and file names. In the case of `.inkatlas` files, you'll notice that some files are called "broseph\_atlas.inkatlas". Remember that you are replacing broseph, so the correct rename example for this file would be "broseph\_nremind\_01\_atlas.inkatlas"

Now that you know what to rename the files to, add the `.inkwidget` and `.inkatlas` files of the ad you wish to modify to your WolvenKit project. Right-click them and export to json. Open the json files in a text editor of your choice, and rename all instances of the ad name to your new ad name. For example, search and replace "broseph\_atlas.inkatlas" to "broseph\_nremind\_01\_atlas.inkatlas" in every instance in the file. Unless making your own `.inkanim` files, make sure not to search and replace any paths to this file. Rename the png files with the same naming convention.

Best practice is to move all your files to a new mod directory (the final destination for the compressed archive files aka resources should not be in base, which should be for vanilla game files/resources). Create a new folder in your WolvenKit project at path `raw\your_mod_name` with your preferred mod name. You can create subfolders for the ad you are modifying like `raw\your_mod_name\broseph`. When these raw files are compressed into `archive` file, the path will be `archive\your_mod_name\broseph`. It is important that this the same path as in your `.inkwidget` and `.inkatlas` files (make sure to update the `base\gameplay\gui\world\adverts` to `your_mod_name\` in these files, taking care to not update `inkanim` unless you want to change ad animations), and also must match the path in `gamedataAdvertisement_Record` in Step 3 below.

{% hint style="info" %}
It is not necessary to include your own `.inkanim` file. It's better to just link to the default one for the original ad, unless you are specifically making your own custom animation (moving the ad elements around differently, and changing the special animated effects). For more information on editing animations and widgets, refer to [this page](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/files-and-what-they-do/file-formats/inkwidgets-a-custom-interface#inkanims-apply-animations-to-widgets-in-inkwidgets).
{% endhint %}

## Step 3: Adding your new mod to the game advertisement controller

Now that you have created the new ad files, you need to tell the advertisement controller where it is. In this guide, we use TweakXL (by psiberx) to add the necessary records to TweakDB, the game's database.

We will start with creating the records needed for your new ad. Use WolvenKit's Tweak Browser (on the far right-hand side of the window) and search for the name of the ad that you are modifying. Usually, you will want to choose the "animated" version if available for your particular ad (e.g. "Adverts.Broseph\_Animated") so that it can be animated. Once you find it, right-click and "Add TweakXL Override", adding a .xl file to your project and giving you a starting point. Open the file and you will find a list of definitions that look familiar in the Tweak Browser in WolvenKit (e.g. Adverts.Broseph\_01\_4x3). These are `gamedataAdvertisementFormatDef_Record`. Find all of these definitions in WolvenKit's Tweak Browser, and do the same right-click -> "Add TweakXL Override" on each in the list. Add these to the `.xl` file under the main `gamedataAdvertisement_Record`. With your `.xl` file populated with the `gamedataAdvertisement_Record` and all of its associated `gamedataAdvertisementFormatDef_Record`, rename all of the ad names following the naming convention, EXCEPT for the `libraryName` in the `gamedataAdvertisementFormatDef_Record`s. The names of the file itself is not important except the file type of .xl at the end (these are actually yaml files read by TweakXL), but try to make the name obvious to users that these are related to your mod.

Before:

```
Adverts.kangtao_Animated:
  $type: gamedataAdvertisement_Record
  resource: your_mod_name\kangtao\kangtao_animated.inkwidget
  definitions:
    - Adverts.kangtao_4x3
    - Adverts.kangtao_16x9
    - Adverts.kangtao_3_3x1
    - Adverts.kangtao_21x9

Adverts.kangtao_4x3:
  $type: gamedataAdvertisementFormatDef_Record
  format: Format_4x3
  libraryName: kangtao_4x3

Adverts.kangtao_16x9:
  $type: gamedataAdvertisementFormatDef_Record
  format: Format_16x9
  libraryName: kangtao_16x9

Adverts.kangtao_3_3x1:
  $type: gamedataAdvertisementFormatDef_Record
  format: Format_3_3x1
  libraryName: kangtao_3_3x1

Adverts.kangtao_21x9:
  $type: gamedataAdvertisementFormatDef_Record
  format: Format_21x9
  libraryName: kangtao_21x9
```

After:

```
Adverts.kangtao_nremind_01_Animated:
  $type: gamedataAdvertisement_Record
  resource: your_mod_name\kangtao\kangtao_nremind_01_animated.inkwidget
  definitions:
    - Adverts.kangtao_nremind_01_4x3
    - Adverts.kangtao_nremind_01_16x9
    - Adverts.kangtao_nremind_01_3_3x1
    - Adverts.kangtao_nremind_01_21x9

Adverts.kangtao_nremind_01_4x3:
  $type: gamedataAdvertisementFormatDef_Record
  format: Format_4x3
  libraryName: kangtao_4x3

Adverts.kangtao_nremind_01_16x9:
  $type: gamedataAdvertisementFormatDef_Record
  format: Format_16x9
  libraryName: kangtao_16x9

Adverts.kangtao_nremind_01_3_3x1:
  $type: gamedataAdvertisementFormatDef_Record
  format: Format_3_3x1
  libraryName: kangtao_3_3x1

Adverts.kangtao_nremind_01_21x9:
  $type: gamedataAdvertisementFormatDef_Record
  format: Format_21x9
  libraryName: kangtao_21x9
```

Next, we will add your newly created records to the districts where you want your ad to randomly appear in. Create a blank districts `.xl` file in the same folder as the previous file. Name it whatever you want. Add the following, replacing the ad name with the name of your ad:

```
Adverts.AllAdvertisements.advertisements:
  - !prepend Adverts.kangtao_nremind_01_Animated

Adverts.ArasakaWF.advertisements:
  - !prepend Adverts.kangtao_nremind_01_Animated

Adverts.BadLand.advertisements:
  - !prepend Adverts.kangtao_nremind_01_Animated

Adverts.CharterHill.advertisements:
  - !prepend Adverts.kangtao_nremind_01_Animated

Adverts.CityCenter.advertisements:
  - !prepend Adverts.kangtao_nremind_01_Animated

Adverts.Glen.advertisements:
  - !prepend Adverts.kangtao_nremind_01_Animated

Adverts.JapanTownCold.advertisements:
  - !prepend Adverts.kangtao_nremind_01_Animated

Adverts.JapanTown.advertisements:
  - !prepend Adverts.kangtao_nremind_01_Animated

Adverts.Kabuki.advertisements:
  - !prepend Adverts.kangtao_nremind_01_Animated

Adverts.LittleChina.advertisements:
  - !prepend Adverts.kangtao_nremind_01_Animated

Adverts.NorthIndustrial.advertisements:
  - !prepend Adverts.kangtao_nremind_01_Animated

Adverts.NorthOak.advertisements:
  - !prepend Adverts.kangtao_nremind_01_Animated

Adverts.PacificaCV_WWE.advertisements:
  - !prepend Adverts.kangtao_nremind_01_Animated

Adverts.Rancho.advertisements:
  - !prepend Adverts.kangtao_nremind_01_Animated

Adverts.SantoDomingo.advertisements:
  - !prepend Adverts.kangtao_nremind_01_Animated

Adverts.VistaDelRay.advertisements:
  - !prepend Adverts.kangtao_nremind_01_Animated

Adverts.WellSpring.advertisements:
  - !prepend Adverts.kangtao_nremind_01_Animated

Adverts.Spaceport.advertisements:
  - !prepend Adverts.kangtao_nremind_01_Animated
```

This will add your ad to every district, but obviously you can choose not to include some districts where you don't want your ad to be shown. Now, the game knows about your records, and they are added to the game advert controller's district list.

After you are done editing, use the [Import Tool](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/tools/tools-import-export#import-tool) to import all the files. Right-click and convert the `.inkatlas` and `.inkwidget` files from json.

## Step 4: Delete those files you don't want

In your Wolvenkit project's [archive tab](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/project-explorer#archive), delete those files that you don't want to include in your mod. This step is important, because files can only changed by one mod at a time, and you don't want to piss in the public water supply by simply leaving them in.

When you have done the clean-up, you can now [install your mod](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/menu/toolbar#install-and-launch) and start the game to see your new ads in-game.

## Step 5: Publishing

If you want to post your mod on Nexus, you might want to do two things:

* link back to this guide
* Add [this mod](https://www.nexusmods.com/cyberpunk2077/mods/12790) as a requirement

## Step 6: Post-Publishing: Adding your mod for selection in a in-game menu.

Once your mod has been published with its own Tweak records, it can be merged with everyone else's ads (assuming you did Steps 2 and 3), making it available for toggling within a in-game menu with preview images. The following mod supports automatic detection of advertisement extension mods, seamlessly integrating with your mod and displaying your ads if and only if your mod is installed. This can also be helpful during the creation of your new ad. As long as your files are correct, and you've added records to the game controller, you will easily see it in-game (no further steps are necessary from mod version 4.00+). See [Advert Controller](https://www.nexusmods.com/cyberpunk2077/mods/18118).

{% hint style="info" %}
Disclaimer: The [author](https://www.nexusmods.com/users/24832504) of a large portion of this guide created this menu for advertisements.
{% endhint %}

Happy modding, choom!
