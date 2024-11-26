---
description: Creating a custom inkatlas
---

# Custom in-game icons

## Tools needed:&#x20;

[Wolvenkit ⇗](https://wiki.redmodding.org/wolvenkit/getting-started/download)\
[Paint.net ⇗](https://www.getpaint.net/download.html)

## Preview images

Okay, now you've added something! But it doesn't have a preview icon yet - you'll have to add this manually. For this purpose, you'll have to edit an image.

{% hint style="warning" %}
For a guide how to ensure image transparency, see [here](../textures-and-luts/images-importing-editing-exporting.md) ⇗.
{% endhint %}

Cyberpunk uses **xbm** as format for its textures. These textures are then **mapped** (divided into slices) by **inkatlas** files. The individual slots can then  use these individual slices for various purposes, such as UI elements like phone call icons and image previews.

{% hint style="info" %}
If you want to use the in-game previews, you can find them under `base\gameplay\gui\common\icons\items`
{% endhint %}

### Setting up the files

Download the template archive:\
\
[**Template Download ⇗**\
](https://www.mediafire.com/file/3slvnkhjbz0jt65/inkatlas_templates_apart_v1.zip/file)\
This includes the following files:

| Template                      | Size of slot image |
| ----------------------------- | ------------------ |
| 5\_outfits                    | 160x320 (x5)       |
| 5\_weapons                    | 360x120 (x5)       |
| 40\_items\_inkatlas\_template | 160x160 (x40)      |

<figure><img src="../../.gitbook/assets/image (344).png" alt=""><figcaption><p>The template provided contains these folders</p></figcaption></figure>

**Template Credits: Apart**

{% hint style="info" %}
This guide assumes you already have a collection of pre-made icons. If you don't and are unsure where to begin, you can refer to [The item addition guide ⇗](https://drive.google.com/file/d/1aQjb8MpimB9LDNl7y1iTXH13MUvMrKsH/view), specifically the "Making the icon" section for guidance.
{% endhint %}



From the template file, choose "<mark style="background-color:blue;">40\_items\_inkatlas\_template</mark>" and paste both the **.inkatlas** and **.xbm** files into a folder of your preference within your Wolvenkit project.&#x20;

In this guide, we'll use the `tutorial\ops` folder as an example.\
\
We are renaming both files to `preview_icons` to avoid confusion in the future:

<pre><code><strong>YourWolvenkitProject
</strong><strong>  source
</strong><strong>    archive
</strong><strong>      tutorial  
</strong>	ops		   
      	  - preview_icons.inkatlas  
      	  - preview_icons.xbm      
</code></pre>

1. Export `preview_icons.xbm` via the **Export tool.**
2. Open  `40_item_template.pdn` (Provided on the template archive) in [**paint.net**](https://www.getpaint.net/download.html) and put all your icons in.
3. Once you're done, hide the background layer and overwrite the file you've created in Step 1:

```
<yourModDirectory>\raw\tutorial\ops\preview_icons.png
```

4. Import the file using the **Import Tool.** Make sure that "IsGamma" under the Import tool options is turned **off**, everything else should already be OK.\
   You can now open `preview_images.xbm` in Wolvenkit and see your new, edited items.
5. Link the **xbm** file to the **inkatlas:** copy the relative path (right click on the file -> "copy relative path") and paste it on the texture slot on the **inkatlas** (image A)
6.

    <div align="left" data-full-width="true"><figure><img src="../../.gitbook/assets/image (209).png" alt=""><figcaption><p>Image A</p></figcaption></figure></div>
7. _<mark style="color:red;">(Optional)</mark>_ If you want to connect the **inkatlas** with your item, refer to the [ArchiveXL **⇗** ](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators/modding-guides/custom-icons-and-ui/adding-items-preview-images)guide for detailed instructions. \
   \
   In the YAML file created for your item, include the path in the "icon" section (Image B).\


```
  icon:
    atlasResourcePath: base\40_item_template.inkatlas
    atlasPartName: slot_01
```



<figure><img src="../../.gitbook/assets/image (210).png" alt=""><figcaption><p>Image B (Optional)</p></figcaption></figure>

