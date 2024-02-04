---
description: How to merge two or more existing tattoos
---

# Merging existing tattoos

#### Summary

**Published**: Feb 03 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention"), initial guide by Yggnire\
**Last documented edit**: Feb 03 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This guide will teach you how to merge multiple tattoos into one. It will not cover the process of[converting-between-tattoo-frameworks.md](converting-between-tattoo-frameworks.md "mention").

#### Level of difficulty

**The ability to read**: mandatory, because I'm not gonna lie — this is gonna be difficult otherwise.\
**Knowing how to edit images**: recommended, because this guide will not cover it. If you don't know it, the relevant section will tell you what to Google, though.

#### Expected time to complete

<1h for total noobs, <10 minutes if you know what you're doing

## Prerequisites

* [ ] You have [Wolvenkit installed](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/getting-started/download)
* [ ] You have all tattoo mods that you want to merge installed (even though only one of them will be active)
* [ ] All your tattoo mods are for the same framework (if not, check the guide about [converting-between-tattoo-frameworks.md](converting-between-tattoo-frameworks.md "mention") and do that first)

## Step 0: Create a Wolvenkit Project

Depending on the supported framework, you need to name your project like this:&#x20;

| Framework | Prefix | Example name         |
| --------- | ------ | -------------------- |
| KS UV     | 004    | 004\_my\_tattoo\_mix |
| VTK       | 00     | 00\_my\_tattoo\_mix  |

If you don't know how to create a project, you can look it up on the [Wolvenkit wiki](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects#create-a-new-wolvenkit-mod-project).

## Step 1: Extract the files

Export all `.xbm` files from the tattoo mods that you want.&#x20;

{% hint style="info" %}
You can find a detailed guide on how to do this under [analysing-other-mods](../../analysing-other-mods/ "mention")
{% endhint %}

1. Open the [Asset Browser](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/asset-browser) and switch it to Mod Browser
2. [Find](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files) all `.xbm` files in the  first`.archive` file from one of your tattoo mods
3. Add them to your project
4. **Rename** the files (e.g. by appending "mod1"). This is important, because the other mods' file names will be the same. \
   **Do not rename the files for the last mod you export.**
5. Repeat the process with the other archives until you have all .xbm files that you want to merge in your project.

## Step 2: Edit the files

1. Use Wolvenkit's [Export Tool](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/tools/tools-import-export#export-tool) to export all the files to `.png`
2. Open the file in the image editing software of your choice (if you don't have one, use [photopea.com](https://www.photopea.com/))
3. Make sure to use the same `resolution` for all the tattoos, otherwise the tattoos will be placed incorrectly, they will either be too big or too small compared to other tattoos, usually `4096x4096`  is the most used resolution.
4. Merge the textures. If you don't know how, you can google "how to merge layers in `<software of your choice>`" and find guides by the dozen.
5. [Export the textures](../../textures-and-luts/images-importing-editing-exporting.md), overwriting the files from your last export in your Wolvenkit project's `raw` directory.

{% hint style="warning" %}
Make sure to check the [linked guide ](../../textures-and-luts/images-importing-editing-exporting.md)for how to enable transparency!
{% endhint %}

## Step 3: Import the files and pack the mod

1. Use the [Import Tool](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/tools/tools-import-export#import-tool) to import the `.png` files into the original `.xbm` files
2. Delete all other (renamed) xbm file from your project directory — you don't need them anymore
3. Check the textures in the Image Preview to make sure that they look OK. [Troubleshoot](../../textures-and-luts/images-importing-editing-exporting.md) them if not.

Now it's time to [install your new mod](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/menu/toolbar#install-and-launch) and launch the game. Click and hold the green play button on Wolvenkit's toolbar, select "Install and Play", and look at your new tattoo in action.

{% hint style="info" %}
After installing your new tattoo mod, remember to delete the original files in your mod folder, otherwise it will cause conflict between the different tattoo mods.
{% endhint %}

## **List of the differents type of overlays names :**

{% hint style="info" %}
The body file of KS\_UV contain the Torso, Back, Legs and Arms parts\
The body file of VTK contain Torso, Back and Legs parts
{% endhint %}

| Framework | Overlay name                               | gender/body part              |
| --------- | ------------------------------------------ | ----------------------------- |
| KS\_UV    | fullbody\_overlay\_d01                     | female  body (see note above) |
|           | ma\_fullbody\_overlay\_d01                 | male  body                    |
|           | wa\_head\_overlay\_d01 female head overlay | female head                   |
|           | ma\_head\_overlay\_d01                     | male head                     |
|           |                                            |                               |
| VTK       | v\_overlay                                 | female body (see note above)  |
|           | 11597681951245522818                       | female head                   |
|           | femme\_arm\_left\_01\_overlay              | female left arm               |
|           | femme\_arm\_right\_01\_overlay             | female right arm              |
