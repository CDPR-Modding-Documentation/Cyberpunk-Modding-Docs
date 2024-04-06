---
description: Details about in-game textures
---

# Textures: .xbm files

## Summary

**Last documented update:** Apr 06 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This wiki page contains documentation about xbm files and their properties.

### Wait, this isn't what I want!

Would you rather…

* [Edit, import, or export](../../modding-guides/textures-and-luts/images-importing-editing-exporting.md) textures?
* Learn about [textured materials](../../materials/#textured)?
* Use [a textured material](../../modding-guides/everything-else/textured-items-and-cyberpunk-materials.md#material-assignments) on your mesh?

## Texture files

{% hint style="success" %}
As of 2024, the toolchain assumes`.png` as your default format. You can&#x20;
{% endhint %}

`.xbm` files are simply CR2W (REDengine) representations of `.dds` files. Regardless, you still need to [convert your textures](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export/textures#importing-textures).

{% hint style="info" %}
This means that all features of the DDS format are included, and they are nearly completely compatible out-of-the-box.&#x20;
{% endhint %}

## Header

Any CR2W file includes a section telling the engine how to read it, the **header**. Most of the file encodes texture data, but the header for textures includes:

* size
* mipmapping (lower-resolution versions of the same texture for [LOD](../3d-objects-.mesh-files/level-of-detail-lod.md) and streaming)
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
