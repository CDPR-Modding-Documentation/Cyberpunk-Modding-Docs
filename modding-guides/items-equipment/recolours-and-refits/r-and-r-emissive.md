---
description: How to change the Netrunner suit's glowey bits with ArchiveXL Dynamic Variants
---

# R\&R: Emissive

This page is a part of the [.](./ "mention") guide and will tell you how to change the suits' emissive materials.&#x20;

[The first section](r-and-r-emissive.md#switching-existing-colours) will show you how to swap between existing colours in the .yaml file.

The second section will show you how to [change the existing presets](r-and-r-emissive.md#changing-the-presets).&#x20;

#### **Time to complete:**&#x20;

* \~ 30 min **tops** for the tutorial
* once you know how it works:&#x20;
  * < 1 minute for .yaml edits
  * < 5 minutes for material edits

## Switching existing colours

Since ArchiveXL's [Dynamic Appearances](#user-content-fn-1)[^1] feature is **that** cool, you can switch the emissive material simply by changing the property in the .yaml file.&#x20;

{% hint style="info" %}
This guide gives detailed instructions for how to change the [High Fashion Netrunner Suit](https://www.nexusmods.com/cyberpunk2077/mods/9314), but the same principle applies for **all** items with dynamic appearances.&#x20;

Most mod authors put the list of available appearances as a comment into the .yaml file — the line will be starting with a `#`.
{% endhint %}

{% embed url="https://www.youtube.com/watch?v=qDMW1V5SrTQ" %}
Youtube video of a yaml edit (no sound)\
Written guide below
{% endembed %}

For the Netrunner suit, you can choose from the following emissive colours:

| Static              | Animated                    |
| ------------------- | --------------------------- |
| blue                | glitch\_blue                |
| green               | glitch\_green               |
| orange              | glitch\_orange              |
| pink                | glitch\_pink                |
| violet              | glitch\_violet              |
| turquoise           | glitch\_turquoise           |
| red                 | glitch\_red                 |
| white               | glitch\_white               |
| yellow              | glitch\_yellow              |
| gold _(warm white)_ | glitch\_gold _(warm white)_ |
| black               | glitch\_greenblue           |
|                     | glitch\_darkblue            |
|                     | glitch\_matrix              |
| off                 | glitch\_redblack            |

To change the emissive of an existing suit, you only need to change a text file. Find it in your game directory:

```
Cyberpunk 2077\r6\tweaks\manavortex\_ArchiveXL_Netrunner_variants.yaml
```

Open it in a text editor such as [Notepad++](https://notepad-plus-plus.org/downloads/), and find the list `$instances` near the top of the file. It will look like this:

<figure><img src="../../../../.gitbook/assets/netrunner_suits_emissive.png" alt=""><figcaption><p>For other mods, you will have to edit a different file and different values. Just give it a try, if it doesn't work, you can still put the original file back.</p></figcaption></figure>

Change the current entry against one from the list above.&#x20;

{% hint style="warning" %}
After your edit, make sure of the following things:

* There is still a comma (`,`) after the text you changed
* There is still a colon (`:`) in front of the text you changed
* The line you changed still has the same number of leading spaces (indent). \
  _Only spaces at the beginning matter, anything else is just looking pretty._
{% endhint %}

Save the file and start the game.&#x20;

{% hint style="success" %}
If you did everything correctly, the emissive will now have a different colour.&#x20;

If you made a spelling mistake (or selected the appearance `off`), then the emissive will be gone.

If V is naked, then you fucked up (deleted the , or the :). In that case, remember that you can un-do the last change with `Ctrl+Z`!
{% endhint %}

<details>

<summary>Can I do this for every mod???</summary>

Unfortunately not! The mod author has to enable this feature via [archivexl-dynamic-variants.md](../adding-new-items/archivexl-dynamic-variants.md "mention") and split/colorize their meshes accordingly.

If a mod doesn't mention in the description that they support this feature, you can use the techniques under [r-and-r-colour-editing.md](r-and-r-colour-editing.md "mention") to make your own recolours anyway.

</details>

## Changing the presets

{% hint style="info" %}
This section assumes that you can use Wolvenkit. If you have no idea about that yet, please check the first part of this guide: [r-and-r-your-own-wolvenkit-project.md](r-and-r-your-own-wolvenkit-project.md "mention").
{% endhint %}

All the emissive materials live in .mi files. Inside the archive, they're bundled in this folder:

<pre><code><strong>manavortex\torso\netrunning_suit\textures\emissive
</strong></code></pre>

Each file will be named `emissive_VARIANT`, (`VARIANT` being the colour as listed in the table above). E.g., the file for the regular green emissive will be called `emissive_green.mi`

See [#add-files-from-the-mod-to-your-project](r-and-r-your-own-wolvenkit-project.md#add-files-from-the-mod-to-your-project "mention") on [r-and-r-colour-editing.md](r-and-r-colour-editing.md "mention") for how to extract the file.&#x20;

Open the file in Wolvenkit and check the `values` array. You'll see something like this:

<figure><img src="../../../../.gitbook/assets/netrunner_suits_emissive_properties.png" alt=""><figcaption></figcaption></figure>

You can make changes in the panel on the right — feel free to experiment. You can make a copy first in case you break something, but even then, you can still install the original mod again and re-extract the file.

{% hint style="info" %}
All emissive files use one of two templates:

`manavortex\torso\netrunning_suit\textures\emissive\_emissive_glitch_base.mi`

`manavortex\torso\netrunning_suit\textures\emissive\_emissive_base.mi`

If you are missing any properties, open the template and copy them from there.
{% endhint %}

## OK, what now?

If you're satisfied with your colour, it's time to test! Save your file, then [install and launch](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/menu/toolbar#install-and-launch) your Wolvenkit project:

<figure><img src="https://files.gitbook.com/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-MP_ozZVx2gRZUPXkd4r%2Fuploads%2FUs6kZEwmFHhn8f8QCIKb%2Fwolvenkit_install_and_launch.png?alt=media&#x26;token=66c24ef4-0525-4476-80a2-aaf461f445ac" alt=""><figcaption></figcaption></figure>

If you did everything right, your recolour will now be active. Otherwise, check [r-and-r-troubleshooting.md](r-and-r-troubleshooting.md "mention").

[^1]: To read up on dynamic appearances, check [here](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators/core-mods-explained/archivexl#dynamic-variants). They're amazing, but far out of scope for this guide.
