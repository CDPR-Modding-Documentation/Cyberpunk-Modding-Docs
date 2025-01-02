---
description: 'Properties of emissive (glowing) materials: Let There Be Light'
---

# Emissive Material Properties

## Summary

**Created:** Jan 14 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** Dec 30 2024 by [Sumi](https://app.gitbook.com/u/7RcQS2blS1QZY9a7AwDx4GUHnsJ2 "mention")

This page documents glass shaders and their properties.&#x20;

* For an **overview** of emissive shaders, see [cheat-sheet-materials.md](../../references-lists-and-overviews/cheat-sheet-materials.md "mention")-> [#emissive-materials](../../references-lists-and-overviews/cheat-sheet-materials.md#emissive-materials "mention")
* For an **explanation** of material properties and further links, see [.](./ "mention")

## Emissive Material

### metal\_base.remt

You can make `engine\materials\metal_base.remt` glow by adding the correct parameters, or you can poke through the game files and search for `emissive > .mi` to find Cyberpunk material templates to learn from.&#x20;

For a list of such templates, check [here.](../../references-lists-and-overviews/cheat-sheet-materials.md#emissive-materials)&#x20;

<table><thead><tr><th width="254"></th><th></th></tr></thead><tbody><tr><td>Emissive</td><td>path to emissive texture, e.g. <code>engine\textures\editor\white.xbm</code><br>The texture works like an alpha mask.</td></tr><tr><td>EmissiveEV</td><td>float, e.g. <code>2.0</code>: emissive brightness. Brightness varies depending on your colour. Unless you want to actively blind people, you might want to stay below 4.</td></tr><tr><td>EmissiveColor</td><td>Glow colour as RGB (copy from e.g. <code>mi_neokitsch_fridge_z_emissive.mi</code>)</td></tr></tbody></table>

Find a ready-to-use glowing .mi file [here](https://mega.nz/file/jZdCzRzT#7IJD9dQgBT11TCC2ckzD-FFvm0igbVOr19KqhxAx8Ag).

### device\_diode.mt

You can find the shader under `base/fx/shaders/device_diode.mt`

{% hint style="warning" %}
The properties need to be documented at some point
{% endhint %}

### screen\_fluff\_{color}.mi

There are several versions, located at `base\materials\screen\`

Screen fluff is the effect used on items with a digital/led decoration like pozer jackets, infovisors, and ocusets.

|                   |                                                                          |
| ----------------- | ------------------------------------------------------------------------ |
| ParalaxTexture    | The image that will be displayed on the screen.                          |
| Emissive          | The brightness of the display.                                           |
| ScrollMaskTexture | Determines how a scrolling animation is applied to the `ParalaxTexture`. |
| HSV\_Mod          | See below.                                                               |

{% hint style="warning" %}
There are additional properties that haven't been documented yet.
{% endhint %}

#### HSV\_Mod

Modifies the colour of the screen/glow.&#x20;

|   |                                                                                                                                                                 |
| - | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| X | Hue. A degree from 0° to 360° in a colour wheel where 0° is red, 120° is green, and 240° is blue, represented as a decimal between 0 and 1. See examples below. |
| Y | Saturation. A value between 0 and 1, with 1 being fully saturated and 0 being unsaturated.                                                                      |
| Z | Unknown. Doesn't seem to have an effect.                                                                                                                        |
| W | Unknown. Doesn't seem to have an effect.                                                                                                                        |

**Examples**

| Colour | Position | Percentage      | X      |
| ------ | -------- | --------------- | ------ |
| Red    | 0°       | 0% (0/360)      | 0.000  |
| Yellow | 60°      | 16.66% (60/360) | 0.1666 |
| Cyan   | 180°     | 50% (180/360)   | 0.5000 |

Results appear to be the same regardless of which version of screen\_fluff is used, but the colour of the `ParalaxTexture` does matter. This can lead to unpredictable results if a coloured `ParalaxTexture` is used. The blend mode (the method used to determine how the colours are combined) applied appears to be divide. Results will be more predictable if a black and white `ParalaxTexture` is used.
