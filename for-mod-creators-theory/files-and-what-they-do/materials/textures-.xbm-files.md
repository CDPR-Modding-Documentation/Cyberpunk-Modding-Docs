---
description: Details about in-game textures
---

# Textures: .xbm files

## Summary

**Last documented update**: Apr 06 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This wiki page contains documentation about xbm files and their properties.

### Wait, this isn't what I want!

Would you rather…

* Learn the texture behind [textures](../../materials/textures/ "mention")?
* [Edit, import, or export](../../../modding-guides/textures-and-luts/images-importing-editing-exporting.md) textures?
* Learn about [textured materials](../../materials/#textured)?
* Use [a textured material](../../../modding-guides/textures-and-luts/textured-items-and-cyberpunk-materials.md#material-assignments) on your mesh?

## Texture files

`.xbm` files are simply CR2W (REDengine) representations of `.dds` files (all features are included, and they are **nearly** compatible). But since the .xbm file acts as a wrapper around the data, you still need to [convert your textures](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export/textures#importing-textures).

{% hint style="success" %}
Despite the compatibility with `.dds`, the toolchain assumes`.png` as your default format. You can use any other supported format, but you will have to adjust your workflows accordingly.
{% endhint %}

## Header

Any CR2W file includes a section telling the engine how to read it, the **header**. Most of the file encodes texture data, but the header for textures includes:

* size
* mipmapping (lower-resolution versions of the same texture for [LOD](../level-of-detail-lod.md) and streaming)
* texture format
* dimensions (e.g. if your texture data is 1024x1024, but the header says it's 512x512, then the engine will resize it)

### Setup

The setup section of the XBM file is in essence an extension of the header.&#x20;

It contains settings that, more than just describing basic information about the texture, such as:

* bit depth
* texture type
* format
* gamma correction
* streamability
* mip chains
