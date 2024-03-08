---
description: This guide will teach you how to create scars on modded body KS_UV and VTK
---

# Creating modded body scars

## **Summary**

**Published**: Feb 29 2024 by Yggnire, initial guide by Yggnire\
**Last documented edit**: Feb 29 2024 by Yggnire



### Level of difficulty

**The ability to read**: mandatory, because I'm not gonna lie — this is gonna be difficult otherwise.\
**Knowing how to use a drawing software** : recommended, because this guide will not cover it.

#### Expected time to complete

<5 minutes to set up everything\
5 minutes - s long as it takes you to create a scar that you like\
<5 minutes for the import/install

_<mark style="color:red;">**If you want to know how to make scars, I advise you to take a look at the tutorial**</mark>_ ["How to make a scar (tips for drawing)](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators/modding-guides/npcs/custom-tattoos-and-scars/how-to-make-a-scar-tips-for-drawing)

## Prerequisites

* [ ] You have [Wolvenkit installed](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/getting-started/download)
* [ ] A drawing software like Clip Paint Studio, Photoshop or [photopea.com](https://www.photopea.com/)
* [ ] Some time and patience to create scars

## Step 1: Settings up&#x20;

1. Create a [Wolvenkit project](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects) and give it a name&#x20;

For the Body :&#x20;

For both Framework, the name should be something like that : `000_modname`

For the Head :

KS\_UV project name should be `005_modname`

VTK project name should be in two separate files, one with the skin `00_modname` and the other with the bumpmap in it `z_modname`.

<mark style="color:red;">Do not put the two files together or the bumpmap won't work.</mark>

2. To create modded body scars , you need the following files



| Framework                                           | Files name                       | gender/body part           |
| --------------------------------------------------- | -------------------------------- | -------------------------- |
| KS\_UV                                              |                                  |                            |
|                                                     | d02\_naked                       | female body, arms and legs |
|                                                     | n02\_naked                       | female body, arms and legs |
|                                                     | d03\_naked                       | male body, arms and legs   |
|                                                     | n03\_naked                       | male body, arms and legs   |
|                                                     |                                  |                            |
| VTK                                                 |                                  |                            |
|                                                     | v\_body\_d                       | female body and legs       |
|                                                     | v\_body\_n                       | female body and legs       |
|                                                     | femme\_arm\_left\_01\_diffuse    | female left arm            |
|                                                     | femme\_arm\_left\_01\_normal     | female left arm            |
|                                                     | femme\_arm\_right\_01\_diffuse   | female right arm           |
|                                                     | femme\_arm\_right\_01\_normal    | female right arm           |
|                                                     |                                  |                            |
| <p>VANILLA (for KS_UV) </p><p>&#x26; </p><p>VTK</p> |                                  |                            |
|                                                     | h0\_000\_pwa\_c\_\_basehead\_d01 | female head                |
|                                                     | h0\_001\_pwa\_c\_\_basehead\_n01 | female head                |
|                                                     | h0\_000\_pma\_c\_\_basehead\_d01 | male head                  |
|                                                     | h0\_000\_pma\_c\_\_basehead\_d02 | male head                  |

You can find them by navigating the [Wolvenkit Asset Browser](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/asset-browser) to the path above, or by using the [search](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files).

<mark style="color:red;">KS\_UV Body Path :</mark>&#x20;

`base\4k\common\body\wa\textures` (female)

`base\4k\common\body\ma\textures` (male)

<mark style="color:red;">VTK Body Path :</mark>

`base\v_textures\body`

<mark style="color:red;">VTK Arms Path :</mark>&#x20;

`base\characters\player\femme\body\arms\textures`

<mark style="color:red;">VANILLA (for KS\_UV) Head Path :</mark>&#x20;

`base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\textures` (female)

`base\characters\head\player_base_heads\player_man_average\h0_000_pma_c__basehead\textures` (male)

<mark style="color:red;">VTK Head Path :</mark>&#x20;

`base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\textures`

3. Add the files to your project by double-clicking
4. Use the [Export Tool](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/tools/tools-import-export#export-tool) to export them
5. In your Project Explorer's [Raw view](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/project-explorer#raw), find the png files and click on the folder icon next to one to show them in Windows Explorer.&#x20;
6. Save the files in a new folder.
7. Open all of them on a drawing software like  photoshop, clip studio paint or [photopea.com](https://www.photopea.com/)

## Step 2: Scar creation :

Let's start by creating the scar's bumpmap (the yellow-greenish one).

1. Add a new layer and paint your scar (if you want to know how to create a scar from scratch , you can go to this tuto )&#x20;
2. Start to draw your scar, I recommend you to use a brush similar to wet watercolor to create « natural scars » if you want to create cyberware scar, use a more consistent brush .
3. To create your scar, take a basic **red** color, and draw your scar on the new layer you created in Step 2.
4. In the Layers Palette, select all three channels (or RGB) to see colours again.
5. Now you need to turn your image green. There are various ways to do that, for example Image -> Adjustments -> Hue/Saturation.
6. Copy the green scar and paste it into the _**green**_ channel.
7. Use `CTRL + T` to select it and shifted the scar a few pixels to the right (you can use the arrow keys). It should now look like this:

### Editing the diffuse (skin) map

1. Now that you have a scar, open the diffuse map (skin).
2. On the yellow image, switch to the red channel again and copy everything (Hotkey: `Ctrl+A`, `Ctrl+C`)
3. Paste it into the skin image (Hotkey: `Ctrl+V`). \
   It should now be on another layer. If not, undo the paste (Hotkey: `Ctrl+Z`), create a new layer in the layer palette, and paste it again.&#x20;
4. The pasted scar has to be the same color as your skin so plays around with the Tint/Hue `CTRL+U`&#x20;
5. Invert the image (Hotkey: `Ctrl+I`)
6. Replace in your wolvenkit project all the png with the new one, « Import » and then « Install » and enjoy your new scar !



