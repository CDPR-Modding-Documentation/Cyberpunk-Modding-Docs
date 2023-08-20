---
description: Documentation of properties, with screenshots if applicable
---

# Multilayered Material: Properties

## Material properties

### colorScale

Colour of the material.&#x20;

### material

Depot path to the base material template from which the surface inherits its properties (lightbreaking, subsurface scattering…).&#x20;

Example values:\
`base\surfaces\materials\paint\car_paint\car_paint_metallic_01.mltemplate`\
`base\surfaces\materials\metal\enameled_hq\enameled_hq_01_30.mltemplate`

### matTile

**Scaling** of the material across the mesh. The higher the value, the smaller it is.

### metalLevelsIn

TODO

### metalLevelsOut

This value corresponds to a greyscale texture across the entire mesh.

### normalStrength

Applies or ignores the base mesh's normal map to this layer. This value can be greater than 1!

### offsetU

For logos: X-offset on the texture

### offsetV

For logos: Y-offset on the texture

### opacity

Transparency of the layer, 0 means that it isn't displayed, 1 means that it's fully visible.

### roughLevelsIn

TODO

### roughLevelsOut

Determines the roughness of a material

<figure><img src="../../../.gitbook/assets/multilayered_properties_roughness.png" alt=""><figcaption><p>How roughness affects a material (the colour was not changed)</p></figcaption></figure>

## Microblend properties

### mbTile

Like [#mattile](multilayered-material-properties.md#mattile "mention"), this determines the scaling of the microblend. The higher the value, the smaller it is.

### microblend

Depot path to the base microblend. Contains a seamless pattern which will be projected on the surface. Think of an extra normal map that tiles across a layer.

### microblendContrast

A crossfade between the layer mask and the microblend mask (the black parts of the microblend texture). If you set this to >=1, then the layer will be blocked out where the microblend texture is black.

### microblendNormalStrength

Like [#normalstrength](multilayered-material-properties.md#normalstrength "mention") for the microblend.

### microblendOffsetU

X-offset for the microblend (not sure why you'd need this)

### microblendOffsetV

Y-offset for the microblend (not sure why you'd need this)

