# CCXL: Body Tattoos



## Summary

This page will tell you how to use ArchiveXL to add body tattoos to the character creator

### Wait, this is not what I want!

* To learn more about the character creator, check [files-and-what-they-do](../../../files-and-what-they-do/ "mention") -> [character-creator](../../../files-and-what-they-do/file-formats/character-creator/ "mention")
* If you want to **create** a tattoo first, check out [custom-tattoos-and-scars](../../../../modding-guides/npcs/custom-tattoos-and-scars/ "mention")

## Requirements

* You have a [Wolvenkit Project](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects)
* You have downloaded the example project from [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/19903/), and merged it with your project's `source` folder

## Step 1: Extracting the essentials

We are using a mesh as an overlay. You know what that means? Just get what you need the most.

If you are using body refits, then you should acquire them. This guideline will show for vanilla.



This is the path to acquire the gender you want to work on for vanilla V.

<figure><img src="../../../../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>

I will go with the right arm for male V.

<figure><img src="../../../../.gitbook/assets/image (1).png" alt=""><figcaption></figcaption></figure>



## Step 2: Setting up the .mesh

Fortunately, the mesh is the easiest part once you are done with the blender work.

All you need to do is import your mesh and set up your texture.

<figure><img src="../../../../.gitbook/assets/image (3).png" alt=""><figcaption></figcaption></figure>

<div align="left"><figure><img src="../../../../.gitbook/assets/image (6).png" alt=""><figcaption></figcaption></figure></div>

#### Important: Just because it is easy to do the .mesh does not mean that you are done yet. Thanks to the new ArchiveXL feature, we will just rename our imported mesh to your\_tattoo\_pma and delete the template mod. You will understand why just on Step 3.



## Step 3: Setting up the .app

The .app is already set for the appearances. All you need to do is relocate the .mesh

That is all you need to do (and renaming the "name", of course if you want to)

<figure><img src="../../../../.gitbook/assets/image (7).png" alt=""><figcaption></figcaption></figure>

In order to avoid manually replacing every single one, we will use ArchiveXL's new feature (I hope that you have done the important part on Step 2. Otherwise, enjoy the trouble of renaming all one by one!

Since our imported mesh is named as your\_tattoo\_pma, the dynamic renaming feature will allow you to rename it to whatever you want

<figure><img src="../../../../.gitbook/assets/image (9).png" alt=""><figcaption></figcaption></figure>



## Step 4: Renaming the files

Now, use dynamic renaming feature and rename your files.

You might ask "Why didn't we edit your\_tattoo\_pma.inkcharcustomization?". Very simple.

.app is the only thing changes here so use the dynamic renaming feature and you need to not forget to rename the LocalizedName for our next step which is the .json, the translation entry. It is necessary.

<figure><img src="../../../../.gitbook/assets/image (11).png" alt=""><figcaption></figcaption></figure>



## Step 5: The Translation Entry \[The .json]

It functions the same as the CCXL Hair.

Our secondaryKey's name is from .inkcharcustomization and it is defined under localizedName.

If you do not plan on renaming both files, just keep it as it is and only change femaleVariant.\


<figure><img src="../../../../.gitbook/assets/image (12).png" alt=""><figcaption></figcaption></figure>



## Step 6: The .xl file

Open the .archive.xl on your project's directory. Rename the paths and package the mods!\


<figure><img src="../../../../.gitbook/assets/image (13).png" alt=""><figcaption></figcaption></figure>

Note: If you want to do for only one gender, just delete either male or female from the .xl and make sure to pick the mesh path to load the one you want if you want either of the genders. Adapting a tattoo is usually pretty easy! Why not make your mod for both genders?
