---
description: Details about in-game textures
---

# Textures: .xbm files

This wiki page contains documentation about xbm files and their properties.

## Wait, this isn't what I want!

Would you rather…

* [Edit, import, or export](../textures/images-importing-editing-exporting.md) textures?
* Learn about [textured materials](../materials/#textured)?
* Use [a textured material](../modding-guides/everything-else/textured-items-and-cyberpunk-materials.md#material-assignments) on your mesh?

## TL;DR

.xbm files are simply CR2W representations of DDS files, which are read by REDengine. This means they are nearly completely compatible and all features of DDS files are included in XBM files.

## Header

While most of the XBM file is taken up by the texture data itself, it is useless without a section telling the engine _how_ to read and use this data. Because of this, a part of the XBM file is set apart for the header, where info about the size, mipmapping, and general details of the texture are stored.

The use of this header is for the engine to read the data and adjust it correctly, for example, if your texture data is that of a 1024x1024 texture, but the header says it is 512x512, the engine will read it as 512x512, compromising or otherwise changing how the texture data is displayed.

As well, texture format is stored here. If the texture data is, say, for a 3D texture, while the header says it is a 2D texture, the engine will read it as 2D. As well, mipmap information is kept here, mip maps being lower-resolution versions of the same texture for LOD and texture filtering uses.

## Setup

The setup section of the XBM file is in essence an extension of the header. It contains settings that, more than just describing basic information about the texture, also describe bit depth, texture type, and format, as well as extended features, like gamma correction, streamability, and mipchains.
