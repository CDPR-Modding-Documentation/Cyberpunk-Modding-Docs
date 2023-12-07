---
description: How to set up an atelier store for your mod
---

# Your own Atelier Store

This guide will detail how to add an Atelier store with your items. It is part of the [Adding new items](../items-equipment/adding-new-items/) ArchiveXL tutorial, but you can complete these steps independently.

{% hint style="warning" %}
You need to install the [VirtualAtelier](https://www.nexusmods.com/cyberpunk2077/mods/2987) mod for this.&#x20;

You also have to add it to your mod's requirements, as atelier stores will cause script errors if users don't have it installed.
{% endhint %}

## Generating an icon

First of all, [download](https://www.mediafire.com/file/3slvnkhjbz0jt65/inkatlas\_templates\_apart\_v1.zip/file) the template archive (kindly provided by Apart) and find the folder `virtual_atelier_inkatlas_icon_template` with the following files:

```
atelier_icon_template.inkatlas                        << map for the game  
atelier_icon_template.png                             << 200x200px image for a final slot  
atelier_icon_template.xbm                             << game texture  
virtual_atelier_png_to_xbm_import_settings.png        << image, also embedded here  
```

Put the .inkatlas and .xbm into your project (if you're using the [example project](../items-equipment/adding-new-items/#grab-the-example-files), you can put them into the `ops` folder). Then, rename them to `atelier_icon`:

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

Now, create your icon. The process is the same as for "[preview images](../custom-icons-and-ui/adding-items-preview-images/#fixing-up-your-texture)". The resulting slot will be named `slot_01`.

### Creating the atelier file

1. Visit [this](https://jovial-shockley-612ec8.netlify.app/) website and fill out the information:

| Field                                                      | Content                                                                          |
| ---------------------------------------------------------- | -------------------------------------------------------------------------------- |
| Store ID (characters only, w/o spaces, '-', '\_' and etc.) | `MyTutorialAtelierStore`                                                         |
| Store Name                                                 | `My Tutorial Atelier Store`                                                      |
| Atlas Resource                                             | <p><code>tutorial/torso/my_custom_shirt/ops/atelier_icon.inkatlas</code><br></p> |
| Texture Part                                               | `slot_01`                                                                        |

2. Now, add your item.

{% hint style="warning" %}
In `atlasResource`, you have to replace all `\` with `/`

Your atelier store will cause script errors if you don't.
{% endhint %}

<table><thead><tr><th width="231">Field</th><th>Content</th></tr></thead><tbody><tr><td>TweakDBID</td><td><p>as defined in your yaml, e.g.</p><p><code>Items.my_custom_shirt_redwhite</code></p></td></tr><tr><td>Price</td><td>Whatever price you want, 0 means that it's free</td></tr><tr><td>Quality</td><td>Are we settling for anything but legendary here?</td></tr></tbody></table>

​ Ignore "Icon path" and "description", we have these in the item itself.

3. Click "Add Item". Repeat the process with as many items as you want.
4. Click "Generate".

{% hint style="danger" %}
In the downloaded file, check that `atlasResource` has forward slashes `/` instead of backwards slashes `\`, as per the warning box above.
{% endhint %}

### Placing the atelier file

In your project's `resources` folder, create a subdirectory r6/scripts (if it doesn't exist already), and move the atelier file that you downloaded into there:

```
resources
  - tutorial_my_custom_tshirt.archive.xl  
  - r6
    - tweaks
      - tutorial_my_custom_tshirt.yaml         
    - scripts
      - MyTutorialAtelierStore-atelier-store.reds         << new file
```

Now, it's time to test! Install the mod and start Cyberpunk.

## Troubleshooting

### My atelier store causes scripting errors!

I'm not sure how you managed to read past all the red and yellow boxes on this page, but make sure that the path under `atlasResource` has forward slashes `/` instead of backwards slashes `\`.

If that wasn't it, you might have to re-generate your Atelier store.

### My atelier store makes the game crash!

That happens when there are two atelier stores with the same store ID. Do a full-text search for the store ID (`MyTutorialAtelierStore`) in `r6\scripts` and make sure that you don't have any duplicates.

