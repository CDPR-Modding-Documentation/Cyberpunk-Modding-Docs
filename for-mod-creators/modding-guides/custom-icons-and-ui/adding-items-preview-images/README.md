---
description: How to add custom preview images by using a custom .inkatlas file
---

# Your own preview icons

## Summary

**Created by** [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Updated July 27. 2023**

The guide below will teach you how to make preview icons. While it's a technically a subsection of the [ArchiveXL item additions guide](../../items-equipment/adding-new-items/), you can use the steps below to make any kind of preview item.

**Difficulty Level**: You know how to read and can either edit images or make use of [the corresponding guide](../../textures-and-luts/images-importing-editing-exporting.md). It's easy!

{% hint style="info" %}
If you want to have gendered preview icons, check [here](gendered-preview-icons.md).
{% endhint %}

## The required files

If you downloaded the example project ([#getting-the-files](../../animations/archivexl-adding-photo-mode-poses.md#getting-the-files "mention")), the preview is already hooked up. Otherwise, [download](https://www.mediafire.com/file/3slvnkhjbz0jt65/inkatlas\_templates\_apart\_v1.zip/file) the template archive (kindly provided by Apart).

### Go away with your examples, I'll do everything by hand!

Okay, you do you. Here's how:

<details>

<summary>Finding the files by hand</summary>

1. search in Wolvenkit for `icons > .inkatlas`
2. Pick one of CDPR's icon files (look inside first, you want the right kind of icon — weapons have different icons than equipment) and add it to your project
3. Right-click on the file in the asset browser and select "`find used files`"
4. Find the `.xbm` file and add it to your project as well
5. **Move** both of these files to your custom folder, as you don't want to overwrite game default icons
6. Optionally: Re-name them. This guide assumes that they're named `preview_icons.inkatlas` and `preview_icons.xbm`

</details>

You should now have a structure like this:&#x20;

```
tutorial  
	ops		   
      	- my_tshirt_factory.csv 
      	- translation_strings.json  
      	- preview_icons.inkatlas       <<<  
      	- preview_icons.xbm            <<<  
```

## Taking preview pictures

You have two options on taking preview pictures. Both are relatively tedious, since you have to do it by hand. This is not a step-by-step, but you can find a few pointers here:

### Blender

You [can export your mesh with all its materials](../../../modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-import-export.md#export-from-wolvenkit) to Blender and take your preview pictures there:

<figure><img src="../../../../.gitbook/assets/blender_export_transparent.jpeg" alt=""><figcaption></figcaption></figure>

### In-game
Start by installing either [Invisible V](https://www.nexusmods.com/cyberpunk2077/mods/8412) by [manavortex](https://www.nexusmods.com/cyberpunk2077/users/1630319) or the [Invisibility Cap and Shoes](https://www.nexusmods.com/cyberpunk2077/mods/8643?tab=files) by [PinkyDude](https://www.nexusmods.com/cyberpunk2077/users/20892624). Start the game and equip the invisibility garment in the wardrobe as well as the item you want to create icons for. In [Equipment-EX](https://www.nexusmods.com/cyberpunk2077/mods/6945), save outfits for all colour variations of your outfit. 

<figure><img src="../../../../.gitbook/assets/icon_tutorial_02_eexoutfits.png" alt=""><figcaption></figcaption></figure>
<figure><img src="../../../../.gitbook/assets/icon_tutorial_01_photo_booth.png" alt=""><figcaption></figcaption></figure>

Enter Photo Mode and build a black photo booth around V that looks like the one in the screenshot above using [AMM](https://www.nexusmods.com/cyberpunk2077/mods/790). The [AMM Props - PhotoStudio](https://www.nexusmods.com/cyberpunk2077/mods/7436) are very useful for this. Save your photo booth as an AMM preset to create similar looking icons across all your mods. It's also very useful to make sure the angle of the camera in relation to V remains similar across all your icons. Exit photo mode and look at the lower edge of your photo booth. Align the edge with the bottom of your screen, to ensure V is positioned parallel to the photo booth (this will make more sense later). Enter photo mode again and rotate V to about +15 in the Pose tab.

Add some area lights to the scene. The goal is to highlight the shape of the item. So aim for deep shadows, lots of contrast, and prominent contours. In the screenshot below, there are four lights: two from each side behind the item as rim lights, one at a roughly 45° angle in front and above the item as key light, and one of very low intensity directly in front of the camera to fill in shadows.

<figure><img src="../../../../.gitbook/assets/icon_tutorial_03_lights.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
Sometimes, it can be helpful to disable RTX to create icons. The screenshot of item on the left in the image below was taken using Path Tracing and DLSS, the one on the right using rasterised lighting without DLSS:

<figure><img src="../../../../.gitbook/assets/icon_tutorial_04_rtx-shadows.png" alt=""><figcaption></figcaption></figure>

- If your item is a jacket, the shadows on the inside can look broken with RTX.
- If your item is jewellery made from glossy metal, you might get *unwanted* reflections with RTX.
- If your item features fine textures, you might want to disable RTX, so that you can also disable DLSS/FSR without burning up your graphics card.
- If your item is a piece of clothing made from glossy material, you might *want* RTX reflections.
{% endhint %}

To actually take the screenshot, position the Photo Mode camera so that it is rougly parallel to the bottom edge of your photo booth. If you did the same thing in First Person Perspective as instructed above, V should now be exactly at an angle of +15 to the Photo Mode camera. Set the Field of View to about 30 to prevent distortion when taking a closeup. Move the camera so that the item fills the entirety of your screen without cutting off a part of it. Enable [DepthAlpha.fx](https://github.com/luluco250/FXShaders/tree/master) in [ReShade](https://reshade.me/) (make sure to [set up the depth buffer properly](https://github.com/martymcmodding/ReShade-Guide/wiki/The-Depth-Buffer#verifying-the-depth-buffer-is-set-up-correctly)). Check `Colorize Transparency` and adjust the `Range` until your item is the only visible object in the scene.

<figure><img src="../../../../.gitbook/assets/icon_tutorial_05_depthalpha.png" alt=""><figcaption></figcaption></figure>

Disable `Colorize Transparency` and take the screenshot using ReShade (**not** the built-in Photo Mode). Switch to the pose tab and cycle through all appearances of your item and take a screenshot of each one (make sure you haven't skipped any!).

### Photoshop

#### Mask Out Your Item

Open the first of your screenshots in Photoshop and drop all other screenshots of the item onto the one you've just opened. Select the newly created Smart Objects, right click them and select "Rasterize Layers". Select the first layer and hide all other layers. Go to "Layer" in the menubar at the top of your screen on the left and select "Layer Mask" → "From Transparency". Create a new colour fill layer and choose a colour that contrasts with your item. Double click the layer mask on your first layer in the layers window to enter Select and Mask mode. Make sure your View Mode is set to "On Layers". Play around with the "Global Refinements" until the outline of your item looks smooth. 

<figure><img src="../../../../.gitbook/assets/icon_tutorial_06_mask_select_comparison.png" alt=""><figcaption></figcaption></figure>

Smooth <5, Feather <1, Contrast 30-50, and Shift Edge of around -30% works quite well usually. Highly depends on how intricate your item is. Duplicate the Layer Mask onto your other layers. From here on out, you can play around with a bunch of Adjustment Layers with Clipping Masks for each of your layers/appearances. I recommend some Levels Adjustments to set proper black and white points, as well as Black & White Adjustment Layers for items that are black, grey, silver or white and so on. Once you're done with that, select each layer and its Adjustment Layers, right click them, and select "Convert to Smart Object". Give each layer a meaningful name and save your image as a `.psd`.

<figure><img src="../../../../.gitbook/assets/icon_tutorial_07_adjustment_layers.png" alt=""><figcaption></figcaption></figure>
<figure><img src="../../../../.gitbook/assets/icon_tutorial_08_smart_objects.png" alt=""><figcaption></figcaption></figure>

#### Creating The Actual Icon

Open [this]("../../../../.gitbook/assets/item_icons.psd") `.psd` and import the Smart Objects of your icons into it. The `.psd` is based on the `preview_icons.xbm` found in [manavortex](https://www.nexusmods.com/cyberpunk2077/users/1630319)'s [Archive XL item additions and guide](https://www.nexusmods.com/cyberpunk2077/mods/8268) and can be easily used with projects based on the tutorial. With all layers selected in Photoshop, transform them so that the longest side is 158px. Align each item to the centre of each grey square.

<figure><img src="../../../../.gitbook/assets/icon_tutorial_09_align_icons.png" alt=""><figcaption></figcaption></figure>

Select all of your items, duplicate them and merge the layers. Go to "Layer" in the menubar at the top of your screen on the left and select "Layer Mask" → "From Transparency". Move the newly created Layer Mask to the white Colour Fill Layer (`alpha mask white`). Delete the layer of the merged items. Merge both the white and black Colour Fill Layers. Select the entire canvas `CTRL + A` and copy your selection `CTRL + C`. Switch over to the Channels tab in the layers window (alternatively, in the menubar at the top of your screen select "Window" → "Channels"). Select "Alpha 1" and hit `CTRL + V`. Your image now has an alpha layer.

<figure><img src="../../../../.gitbook/assets/icon_tutorial_10_layer_mask.png" alt=""><figcaption></figcaption></figure>
<figure><img src="../../../../.gitbook/assets/icon_tutorial_11_alpha_mask.png" alt=""><figcaption></figcaption></figure>

Select the RGB channel again, go back to the Layers window and select the layer named `slot_01`. Change its fill colour to something similar to the outside of your item. Repeat this for all other items.

<figure><img src="../../../../.gitbook/assets/icon_tutorial_12_backgrounds.png" alt=""><figcaption></figcaption></figure>

Now save the image as a `.tga` in the raw folder of your WolvenKit project. Import the `.tga` into your WolvenKit project with the `TEXG_Generic_UI` `TextureGroup` setting and make sure that `PremultiplyAlpha` is enabled. 


## Hooking up the inkatlas

1. Open the file in WolvenKit.
2. Open the list `slots`.
3. For the first two `inkTextureSlot` items, set the value for `DepotPath` to the relative path of your xbm (`tutorial\torso\my_custom_shirt\ops\preview_icons.xbm`):

<figure><img src="../../../../.gitbook/assets/inkatlas_slot_names.png" alt=""><figcaption></figcaption></figure>

4. Save the file. If it doesn't update, close and re-open it.
5. You now have a tab "PartMapping". You can see which texture corresponds to which slot by selecting it in the other tab and checking the `partsName`, which corresponds to the entry in the slot's  `parts` array:

<figure><img src="../../../../.gitbook/assets/inkatlas_icon_to_slot_assignment.png" alt=""><figcaption></figcaption></figure>
<figure><img src="../../../../.gitbook/assets/icon_tutorial_14_inkatlas_thumbs.png" alt=""><figcaption></figcaption></figure>

{% hint style="success" %}
Congratulations! You now have preview icons!
{% endhint %}

<figure><img src="../../../../.gitbook/assets/icon_tutorial_16_ingame.png" alt=""><figcaption></figcaption></figure>

## Using it

You can now hook up your preview icon(s) to whatever mod you are making.&#x20;

{% hint style="info" %}
If you want to use gendered preview icons, check [here](gendered-preview-icons.md). In this case, you do **not** add an icon record to your item.
{% endhint %}

### ArchiveXL: Add it to the .yaml

Check the code box below — the last three lines add a preview icon.

```
Items.my_custom_shirt_redwhite:
  $base: Items.GenericInnerChestClothing
  entityName: my_custom_shirt_factory_name
  appearanceName: appearance_root_entity_white_red
  displayName: my_shirt_localization_name_white_red
  localizedDescription: my_shirt_localization_desc
  quality: Quality.Legendary
  appearanceSuffixes: []
  icon:
    atlasResourcePath: tutorial\torso\my_custom_shirt\ops\preview_icons.inkatlas
    atlasPartName: slot_01
```

Please refer to the [ArchiveXL guide](../../animations/archivexl-adding-photo-mode-poses.md) for an explanation of the other properties, as this page will only hold information about preview icons.

* `atlasResourcePath`: relative path to your .inkatlas file
* `atlasPartName`: slot name in your .inkatlas file (which you can see in the `PartsMapping` tab)

{% hint style="warning" %}
Again, please note that indent is **crucial** here, as it determines the node structure. The first line needs to have an indent of 0, the lines from `$base` to `icon` need to have two spaces, and the lines `atlasResourcePath` and `atlasPartName` need to have four.
{% endhint %}

## That's it! Time to test!

If you run into any issues with your texture's transparency, please [check the textures import/export guide!](../../textures-and-luts/images-importing-editing-exporting.md)
