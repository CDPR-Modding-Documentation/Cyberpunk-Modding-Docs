---
description: Create scars by replacing vanilla one
---

# How to do replacer vanilla scars

## **Summary**

**Published**: Feb 05 2024 by Yggnire, initial guide by Yggnire\
**Last documented edit**: Feb 05 2024 by Yggnire

This guide will teach you how to create scars by replacing vanilla one. In this guide, we'll replace _**#4**_ in the Character Customization.

### Level of difficulty

**The ability to read**: mandatory, because I'm not gonna lie — this is gonna be difficult otherwise.\
**Knowing how to use a drawing software** : recommended, because this guide will not cover it.

#### Expected time to complete

<5 minutes to set up everything\
5 minutes - s long as it takes you to create a scar that you like\
<5 minutes for the import/install

## Prerequisites

* [ ] You have [Wolvenkit installed](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/getting-started/download)
* [ ] A drawing software like Clip Paint Studio, Photoshop or [photopea.com](https://www.photopea.com/)
* [ ] Some time and patience to create scars

## Step 1: Settings up&#x20;

1. Create a [Wolvenkit project](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects) and give it a name that you can remember. Since we're replacing a basegame asset, make sure that it starts with `basegame`: `basegame_my_scars_replacer`
2. To create scars replacer, you need the following files  (they're shared for both body genders) from this folder:

```
base/characters/common/character_customization_items/scars/face/textures
```

<table><thead><tr><th width="641">files name</th><th data-hidden></th><th data-hidden></th></tr></thead><tbody><tr><td>- h0_000_pma__basehead_scars_d01</td><td></td><td></td></tr><tr><td>- h0_000_pma__basehead_scars_d02</td><td></td><td></td></tr><tr><td>- h0_000_pma__basehead_scars_m01</td><td></td><td></td></tr><tr><td>- h0_000_pma__basehead_scars_n01</td><td></td><td></td></tr></tbody></table>

You can find them by navigating the [Wolvenkit Asset Browser](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/asset-browser) to the path above, or by using the [search](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files).

3. Add the files to your project by double-clicking
4. Use the [Export Tool](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/tools/tools-import-export#export-tool) to export them
5. In your Project Explorer's [Raw view](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/project-explorer#raw), find the png files and click on the folder icon next to one to show them in Windows Explorer.
6. Open all of them on a drawing software like  photoshop, clip studio paint or [photopea.com](https://www.photopea.com/)

## Step 2: Scar creation :

Let's start by creating the scar's bumpmap. Open `pma__basehead_scars_n01.png` (the yellow-greenish one).

The image should look like this :&#x20;

![](<../../../.gitbook/assets/1 (1) (1).png>)

_The vanilla size are 1024x1024, I have upscaled mine to 4096x4096, but that's personal taste._

1. You will need to erase one of the pre-existing scars. Use the pipette tools and take the same color as the background.

<div align="left"><figure><img src="../../../.gitbook/assets/image (378).png" alt=""><figcaption></figcaption></figure></div>

2. Add a new layer and paint over this part of the image.

{% hint style="info" %}
By creating a new layer, you will preserve the original edit and can toggle your changes on and off in the layers palette.
{% endhint %}

![](<../../../.gitbook/assets/3 (1) (1).png>)\


<div align="left"><figure><img src="../../../.gitbook/assets/4 (2).png" alt="" width="354"><figcaption></figcaption></figure></div>

3. Once it’s done, add a new layer and start to draw your scar, I recommend you to use a brush similar to wet watercolor to create « natural scars » if you want to create cyberware scar, use a more consistent brush .

{% hint style="info" %}
The scar replaced spans the entire face, so this is the best scar to replace. To see which parts are affected, you can drag the \_d texture on your mesh and turn its opacity to 50%:
{% endhint %}

<figure><img src="../../../.gitbook/assets/5 (1) (1).png" alt=""><figcaption><p>Toggle the layer off again when you're done editing it</p></figcaption></figure>

4. To create your scar, take a basic **red** color, and draw your scar on the new layer you created in Step 2.
5. Copy the entire layer (Hotkey: `Ctrl+A`, `Ctrl+C`)
6. In the Layers Palette, select the _**red**_ channel and paste your scar. The image will now be black and white.

![](<../../../.gitbook/assets/6 (1) (1) (1).png>)

7. In the Layers Palette, select all three channels (or RGB) to see colours again.
8. Now you need to turn your image green. There are various ways to do that, for example Image -> Adjustments -> Hue/Saturation.
9. Copy the green scar and paste it into the _**green**_ channel.
10. Use `CTRL + T` to select it and shifted the scar a few pixels to the right (you can use the arrow keys). It should now look like this:

<figure><img src="../../../.gitbook/assets/7 (1).png" alt=""><figcaption></figcaption></figure>

### Editing the roughness map

1. Now that you have a scar, open `h0_000_pma__basehead_scars_m01` (the black-and-white one, your metallic map).&#x20;
2. On the yellow image, switch to the red channel again and copy everything (Hotkey: `Ctrl+A`, `Ctrl+C`)
3. Paste it into the metallic image (Hotkey: `Ctrl+V`). \
   It should now be on another layer. If not, undo the paste (Hotkey: `Ctrl+Z`), create a new layer in the layer palette, and paste it again.&#x20;
4. The pasted scar should automatically be black and white. If not, change that via the Edit -> Image -> Greyscale option.
5. Invert the image (Hotkey: `Ctrl+I`) so that it looks like the picture below:

<figure><img src="../../../.gitbook/assets/8 (1).png" alt=""><figcaption></figcaption></figure>

6. Now change the contrast of the formerly red channel so that the scar is black (Image -> Adjustments -> Brightness/Contrast).
7. Repeat the process with the green channel from the normal map.&#x20;
8. Now change the brightness of the formerly green channel to a light grey Image -> Adjustments -> Brightness/Contrast).
9. Set the blending mode of the green scar layer to `Difference`. This will give you an inverted image, but that's fine.
10. Now, merge the two layers (hotkey: `Ctrl+E`)
11. Invert it (Hotkey: `Ctrl+I`)
12. Change the tint of the RED scar to black and the GREEN one to light grey.

Do this for the others png files with appropriate colors.

Replace in your wolvenkit project all the png with the new one, « Import » and then « Install » and enjoy your new scar !

Go to Character Customization and select the scar 4.



## Known issue :&#x20;

Here is the issue that I have had to deal with and you will certainly meet it.

In-game, this kind of issue can happen , nose textures cut and strange square shadow on the neck.

To remedy this problem, create a new project and obtain the 4 file types as seen above and replace them with those that you modified, export, import, install and that's it, the problem should no longer be present. If the problem persists, start the procedure again.



{% tabs %}
{% tab title="Nose texture cut" %}
<div align="left"><figure><img src="../../../.gitbook/assets/image (266).png" alt="" width="371"><figcaption></figcaption></figure></div>
{% endtab %}

{% tab title="Strange square shadow" %}
<div align="left"><figure><img src="../../../.gitbook/assets/image (268).png" alt="" width="315"><figcaption></figcaption></figure></div>
{% endtab %}
{% endtabs %}



