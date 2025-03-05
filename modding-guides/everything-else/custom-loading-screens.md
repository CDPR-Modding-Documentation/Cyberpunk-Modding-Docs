---
description: Replace in-game Loading Screens with your own pictures
icon: paintbrush-pencil
---

# Customize in-game Loading Screens

## <mark style="color:blue;">▶</mark> <mark style="color:yellow;">Summary</mark> <a href="#summary" id="summary"></a>

> **Created & Published:** Summer 2021 by [PinkyJulien](https://app.gitbook.com/u/iKTJipgsEBTEnUVSuliSjOUuiJq2 "mention")\
> **Last Documented Update:** 2 March 2025 **by** [PinkyJulien](https://app.gitbook.com/u/iKTJipgsEBTEnUVSuliSjOUuiJq2 "mention")

For this guide, you'll need:

* Recent [WolvenKit ](../../for-mod-creators-theory/modding-tools/wolvenkit.md)version
* [Basic modding knowledge](../items-equipment/recolours-and-refits/r-and-r-your-own-wolvenkit-project.md)

***

## <mark style="color:yellow;">◼</mark> Loading Screens

There are two types of loading screens; each require different workflow to customize them

The first type of loading screens are the ones used when you launch the game.\
I'll call them "Dynamic" loading screens - they use multiple assets and effects.&#x20;

<figure><img src="../../.gitbook/assets/image (589).png" alt=""><figcaption><p>"Dynamic" Loading Screen</p></figcaption></figure>

And the second type are the ones used when you fast-travel or load a save file when already in-game.\
These are simple images - I'll call them "Static" loading screens.

<figure><img src="../../.gitbook/assets/image (590).png" alt=""><figcaption><p>"Static" Loading Screen</p></figcaption></figure>

***

## <mark style="color:yellow;">◼</mark> Customizing Static loading screens

There are two different pool of images the game can choose from depending on whenever you have Phantom Liberty installed or not. It also depends on your game progression; once you start the main PL mission, the game will use the EP1 loading screens.

<mark style="color:blue;">▶</mark> **Vanilla Static Loading Screens Folder**

> `base\gameplay\gui\fullscreen\loading\`

<mark style="color:blue;">▶</mark> **Phantom Liberty Static Loading Screens Folder**

> `ep1\gameplay\gui\fullscreen\loading\`

Since these are static loading screen, customizing them is easy;

* If you plan on modding a personal/private loading screen mod, only edit the resolution you need\
  &#xNAN;_(regular for high graphic setting - 720p and/or 1080p for low graphic setting)_
* If you plan on making and sharing a public mod, it is recommend to swap all available resolutions

For the sake of this guide, I'll only edit the regular HQ loading screens images

<figure><img src="../../.gitbook/assets/image (591).png" alt=""><figcaption><p>Phantom Liberty Static Loading Screens Folder</p></figcaption></figure>

Add the desired loading screens `.xbm` files to your project \
Export them to `.png` using the [exporting tool](../../for-mod-creators-theory/modding-tools/redmod/exporting-resources-to-raw-formats/exporting-.xbm.md)

<figure><img src="../../.gitbook/assets/image (592).png" alt=""><figcaption><p>Exported files in your project RAW folder</p></figcaption></figure>

Open the .png files in your favorite image editing software and replace them with your desired pictures

Save over the exported `.png` files in your RAW folder\
Then use wkit [import tool](../textures-and-luts/images-importing-editing-exporting.md#importing-a-texture) to import your `.png` back to `.xbm`

Pack your mod, launch your game and use a fast-travel station to see your edits!

<figure><img src="../../.gitbook/assets/image (593).png" alt=""><figcaption><p>Customized Static Loading Screen</p></figcaption></figure>

***

## <mark style="color:yellow;">◼</mark> Customizing Dynamic loading screens

Similar to Static loading screens, there are two different pools of Dynamic screens available if you have Phantom Liberty installed.&#x20;

<mark style="color:blue;">▶</mark> **Vanilla Dynamic Loading Screens Folder**

> `base\gameplay\gui\world\loading_screens\`

<mark style="color:blue;">▶</mark> **Phantom Liberty Dynamic Loading Screens Folder**

> `ep1\gameplay\gui\world\loading_screens\`

{% hint style="warning" %}
Swapping process for Dynamic loading screens not yet tested and need documentation.
{% endhint %}
