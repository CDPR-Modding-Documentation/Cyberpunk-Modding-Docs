---
description: >-
  This page will tell you how to use ArchiveXL to add eyebrows to the character
  creator.
---

# CCXL: Eyebrows

## Summary

Created: April 25 2025 by [lumad11](https://app.gitbook.com/u/duXEIdJ7AETQBVeMRsxMnaGWO0m1 "mention")\
Last documented update: April 25 2025 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page will teach you how to add custom eyebrows to the character creator with ArchiveXL.

### Wait, this is not what I want!

* To learn more about the character creator, check [files-and-what-they-do](../../../files-and-what-they-do/ "mention") -> [character-creator](../../../files-and-what-they-do/file-formats/character-creator/ "mention")

## You will need:&#x20;

* CCXL Eyebrows Template (download from [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/21196))
* The latest Wolvenkit (stable | [Nightly](https://github.com/WolvenKit/WolvenKit-nightly-releases/releases))
* You own edited eyebrow textures

## Step 1 - Starting a new project

1. You want to [create a new projec](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects#create-a-new-wolvenkit-mod-project)t in Wolvenkit (call it whatever you want your mod to be called).&#x20;
2. Extract the CCXL Eyebrow Template file: copy the `archive` and `resources` folders to your project `source` folder.&#x20;

## Step 2 - File names and paths

Once you’ve placed the folders from the template into your project folders, your project in Wolvenkit should look like this:

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXeji-2oojnYKgagnOpSbK3zD0zoK1dz2176QtOmSTFbfVvadctmrkQZtHX9ZLaaYb_f1NowLD0Sdh20xP9bK6a_aV0aA22ckM0vV63sHDvPhav1v1qZe8iitxeVV2ye5BZoVGf1?key=WyWwGiOMdeG66pqGGsWGixWY" alt=""><figcaption></figcaption></figure>

Now we'll rename a few folders.&#x20;

{% hint style="info" %}
Use the Wolvenkit "[Rename](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/project-explorer#rename)" dialogue for this, and make sure that the checkbox is checked
{% endhint %}

1. Rename the folder `your_name`  to whatever your name is
2. Rename `your_eyebrows_mod_name_ccxl` to  your **actual** mod name

You still need to adjust the paths for files you add, but we will do that together.

## Step 3 - The files

The files are split up by body gender. Anything with `pma` in their name is for masc V, `pwa` for fem.

The .`inkcharactercustomization` file is the entry point for the character creator. You need only one per eyebrow&#x20;

Each additional eyebrow slot needs the following files **per body gender**:

* .app
* .morphtarget
* .mesh&#x20;

... and a material file that can be shared between masc and fem:

* .mi&#x20;

Textures and materials (.mi files) can be shared between masc and fem V, but every `.app`, `.morphtarget` and `.mesh` file needs to have a pma and pwa version.

I also recommend that you number all the files except for the `.inkcc` files in relation to which eyebrow pair they belong to.&#x20;

{% hint style="info" %}
This section will explain what the files do, which you can use to add more entries. All paths should have been updated when you used Wolvenkit's internal rename, buit do check to make sure
{% endhint %}

To add more files to each folder, right click on the file, click ‘copy’ and paste into the specific folder, or hold the `ctrl` key and drag and drop the file to its parent folder.

### The .inkcc

The `.inkcharactercustomization` defines what is shown in game and enables adding your own entries to the eyebrows switcher with custom names. Open the first .inkcc file you want to start with.

Under `headCustomizationOptions` you will see a few entries. Before we start duplicating anything, let's talk about what they do.

#### `gameUiSwitcherInfo`

This is where you will be adding **slots** to the eyebrows switcher. Open the entry and find `options`.&#x20;

To add another entry, left click `options` and you will see a yellow button as shown in the image below:

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcplo6Nv0hrCK0q9Q6mf0dAlbLWnQsfDRiQlSX9wS9r7xrLq3qX6-ihakHfUQZumJTJp8aWleHDCITp_LNAC7cWsBjEtpPR7K1rAKPRydMbI43HPY59x6PFAYjzigV7u0_xdh73?key=WyWwGiOMdeG66pqGGsWGixWY" alt=""><figcaption></figcaption></figure>

For each of the appearances, change the following properties:

1. `localizedName`: This will show in the character creator for the eyebrow slot. Call it e.g. ‘\[your mod name] \[slot number]’, so you can tell the slots apart from each other in the game.&#x20;
2. `names`: You need a **unique** name, so change `your_eyebrows_01` to something unique to your mod (e.g. `yourmoddername_yourmodname_eyebrows_01`). This is what the character creator uses to pick the correct entry from `headGroups` (we'll get to that).

#### `gameuiAppearanceInfo`

Below the switcherInfo, the template has two `gameuiAppearanceInfo` entries for two eyebrow appearances. For each of the appearances,

1. Open the first one called `your_eyebrows_01`, and change it to the same value you put into names in the previous step (e.g. `yourmoddername_yourmodname_eyebrows_01` )’.&#x20;
2. Make sure that the `resource` path is the relative path to your `.app` file for the corresponding gender and eyebrows
3. Make sure that the resource `flags` property is set to `Soft`

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdZe9wKNF23okr3FdRIXuuP6koklaEtScvSRqCsm5rWT3MQshbzX4TW_lGAu6SC9Eh_G7aLGl5k9N8v-VMeF6k7sHnjzPtRXrc0CsUlIKGYA-D1uanyx0D87QYCG5SefYc1f6Mf?key=WyWwGiOMdeG66pqGGsWGixWY" alt=""><figcaption></figcaption></figure>

### Duplicating entries

To add another `gameuiAppearance` entry which will reference the third and so fourth pair of eyebrows:

1. right click on the bottommost `gameuiAppearance` entry (here ‘your\_eyebrows\_02’)&#x20;
2. select ‘Duplicate in Array/Buffer’
3. Follow the previous steps regarding the name and resource path
4. Addanother entry under `gameuiSwitcherInfo` and link it to your new ‘`gameuiAppearance`’ like I explained.&#x20;

If you started with the ‘pma’ .inkcc, repeat the process for the ‘pwa’ .inkcc. Next we move on to the .app files.

### The .app file

The .app file connects the .inkcc appearances with the correct .morphtarget file, which in turn points at the .mesh with the actual appearances.&#x20;

1. Open the `components` entry, then the `entMorphTargetSkinnedMeshComponent`.&#x20;
2. Make sure that the `morphResource` 's depot path points at the correct .morphtarget file
3. For `name`, put the name of the `.morphtarget` file itself.&#x20;

Your appearance should look like this:

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdJsMOCQRk41es1DrfhtIINUC1WrWj8FNl7jfbrJowqpfK6e0EsQXVg2xlLeBVfyDJ3E6dYl5YKaZUGFM_2So3t4WbKIXZAIuzkKAVoqr4mecP8XGzL6KCpnpqpSulFOflH2P-b?key=WyWwGiOMdeG66pqGGsWGixWY" alt=""><figcaption></figcaption></figure>

4. Next, scroll all the down to ‘resolvedDependencies’ and paste the same relative path from ‘morphResource’ into the entry here.&#x20;

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdHQpmDNiBlnxf9WAD-irNLA7MjrWlFC3Ovn1mKosN7o9AaGI70YbWJb5lxJ0C0Fq6KX-9dxy7ykxeZinYChP2m9g8JyroXMxaVrkoBJMK7XKgI4irWZ_3TjymhN6gDlTTb49C4TA?key=WyWwGiOMdeG66pqGGsWGixWY" alt=""><figcaption></figcaption></figure>

### The .morphtarget file

The `.morphtarget` defines which `.mesh` file is being used.&#x20;

1. Make sure that the `baseMesh` path points at the correct `.mesh` file for your current body gender.

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcPulxvySrF8iYPr5g4oeIcYajDyVwzaGtLN8w5T_Uq2FtIUCplUH0rSnPOtPFEFZ6vjBBwhQiJbCveawzd6-HUqkgjZ8jGOeXrX43nE-Ps0QE-oD-Z5BDAsPtkh1DOK9x9Zooe?key=WyWwGiOMdeG66pqGGsWGixWY" alt=""><figcaption></figcaption></figure>

Next I’ll explain what you need to do in the .mesh file.

### The .mesh file

This file contains your eyebrow appearances. Thanks to ArchiveXL's magic, you only need to check the material path:

1. Expand `localMaterialBuffer`&#x20;
2. Expand `materials`
3. Expand the `CMaterialInstance` with the name of `@context`&#x20;
4. Make sure that the `BrowsBaseMaterial`'s relative path corresponds to the matching `.mi` file
5. Now go to the `@brows`  CMaterialInstance, and make sure that the `baseMaterial`  has the exact same path.

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfiHernxb9_ydIajoxgkDM5QE95wnZRAiMtNaDJzZk81LVSpUMfCT-RMD0qeU3cZc1TaT2lfIBD4nGUyw52mk_oBezmTgsw1l2dzv8P5NL-4fEogYP_xhFwlxbPCQbI_0JvLNR5wg?key=WyWwGiOMdeG66pqGGsWGixWY" alt=""><figcaption></figcaption></figure>

### The .mi file

Open the .mi file you want to change the textures of.&#x20;

There are only three entries you want to change the path to:

* SecondaryDiffuseAlpha
* DiffuseTexture
* NormalTexture&#x20;

Each entry’s path should match that of the imported textures. So for the secondary diffuse, it should match the `_ds` texture, diffuse the `_d` texture, and for the normals the `_n` texture.

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfqsHkI7ROnwKn5e8366s6ZtoLvRA82JLduXtoe3TiXLnmhc6Zbozs_tb_USrIZGFgOR4bNT2vRvtpr2y4YrFrYVcEdjF6Y2DMaYjbFxO3i6AF9nu3ero35VmXsWb5V5-cdFwuqZA?key=WyWwGiOMdeG66pqGGsWGixWY" alt=""><figcaption></figcaption></figure>

## Step 4 - Importing your eyebrow textures

You can read about importing textures with Wkit here: [images-importing-editing-exporting.md](../../../../modding-guides/textures-and-luts/images-importing-editing-exporting.md "mention")

{% hint style="info" %}
The guide says that textures “must be a square, and its size must be a power of two”. This is NOT the case for eyebrow textures. The vanilla eyebrow textures are 512x256 but I personally use 2048x1024
{% endhint %}

## Step 5 - Editing the .xl file

1. Rename your .xl file to match your mod's name
2. Open up the file in a text editor (like [Notepad++](https://notepad-plus-plus.org/downloads/)) and make sure that the relative paths match the ones you have in WKit
3. To add more eyebrows, simply duplicate the last line from each file type (.app, .morphtarget and .mesh), and make sure that the paths match. ( `_wa_` is for femV, `_ma_` for masc)

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXe9fuscX4z__k61Yuq2VfOXh7qJyfNZaaAV-rmAGJojEK5V8-J-fJXLUVcRcPOCyiJ3r7ZT730WIbCNiGZ9Sqe-u6v8Sd2JIUDm4lzhW1nEeJmE1sR59cMRN7Ec9Bck_HdF0nIJcQ?key=WyWwGiOMdeG66pqGGsWGixWY" alt=""><figcaption></figcaption></figure>

## Step 6 - Test in-game

Once done, install the mod from Wkit and check in the CC if the eyebrows are showing up.&#x20;

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXeUn4IoJuQtaO_rF22XhjHIRD7bJMvgyPTdJTn-Ab0pbfdDTLaPoJYppOWauDSlpyMKvwfysDO5l_EMbWw2u2ur9vh95mpdY1pKm70QpcQ1iNc8HbW4gqiXcbcPDswSXvbhrbXyHQ?key=WyWwGiOMdeG66pqGGsWGixWY" alt=""><figcaption></figcaption></figure>

(This is what the textures in the template look like)



## Troubleshooting

### The eyebrows are invisible!

* Double-check your `.xl` file: This can happen when the paths are wrong
* Check the `.inkcharcustomization` file: Did you forget to add a slot for the eyebrow switcher?
* Check the chain of the files above. Make sure none of them is missing a path.

### Other problems

If you have any questions or don’t know why your eyebrows aren’t showing up, you can ask for help in the [modding discord server](http://discord.gg/redmodding).&#x20;

Happy modding!

\
\
\
\
\
\
\
\
\
\
