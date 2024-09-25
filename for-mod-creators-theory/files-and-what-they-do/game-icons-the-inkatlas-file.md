# Game icons: The inkatlas file

{% hint style="success" %}
Apart has prepared a reference project with an import-ready inkatlas. You can download it [here](https://mega.nz/file/vUUDEQxS#w66XKJ7acIsnXuJcOBEwPPDcm4GFtSa06MzZccAaX8Y).
{% endhint %}

This page explains the `.inkatlas` file and its logic.

## Wait, this is not what I want!

* Learn how to make [adding-items-preview-images](../../modding-guides/custom-icons-and-ui/adding-items-preview-images/ "mention")&#x20;
* Make a [custom Atelier icon](../../modding-guides/items-equipment/adding-new-items/adding-items-atelier-integration.md#generating-an-icon)
* Find templates (by [Apart](https://app.gitbook.com/u/M4VsHKJyn3PakV5tOmAF87H61wh2 "mention")) in the wiki github's [file section](https://github.com/CDPR-Modding-Documentation/Cyberpunk-Modding-Docs/tree/main/\_resources\_and\_assets/icons)
* Make your own inkatlas with Python: find the script on [The Magnificent Doctor Presto's github](https://github.com/DoctorPresto/Cyberpunk-Helper-Scripts/blob/main/generate\_inkatlas.py). \
  Check [running-python-scripts.md](../3d-modelling/blender-getting-started/running-python-scripts.md "mention") if you don't know how to use this.
* Make your own inkatlas with Photoshop CC (Adobe Creative Suite required): find the plugin on [deadlymustard's github](https://github.com/deadlymustard/inkatlas-utils)

## Summary

The .inkatlas is a map file that slices [**textures**](../../for-mod-creators/materials/textures.md) into [sprites](https://stackoverflow.com/a/34575810) (slots), which are then used by the game for pretty much everything that is a picture - from your HUD to peoples' phone avatars to item preview icons in shops or custom atelier images.&#x20;

Unlike other games, Inkatlas files don't slice by pixel coordinates but by **percentage** as a float value between 0 and 1 . The starting point is the TOPLEFT corner, the ending point is the BOTTOMRIGHT corner.&#x20;

Each slot (`inkTextureAtlasMapper`) has four coordinates. This is a single slot across the entire inkatlas:

<figure><img src="../../.gitbook/assets/inkatlas_coordinates.png" alt=""><figcaption><p>Slightly out of order</p></figcaption></figure>

For example: two sprites in column will be written as:\
(y 0,5; x 0) X (x 1; y 0) for upper sprite and (y 1; x0) X (x 1; y 0,5) for lower

## `inkTextureSlot`s

Each inkatlasa has three different inkTextureSlots, which support different texture resolutions. For the purpose of modding, it is enough if you work with inkTextureSlot 0 (the first one in the list).

If an existing xbm is hooked up, the `Part Mapping` tab will appear, where you can check which parts of your image correspond to each slot name.

{% hint style="warning" %}
As of Wolvenkit 8.11.1, this requires reopening the file.
{% endhint %}

## Inkatlas: Slot names

You target sprites (slots in the inkatlas) via the `atlasPartName` property:&#x20;

<pre class="language-yaml"><code class="lang-yaml"><strong>UIIcon.clothing_my_custom_shirt_factory_name_appearance_root_entity_white_red_Female_:
</strong>    $type: UIIcon
    atlasResourcePath: tutorial\path\subfolder\preview_icons_pwa.inkatlas
    atlasPartName: slot_01
</code></pre>

Any atlasPartName in the `yaml` must correspond with the name of a part in the inkTextureAtlasMapper.  If the corresponding entry can't be found, an empty icon will be displayed.

<figure><img src="../../.gitbook/assets/inkatlas_slot_names.png" alt=""><figcaption><p>You can change field names at your leisure. Depending on the template, there are a bunch of slotIcons already hooked up.</p></figcaption></figure>

You can see which sprite is targeted by any given entry in the `Part Mapping:`

<figure><img src="../../.gitbook/assets/inkatlas partsMapping.png" alt=""><figcaption><p>If you don't have a partsMapping tab, check your texture path and reopen the InkAtlas</p></figcaption></figure>

