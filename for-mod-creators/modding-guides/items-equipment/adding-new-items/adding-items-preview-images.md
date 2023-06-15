---
description: How to add custom preview images by using a custom .inkatlas file
---

# Adding items: Preview images

## Summary

This part teaches you how to set up preview images for your newly-added ArchiveXL project.&#x20;

**Difficulty Level**: You know how to read and can edit images. (If you can't edit images, [there's a guide](../../../textures/images-importing-editing-exporting.md)!)

## The required files

If you downloaded the example project, the preview is already hooked up. If you don't want to do that for some reason, you can just take one from the game:&#x20;

1. search in Wolvenkit for `icons > .inkatlas`
2. Pick one of CDPR's icon files (look inside first, you want the right format) and add it to your project
3. Right-click on the file in the asset browser and select "`find used files`"
4. Find the .xbm file and add it to your project as well
5. Move both of these files to your custom folder, as you don't want to fuck up already-existing items
6. Optionally: Re-name them, as the guide assumes that they're named `preview_icons.inkatlas` and `preview_icons.xbm`

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

You can [export your mesh with all its materials](../../../3d-modelling/exporting-and-importing-meshes/#gltf-binary-.glb) to Blender and take your preview pictures there.

### In-game

* Make sure V isn't on the screenshots with [Appearance Menu Mod](https://www.nexusmods.com/cyberpunk2077/mods/790)'s `invisible V` toggle or [Invisible Character](https://www.nexusmods.com/cyberpunk2077/mods/6449)
* Get an outfit manager like [Wardrobe](https://www.nexusmods.com/cyberpunk2077/mods/2176?tab=files\&file\_id=32757\&nmm=1) to create outfits where V is wearing nothing but the item
* Optional: Use [AMM Photo Studio Props](https://www.nexusmods.com/cyberpunk2077/mods/7436) for backgrounds — it has black, white, or greenscreen

## Fixing up your texture

1. Export the .xbm file via Tools -> Export Tool
2. Find the resulting file under "raw"&#x20;
3. Edit it to your heart's content
4. Overwrite the png file with your edited one
5. Import it back via Tools -> Import Tool

## Hooking up the inkatlas

1. Open the file in WolvenKit.
2. Open the list `slots`.
3.  For the first two `inkTextureSlot` items, set the value for `DepotPath` to the relative path of your xbm (`tutorial\torso\my_custom_shirt\ops\preview_icons.xbm`):\


    <figure><img src="https://camo.githubusercontent.com/de75d2fe693670acc81643404a2692f00e035694a7ea9f5a5a01949c87162c0e/68747470733a2f2f692e696d6775722e636f6d2f655953666c46472e706e67" alt=""><figcaption></figcaption></figure>
4. Save the file. If it doesn't update, close and re-open it.
5. You now have a tab "PartMapping". You can see which texture corresponds to which slot:\
   [![](https://camo.githubusercontent.com/ebb4bfd08e046d42e7af459b4037371907951856ccbe8eafaabd7610955bd46b/68747470733a2f2f692e696d6775722e636f6d2f5370494d4f306c2e706e67)](https://camo.githubusercontent.com/ebb4bfd08e046d42e7af459b4037371907951856ccbe8eafaabd7610955bd46b/68747470733a2f2f692e696d6775722e636f6d2f5370494d4f306c2e706e67)

## Add it to the yaml

The last three lines in the box below control the icon:

* `atlasResourcePath`: relative path to your .inkatlas file
* `atlasPartName`: slot name in your .inkatlas file (which you can see in the `PartsMapping` tab)

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

{% hint style="warning" %}
Again, please note that indent is **crucial** here, as it determines the node structure. The first line needs to have an indent of 0, the lines from `$base` to `icon` need to have two spaces, and the lines `atlasResourcePath` and `atlasPartName` need to have four.
{% endhint %}

That's it! Time to test!

If you run into any issues with your texture's transparency, please [check the textures import/export guide!](../../../textures/images-importing-editing-exporting.md)
