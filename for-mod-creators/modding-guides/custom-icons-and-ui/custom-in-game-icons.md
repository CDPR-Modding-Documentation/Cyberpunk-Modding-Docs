---
description: Creating a custom inkatlas
---

# Custom in-game icons

## Preview images

Okay, now you've added something! But it doesn't have a preview icon yet - you'll have to add this manually. For this purpose, you'll have to edit an image.

{% hint style="warning" %}
For a guide how to ensure image transparency, see [here](../../textures/images-importing-editing-exporting.md).
{% endhint %}

Cyberpunk uses xbm as format for its textures. These textures are then **mapped** (divided into slices) by inkatlas files. The individual slots can then be used by the game for pretty much everything from UI elements to phone call icons — and image previews.

{% hint style="info" %}
If you want to use the in-game previews, you can find them under `base\gameplay\gui\common\icons\items`
{% endhint %}

### Setting up the files

First of all, [download](https://www.mediafire.com/file/3slvnkhjbz0jt65/inkatlas\_templates\_apart\_v1.zip/file) the template archive (kindly provided by Apart). This includes the following files:

| Template                      | Size of slot image |
| ----------------------------- | ------------------ |
| 5\_outfits                    | 160x320 (x5)       |
| 5\_weapons                    | 360x120 (x5)       |
| 40\_items\_inkatlas\_template | 160x160 (x40)      |

This guide assumes that you have a bunch of ready-made icons lying around - if you don't and have no idea where to start, you can check [this](https://drive.google.com/file/d/1aQjb8MpimB9LDNl7y1iTXH13MUvMrKsH/view)[ link](https://drive.google.com/file/d/1aQjb8MpimB9LDNl7y1iTXH13MUvMrKsH/view), section "Making the icon".

Select 40\_items\_inkatlas\_template and copy the **.inkatlas** and the **.xbm** to a folder of your choice inside your Wolvenkit project( this guide will be using `tutorial\ops`).&#x20;

I'm renaming both of them to `preview_icons` so that future me won't be confused about this:

<pre><code><strong>YourWolvenkitProject
</strong><strong>  source
</strong><strong>    archive
</strong><strong>      tutorial  
</strong>	ops		   
      	  - preview_icons.inkatlas  
      	  - preview_icons.xbm      
</code></pre>

1. Export `preview_icons.xbm` via the Export tool — we'll overwrite the resulting file to reimport it.
2. Open  `40_item_template.pdn` in [**paint.net**](https://www.getpaint.net/download.html) and put all your icons in.
3. Once you're done, hide the background layer and overwrite the file you've created in Step 1:

```
<yourModDirectory>\raw\tutorial\ops\preview_icons.png
```

4. Import the file. Make sure that IsGamma is turned off, everything else should already be OK:&#x20;

<figure><img src="https://camo.githubusercontent.com/6191ea85dce6cbf272694a464a89a9c8fdd1333fd9bce8436aec97684e729355/68747470733a2f2f692e696d6775722e636f6d2f486370743652332e706e67" alt=""><figcaption></figcaption></figure>

You can now open `preview_images.xbm` in Wolvenkit and see your new, edited items.
