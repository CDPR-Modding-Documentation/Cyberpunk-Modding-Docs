---
description: How to edit images and preserve transparency
---

# Images: Importing, editing, exporting

{% hint style="info" %}
For a guide how to import/export textures, see the [Wolvenkit Wiki](../frameworks/redmod/commands/). It is easiest to export a texture, then overwrite the output file, and import it again.
{% endhint %}

## Editing a texture

Editing textures is straightforward: just change them in your image editor of choice. The only hitch for reimport is the **transparency**.

### Paint.NET

[Paint.NET](https://www.getpaint.net/download.html) is a free image editing software for Windows. It supports PNG transparency out-of-the-box.



<figure><img src="../../.gitbook/assets/save_image_paint_dot_net.png" alt=""><figcaption><p>Use 32-Bit to get the highest available image quality.</p></figcaption></figure>

### Adobe Photoshop

To export with transparency in Photoshop, you need an **alpha channel**. Fortunately, creating one is simple. (For the initiated: The alpha channel is just a layer mask over the entire image.)

Find the Channels palette at the bottom right of your Workspace and add a new channel:

<figure><img src="../../.gitbook/assets/textures_create_alpha_channel.png" alt=""><figcaption><p>You now have an alpha channel.</p></figcaption></figure>

Your image will turn black now, because the selected alpha channel will not have transparency yet.

{% hint style="info" %}
To get your image back, select "RGB" on the Channels palette — but we'll stay on the Alpha channel for now.
{% endhint %}

In the layers palette, use your image as selection by ctrl+clicking on the layer's icon:

<figure><img src="../../.gitbook/assets/select_all.png" alt=""><figcaption><p>Layer to selection</p></figcaption></figure>

**With the alpha channel selected**, fill your selection with white to mark the transparent parts. +

{% hint style="info" %}
The fastest way to do that is to press **d**, **x**, **delete**
{% endhint %}

You can now save your image as a PNG with transparency.
