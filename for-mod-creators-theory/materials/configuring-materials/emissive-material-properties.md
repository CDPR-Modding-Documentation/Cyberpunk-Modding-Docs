---
description: 'Properties of emissive (glowing) materials: Let There Be Light'
---

# Emissive Material Properties

## Summary

**Created:** Jan 14 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** Jan 14 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

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
