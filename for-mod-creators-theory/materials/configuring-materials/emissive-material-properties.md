---
description: 'Properties of Materials with emissive (glowing) parameters: Let There Be Light'
---

# Emissive Material Properties

## Summary

**Created:** Jan 14 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** Mar 1 2025 by [PinkyJulien](https://app.gitbook.com/u/iKTJipgsEBTEnUVSuliSjOUuiJq2 "mention")

This page documents Emissive Material shaders and their properties.&#x20;

* For an **explanation** of material properties and further links, see [.](./ "mention")

***

## <mark style="color:yellow;">Emissive Material</mark>

### `metal_base.remt`

You can make `engine\materials\metal_base.remt` glow by adding the correct parameters, or you can poke through the game files and search for `emissive > .mi` to find Cyberpunk material templates to learn from.&#x20;

For a list of such templates, check [here.](../../references-lists-and-overviews/cheat-sheet-materials.md#emissive-materials)&#x20;

<table><thead><tr><th width="254">PARAMETER</th><th>DESCRIPTION</th></tr></thead><tbody><tr><td>Emissive</td><td>path to emissive texture, e.g. <code>engine\textures\editor\white.xbm</code><br>The texture works like an alpha mask.</td></tr><tr><td>EmissiveEV</td><td>float, e.g. <code>2.0</code>: emissive brightness. Brightness varies depending on your colour. Unless you want to actively blind people, you might want to stay below 4.</td></tr><tr><td>EmissiveColor</td><td>Glow colour as RGB (copy from e.g. <code>mi_neokitsch_fridge_z_emissive.mi</code>)</td></tr></tbody></table>

Find a ready-to-use glowing .mi file [here](https://mega.nz/file/jZdCzRzT#7IJD9dQgBT11TCC2ckzD-FFvm0igbVOr19KqhxAx8Ag).

***

### `device_diode.mt`

You can find the shader under `base/fx/shaders/device_diode.mt`

{% hint style="warning" %}
The properties need to be documented at some point
{% endhint %}

***

### `screen_fluff_{color}.mi` /  `parallaxscreen.mt`

There are several versions, located at `base\materials\screen\`

Screen fluff is the effect used on items with a digital/led decoration like pozer jackets, infovisors, and ocusets. It's also used for a lot of monitors and screens.

All materials using the `parallaxscreen.mt`  baseMaterial share the same parameters.

| PARAMETER                  | DESCRIPTION                                                                                                                           |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| ParalaxTexture             | The image that will be displayed on the screen.                                                                                       |
| LayersSeparation           | Determines the depth of the Paralax effect. Higher the number, deeper the effect.                                                     |
| ScanlineTexture            | Texture of the Scanlines effect. (especially visible when paired with a blinking mask)                                                |
| ScanlinesDensity           | Determines the amount/thickness of the scanlines.                                                                                     |
| Emissive                   | The brightness of the display.                                                                                                        |
| EmissiveColor              | Determines the color of the Emissive.                                                                                                 |
| ScrollMaskTexture          | **GREEN** (scroll1) and **RED** (scroll2) on black mask. Determines how a scrolling animation is applied to the `ParalaxTexture`.     |
| ScrollSpeed1               | Determines the speed of the scrolling animation of the **GREEN** masked area.                                                         |
| ScrollSpeed2               | Determines the speed of the scrolling animation of the **RED** masked area.                                                           |
| ScrollVerticalOrHorizontal | Determines if the scrolling of the masked area will be **Vertical** (0) or **Horizontal** (1).                                        |
| BlinkingMaskTexture        | Black and white mask. Determines which area of the ParalaxTexture will "blink" (white area will be static, **black** area will blink) |
| BlinkingSpeed              | Determines the speed of the blinking of the **BLACK** masked area.                                                                    |
| HSV\_Mod                   | See below.                                                                                                                            |

{% hint style="warning" %}
There are additional properties that haven't been documented yet.
{% endhint %}

#### `HSV_Mod`

Modifies the colour of the screen/glow.&#x20;

| PARAMETER | DESCRIPTION                                                                                                                                                     |
| --------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| X         | Hue. A degree from 0° to 360° in a colour wheel where 0° is red, 120° is green, and 240° is blue, represented as a decimal between 0 and 1. See examples below. |
| Y         | Saturation. A value between 0 and 1, with 1 being fully saturated and 0 being unsaturated.                                                                      |
| Z         | Unknown. Doesn't seem to have an effect.                                                                                                                        |
| W         | Unknown. Doesn't seem to have an effect.                                                                                                                        |

**Examples**

| Colour | Position | Percentage      | X      |
| ------ | -------- | --------------- | ------ |
| Red    | 0°       | 0% (0/360)      | 0.000  |
| Yellow | 60°      | 16.66% (60/360) | 0.1666 |
| Cyan   | 180°     | 50% (180/360)   | 0.5000 |

Results appear to be the same regardless of which version of screen\_fluff is used, but the colour of the `ParalaxTexture` does matter. This can lead to unpredictable results if a coloured `ParalaxTexture` is used. The blend mode (the method used to determine how the colours are combined) applied appears to be divide. Results will be more predictable if a black and white `ParalaxTexture` is used.

***
