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

Files with ‘`pma`’ in their name are for masc V and those with ‘`pwa`’ are for fem V.&#x20;

Each eyebrow slot in the game should have a corresponding

* .app
* .morphtarget
* .mesh&#x20;
* .mi&#x20;

file.&#x20;

Textures and materials (.mi files) can be shared between masc and fem V, but every `.app`, `.morphtarget` and `.mesh` file needs to have a pma and pwa version.

I also recommend that you number all the files except for the `.inkcc` files in relation to which eyebrow pair they belong to.&#x20;

To add more files to each folder, right click on the file, click ‘copy’ and paste into the specific folder, or hold the `ctrl` key and drag and drop the file to its parent folder.

### The .inkcc

The `.inkcharactercustomization` defines what is shown in game and enables adding your own entries to the eyebrows switcher with custom names. Open the first .inkcc file you want to start with.

Under `headCustomizationOptions` you will see a few entries. `gameuiSwitcherInfo` is where you will be adding slots to the eyebrows switcher. Open the entry and find ‘options. This is where each CC slot will be added. To add another entry, left click `options` and you will see a yellow button as shown in the image below:

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcplo6Nv0hrCK0q9Q6mf0dAlbLWnQsfDRiQlSX9wS9r7xrLq3qX6-ihakHfUQZumJTJp8aWleHDCITp_LNAC7cWsBjEtpPR7K1rAKPRydMbI43HPY59x6PFAYjzigV7u0_xdh73?key=WyWwGiOMdeG66pqGGsWGixWY" alt=""><figcaption></figcaption></figure>



In ‘localizedName’, which is the name that will show for the specific slot in the CC, name it e.g. ‘\[your mod name] \[slot number]’, so you can tell the slots apart from each other in the game.&#x20;

Under ‘names’ you need a unique name, here called ‘your\_eyebrows\_01’ but rename that to something unique to your mod, that will later link to the specific eyebrow entry as well as under ‘headGroups’, which we will get to later. Now for the specific eyebrow entries. \


In the template, there are ‘gameuiAppearanceInfo’ entries for two eyebrow looks (I will get to duplicating entries later). Open the first one called ‘your\_eyebrows\_01’. Change the name to the name you had for the previous ‘names’ part, so whatever you called ‘your\_eyebrows\_01’ in ‘gameuiSwitcherInfo’. Then you need to copy the relative path of the .app file that stores the info about the specific eyebrows you are using for the specific entry into ‘resource’. It’s important that the flags are set to ‘Soft’. Do this for the second ‘gameuiAppearance’ entry and any additional entries.



![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdZe9wKNF23okr3FdRIXuuP6koklaEtScvSRqCsm5rWT3MQshbzX4TW_lGAu6SC9Eh_G7aLGl5k9N8v-VMeF6k7sHnjzPtRXrc0CsUlIKGYA-D1uanyx0D87QYCG5SefYc1f6Mf?key=WyWwGiOMdeG66pqGGsWGixWY)



To add another ‘gameuiAppearance’ entry which will reference the third and so fourth pair of eyebrows, right click on the bottom most ‘gameuiAppearance’ entry (here ‘your\_eyebrows\_02’) and select ‘Duplicate in Array/Buffer’. Then follow the previous steps regarding the name and resource path. Make sure you’ve added another entry under gameuiSwitcherInfo and linked it to your new ‘gameuiAppearance’ like I explained. If you started with the ‘pma’ .inkcc, repeat the process for the ‘pwa’ .inkcc. Next we move on to the .app files.

### The .app file

The .app file stores information about which .morphtarget is being used. Open the ‘components’ entry, then the ‘entMorphTargetSkinnedMeshComponent’ entry. Copy the relative path from the .morphtarget file that corresponds with the current .app file and paste it into  ‘morphResource’. Under ‘name’ you want to name it after the name of the .morphtarget file itself.&#x20;

\


![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdJsMOCQRk41es1DrfhtIINUC1WrWj8FNl7jfbrJowqpfK6e0EsQXVg2xlLeBVfyDJ3E6dYl5YKaZUGFM_2So3t4WbKIXZAIuzkKAVoqr4mecP8XGzL6KCpnpqpSulFOflH2P-b?key=WyWwGiOMdeG66pqGGsWGixWY)

\


Next scroll all the down to ‘resolvedDependencies’ and paste the same relative path from ‘morphResource’ into the entry here.&#x20;

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdHQpmDNiBlnxf9WAD-irNLA7MjrWlFC3Ovn1mKosN7o9AaGI70YbWJb5lxJ0C0Fq6KX-9dxy7ykxeZinYChP2m9g8JyroXMxaVrkoBJMK7XKgI4irWZ_3TjymhN6gDlTTb49C4TA?key=WyWwGiOMdeG66pqGGsWGixWY)

