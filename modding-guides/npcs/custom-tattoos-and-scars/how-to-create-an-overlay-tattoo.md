---
description: This guide will teach you how to create tattoo on modded body, KS_UV and VTK
---

# How to create an overlay tattoo

## **Summary**

**Published**: Apr 11 2024 by Yggnire, initial guide by Yggnire\
**Last documented edit**: April 08 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

### Level of difficulty



**The ability to read**: mandatory, because I'm not gonna lie — this is gonna be difficult otherwise.\
**Knowing how to use a drawing software** : recommended, because this guide will not cover it.   Knowing how to use WolvenKit.&#x20;



<5 minutes to set up everything\
5 minutes - as long as it takes you to create a tattoo that you like\
<5 minutes for the import/install

## Prerequisites

* [ ] You have [Wolvenkit installed](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/getting-started/download)
* [ ] A drawing software like Clip Paint Studio, Photoshop or [photopea.com](https://www.photopea.com/)
* [ ] Some time and patience to create tattoo

## Settings up and tattoo making :

1. Create a [Wolvenkit project](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects) and give it a name :&#x20;
   * VTK project name should be `00_modname`
   * KS\_UV project name should be `005_modname`
2. To create overlay tattoo , you need the following files [overlay-list.md](converting-between-tattoo-frameworks/overlay-list.md "mention") , select the body part you want to edit.
3. Add the files to your project by double-clicking on them.&#x20;

{% hint style="info" %}
You can add the base body texture as a reference. It is in the same folder as the overlay - right-click on the file in your project browser, select `Copy Relative Path`,  paste it into the Mod Browser's search bar (without the file name).
{% endhint %}

4. In your Export Tool, [export](../../textures-and-luts/images-importing-editing-exporting.md) the `.xbm` files to `.png`.&#x20;
   * You will find the resulting file in your project's `raw` folder.
5. Open the exported texture in photoshop, clip studio paint,  [photopea.com](https://www.photopea.com/) or another editing software
6. Optional: Resize the image to the size you want (4096x4096, 2048 or 1024). 2k is usually enough.
7. Create a new layer and start drawing your tattoo :&#x20;

<div align="left">

<figure><img src="../../../.gitbook/assets/image (199).png" alt="" width="188"><figcaption></figcaption></figure>

</div>

8. When your tattoo is complete, uncheck the eye on the skin layer

<div align="left">

<figure><img src="../../../.gitbook/assets/image (200).png" alt=""><figcaption></figcaption></figure>

</div>

8. Now your project should look like this: Your tattoo and no background

<div align="left">

<figure><img src="../../../.gitbook/assets/image (201).png" alt="" width="357"><figcaption></figcaption></figure>

</div>

Now you need to save your file and then import it back into Wolvenkit. You have two ways to do that:

### Import Tool

1. Overwrite the png that you created in step 3.1
2. Open the [Import Tool](../../textures-and-luts/images-importing-editing-exporting.md#importing-a-texture) and import your png
3. You're done

### Texture View

1. Save your new tattoo anywhere on your PC as a `.png` file.
2. In Wolvenkit, open the .xbm file by either double-clicking the file, or clicking the blue icon
3.

    <figure><img src="../../../.gitbook/assets/image (202).png" alt=""><figcaption></figcaption></figure>
4. Switch to the "**Texture Preview**" tab
5. Right click on it and select `Replace Texture`. Choose the file you have saved.

![](<../../../.gitbook/assets/image (203).png>)![](<../../../.gitbook/assets/image (204).png>)

## Time to test!

[Install your mod](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/menu/toolbar#install-and-launch) by clicking the green Play button in the toolbar. Time to go in-game and admire your new tattoo!
