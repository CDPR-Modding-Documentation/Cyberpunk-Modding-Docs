---
description: Documentation of properties, with screenshots if applicable
---

# Multilayered Material: Properties

## Material properties

### colorScale

Sets a color from within the [mltemplate](multilayered-material-properties-1.md#what-is-the-mltemplate) file. Hex codes corresponds to rows and columns in substance painter.

### material

Depot path to the base material [mltemplate](multilayered-material-properties-1.md#what-is-the-mltemplate) from which the surface inherits its properties (lightbreaking, subsurface scattering…).&#x20;

Example values:\
`base\surfaces\materials\paint\car_paint\car_paint_metallic_01.mltemplate`\
`base\surfaces\materials\metal\enameled_hq\enameled_hq_01_30.mltemplate`

### matTile

**Scaling** (tiling multiplier) of the material across the mesh. The higher the value, the smaller it is.

### metalLevelsIn

Clamps metalness **input** levels. This value corresponds to a (generated?) greyscale texture across the entire mesh.

### metalLevelsOut

Clamps metalness **output** levels. This value corresponds to a (generated?) greyscale texture across the entire mesh.

### normalStrength

Applies or ignores the base mesh's normal map to this layer. This value can be greater than 1!

### offsetU

For logos: X-offset on the texture. Used for e.g. targeting a certain label.

### offsetV

For logos: Y-offset on the texture. Used for e.g. targeting a certain label.

### opacity

Transparency of the layer, 0 means that it isn't displayed, 1 means that it's fully visible.

### roughLevelsIn

TODO

### roughLevelsOut

Determines the roughness of a material

<figure><img src="../../../.gitbook/assets/multilayered_properties_roughness.png" alt=""><figcaption><p>How roughness affects a material (the colour was not changed)</p></figcaption></figure>

## Microblend properties

{% hint style="danger" %}
You can only use microblends if this layer's mask is not fully white.
{% endhint %}

### mbTile

Like [#mattile](multilayered-material-properties-1.md#mattile "mention"), this determines the scaling of the microblend. The higher the value, the smaller it is.

### microblend

Depot path to the base microblend texture (xbm), a seamless pattern which will be projected on the surface. Think of an extra normal map that tiles across a layer.

### microblendContrast

A crossfade between the layer mask and the microblend mask (the black parts of the microblend texture). If you set this to >=1, then the layer will be blocked out where the microblend texture is black.

This requires the xbm's AlphaChannel (transparency) to be set up.

### microblendNormalStrength

Like [#normalstrength](multilayered-material-properties-1.md#normalstrength "mention") for the microblend.

### microblendOffsetU

X-offset for the microblend texture.&#x20;

### microblendOffsetV

Y-offset for the microblend texture

