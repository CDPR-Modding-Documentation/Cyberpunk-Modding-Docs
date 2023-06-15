---
description: How to set up an atelier store for your mod
---

# Adding items: Atelier integration

This guide will detail how to add an Atelier store with your items. It is part of the [Adding new items](./) ArchiveXL tutorial, but you can complete these steps independently.

{% hint style="warning" %}
You need to install the [VirtualAtelier](https://www.nexusmods.com/cyberpunk2077/mods/2987) mod for this. You also have to add it to your mod's requirements, as the store won't work if users don't have it installed.
{% endhint %}

## Generating an icon

First of all, [download](https://www.mediafire.com/file/3slvnkhjbz0jt65/inkatlas\_templates\_apart\_v1.zip/file) the template archive (kindly provided by Apart) and find the folder `virtual_atelier_inkatlas_icon_template`

```
atelier_icon_template.inkatlas                        << map for the game  
atelier_icon_template.png                             << 200x200px image for a final slot  
atelier_icon_template.xbm                             << game texture  
virtual_atelier_png_to_xbm_import_settings.png        << image, also embedded here  
```

Put the .inkatlas and .xbm into your project (if you're using the [example project](./#grab-the-example-files), they should go into the `ops` folder). Then, rename them to `atelier_icon`:

```
tutorial
  torso
    my_custom_shirt
      ops		   
      	- my_shirt_factory.csv  
      	- translation_strings.json  
      	- preview_icons.inkatlas       
      	- preview_icons.xbm            
      	- atelier_icon.inkatlas        <<<  
      	- atelier_icon.xbm             <<<  
```

Now, create your icon. The process is the same as for "[preview images](adding-items-preview-images.md#fixing-up-your-texture)". The resulting slot will be named `slot_01`.

### Creating the atelier file

1. Visit [this](https://jovial-shockley-612ec8.netlify.app/) website and fill out the information:

| Field                                                      | Content                                                                                                                                               |
| ---------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| Store ID (characters only, w/o spaces, '-', '\_' and etc.) | `MyTutorialAtelierStore`                                                                                                                              |
| Store Name                                                 | `My Tutorial Atelier Store`                                                                                                                           |
| Atlas Resource                                             | <p><code>tutorial/torso/my_custom_shirt/ops/atelier_icon.inkatlas</code><br>⚠Make sure to replace all backward slashes with forward slashes here!</p> |
| Texture Part                                               | `slot_01`                                                                                                                                             |

1. Now, add your item.

| Field     | Content                                                                                |
| --------- | -------------------------------------------------------------------------------------- |
| TweakDBID | <p>as defined in your yaml, e.g.</p><p><code>Items.my_custom_shirt_redwhite</code></p> |
| Price     | Whatever price you want, 0 means that it's free                                        |
| Quality   | Are we settling for anything but legendary here?                                       |

​ Ignore "Icon path" and "description", we have these in the item itself.

1. Click "Add Item". Repeat the process with as many items as you want.
2. Click "Generate".

### Placing the atelier file

Move the atelier file from your download folder to WolvenKit's `resources` folder:

```
resources
  - tutorial_my_custom_tshirt.archive.xl  
  - tutorial_my_custom_tshirt.yaml         
  r6
    scripts
      - MyTutorialAtelierStore-atelier-store.reds         << new file
```

Now, it's time to test! Install the mod and start Cyberpunk.

{% hint style="warning" %}
If starting Cyberpunk via WolvenKit does not generate your atelier store, install the mod and launch the game by regular means.
{% endhint %}

