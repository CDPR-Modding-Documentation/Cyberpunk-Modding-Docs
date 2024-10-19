---
description: Materials for colouring splines (e.g. monowire)
---

# Spline material properties (Monowire)

## Summary

**Created:** Oct 19 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** Oct 19 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

Based on research by **Aanderz** and **wizard bakery**

This page documents monowire materials and their properties.

{% hint style="info" %}
The monowire's wire is a `spline`, not a regular mesh. It will appear invisible in 3d preview and behave in interesting ways if you put any different shader on it than the intended one. Please fuck around, find out, and then document your results!
{% endhint %}

## Monowire Material

&#x20;`base\fx_shaders\nanowire_string_spline_deformed.mt`&#x20;

<table><thead><tr><th width="254"></th><th></th></tr></thead><tbody><tr><td>MainColor</td><td>Influences the color but is overridden by Temperature</td></tr><tr><td>EmissiveMaskPower</td><td>Influences the brightness of the Monowire, but Temperature takes priority.</td></tr><tr><td>StartGradient</td><td>Influences the gray wire near the hand. Set to -1 to disable.</td></tr><tr><td>NoiseScale</td><td>Influences the animation of the Monowire, but Temperature takes priority.</td></tr><tr><td>NoiseAmount</td><td>Noise scale and amount set how much the wire wobbles when used. Unstable wires, which wobble across the entire screen, are set to a scale of 1.5 and amount 50.</td></tr><tr><td>Thickness</td><td>Influences the thickness of the Monowire.</td></tr><tr><td>MinimumEmissive</td><td>Influences the brightness of the Monowire, but Temperature takes priority.</td></tr><tr><td>Emissive</td><td>Influences the brightness of the Monowire, but Temperature takes priority</td></tr><tr><td>Temperature</td><td>The key value. The higher the value, the brighter it gets, and it changes color in the following order as it increases: black → red → orange → yellow → white</td></tr></tbody></table>

