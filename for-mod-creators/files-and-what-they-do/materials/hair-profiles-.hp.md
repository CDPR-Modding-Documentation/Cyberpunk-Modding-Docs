---
description: What's a hair profile, and how do I use it?
---

# Hair Profiles: .hp

## Summary

This page collects basic information about hair profiles.&#x20;

### Wait, this is not what I want!

* Check [wkit-blender-plugin-import-export.md](../../modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-import-export.md "mention") -> [#hair-profiles-.hp](../../modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-import-export.md#hair-profiles-.hp "mention") for a guide on importing/exporting
* Learn more about [hair-and-skin-material-properties.md](../../materials/configuring-materials/hair-and-skin-material-properties.md "mention") -> [#hair-material](../../materials/configuring-materials/hair-and-skin-material-properties.md#hair-material "mention")

## What's a hair profile?

Via hair profiles, it's possible to quickly and easily create a large variety of hair colour variations without the need of having colour textures. That happens via two arrays:

### gradientEntriesId

Determines the strand to strand colour by using the `Strand_Gradient` texture. The gradient serves to empathize/de-empathize contrast among the black/white scale.&#x20;

Together with the `gradientMap`, this is used to generate varieties of unique hair materials.

### gradientEntriesRootToTip

Is applied to the `Strand_Gradient`  texture to determine the hair colour from start to top. Via gradientStops, the colour positions from root to tip of the strands are determined.