### The .morphtarget file

the .morphtarget defines which .mesh file is being used. The only thing you need to change here is the ‘baseMesh’ path to match the relative path of the corresponding .mesh file. NExt I’ll explain what you need to do in the .mesh file.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcPulxvySrF8iYPr5g4oeIcYajDyVwzaGtLN8w5T_Uq2FtIUCplUH0rSnPOtPFEFZ6vjBBwhQiJbCveawzd6-HUqkgjZ8jGOeXrX43nE-Ps0QE-oD-Z5BDAsPtkh1DOK9x9Zooe?key=WyWwGiOMdeG66pqGGsWGixWY)

### The .mesh file

In the .mesh file, there is an entry called ‘localMaterialBuffer’. Open it, and under the ‘materials’ entry, there is a ‘CMaterialInstance’ entry named @context. Open that and you will see a ‘CKeyValuePair’ called ‘BaseBrowsMaterial’. The relative path here needs to correspond with the matching .mi file (where the textures are stored). AFter you’ve changed that to match, take the same relative path, go to the ‘@brows’ CMaterialInstance and change the path of ‘baeMaterial’ to the exact same path that you just defined in ‘@context’.&#x20;

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfiHernxb9_ydIajoxgkDM5QE95wnZRAiMtNaDJzZk81LVSpUMfCT-RMD0qeU3cZc1TaT2lfIBD4nGUyw52mk_oBezmTgsw1l2dzv8P5NL-4fEogYP_xhFwlxbPCQbI_0JvLNR5wg?key=WyWwGiOMdeG66pqGGsWGixWY)



### The .mi file

Open the .mi file you want to change the textures of. There are only three entries you want to change the path to and those are ’‘SecondaryDiffuseAlpha’, ‘DiffuseTexture’, and ‘NormalTexture’. Each entry’s path should match that of the imported textures. So for the secondary diffuse, it should match the \_ds texture, diffuse the \_d texture, and for the normals the \_n texture.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfqsHkI7ROnwKn5e8366s6ZtoLvRA82JLduXtoe3TiXLnmhc6Zbozs_tb_USrIZGFgOR4bNT2vRvtpr2y4YrFrYVcEdjF6Y2DMaYjbFxO3i6AF9nu3ero35VmXsWb5V5-cdFwuqZA?key=WyWwGiOMdeG66pqGGsWGixWY)



## Step 4 - Importing your eyebrow textures

You can read about importing textures with Wkit here: [https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/textures-and-luts/images-importing-editing-exporting](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/textures-and-luts/images-importing-editing-exporting).



Note: The importing guide says that textures “must be a square, and its size must be a power of two”. This is NOT the case for eyebrow textures. The vanilla eyebrow textures are 512x256 but I personally use 2048x1024

## Step 5 - Editing the .xl file

First, rename the .xl file to something that matches your mod name. Open up the file (I use Notepad++) and make sure all the relative paths for each file matches what you have in Wkit. To add more eyebrows, simply copy and paste the last line from each file name (for each .app, .morphtarget and .mesh file. Here \_ma\_ is for masc V and \_wa\_ is for fem V) and make sure the relative paths match the paths in Wkit.&#x20;

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXe9fuscX4z__k61Yuq2VfOXh7qJyfNZaaAV-rmAGJojEK5V8-J-fJXLUVcRcPOCyiJ3r7ZT730WIbCNiGZ9Sqe-u6v8Sd2JIUDm4lzhW1nEeJmE1sR59cMRN7Ec9Bck_HdF0nIJcQ?key=WyWwGiOMdeG66pqGGsWGixWY)

## Step 6 - Test in-game

Once done, install the mod from Wkit and check in the CC if the eyebrows are showing up.&#x20;

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeUn4IoJuQtaO_rF22XhjHIRD7bJMvgyPTdJTn-Ab0pbfdDTLaPoJYppOWauDSlpyMKvwfysDO5l_EMbWw2u2ur9vh95mpdY1pKm70QpcQ1iNc8HbW4gqiXcbcPDswSXvbhrbXyHQ?key=WyWwGiOMdeG66pqGGsWGixWY)

(This is what the textures in the template look like)



If the textures aren’t showing up, it either means you’re missing a path in one of your files, you didn’t add a slot for the eyebrows switcher or the paths are wrong in the .xl file.&#x20;



If you have any questions or don’t know why your eyebrows aren’t showing up, you can ask for help in the modding discord server (insert link). Happy modding!

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
