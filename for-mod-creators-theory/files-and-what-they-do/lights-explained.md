# Lights explained

## Summary

Published: Feb 09 2024 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
Last documented edit: Feb 09 2024 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page gives you an overview about lights at a glance.&#x20;

### Wait, this isn't what I want!

* To learn about shadows in the world, check [environment-shadows.md](file-formats/the-whole-world-.streamingsector/environment-shadows.md "mention")
* To learn about shadows for equipment items, check [meshes-shadows-and-shadow-meshes.md](file-formats/3d-objects-.mesh-files/meshes-shadows-and-shadow-meshes.md "mention")
* For a guide how to add lights to AMM props, check [amm-light-components.md](../3d-modelling/custom-props/amm-light-components.md "mention")
* For a quick overview on lights and their properties, check [cheat-sheet-lights.md](../references-lists-and-overviews/cheat-sheet-lights.md "mention") (currently WIP)
* If you want to learn more about **blocking** light, check [occluders-light-and-light-blocking.md](occluders-light-and-light-blocking.md "mention")

## How do lights work?

{% hint style="warning" %}
IDK either! But maybe someone edits the wiki :/
{% endhint %}

## Directional lights

Cyberpunk uses three types of lights:&#x20;

### Point light

The light is a sphere and is equally bright in every direction

### Spot light

The light is a cone. The sharpness is defined by its inner and outer angle.&#x20;

### Area light

The light is a square (like a light panel).&#x20;

## Light attenuation

Their are two options for light attenuation listed as LA\_InverseSquare and LA\_Linear light attenuation is the falloff of luminance away from the point of origin as the photons spread out \


### LA\_InverseSquare

Inverse square root is the default option and the physically accurate one, This should generally be set by default unless absolutely necessary. LA\_InverseSquare models the falloff of luminance according to the [inverse square root law](https://en.wikipedia.org/wiki/Inverse-square_law).

{% file src="../../.gitbook/assets/Inverse_square_law.svg.png" %}



### LA\_Linear

Linear simply directly drops light luminance according to the set radius of the light. this setting can make a light more obvious or bright overall however does so at the cost off functioning unnatural and potently appearing too bright at distance.



