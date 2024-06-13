---
description: using the import and resource-import commands
---

# Importing Raw Files to REDengine

```

redmod resource-import -depot=<depot> -input=<relative path to file to be imported> -output=<absolute path to the new redengine file>
```

Redmod can be used to import a large variety of files into REDengine formats for use in your mods.

<table><thead><tr><th>Red Engine Format</th><th>Raw Format</th><th data-hidden></th></tr></thead><tbody><tr><td>.fnt (font)</td><td><p>.ttf: TrueType font </p><p>.otf: OpenType font </p><p>.cff: Compact Font Format</p></td><td></td></tr><tr><td>.regionset (Texture Region Set)</td><td>.json: Texture region set definition.</td><td></td></tr><tr><td>.mesh (Mesh)</td><td><p>.xml: Speed Tree XML Resource File .smd: Source Mesh Data </p><p>.fbx: Autodesk FBX</p></td><td></td></tr><tr><td>.curveset (Curve Set)</td><td>.csv Comma Separated Value Table</td><td></td></tr><tr><td>.mlsetup (MultiLayer Setup file)</td><td>.json: MultiLayer Setup JSON File .mlsetup: MultiLayer Setup File</td><td></td></tr><tr><td>.genericanimdb (Generic anim database)</td><td>.csv: csv file</td><td></td></tr><tr><td>.cubemap (Cubemap)</td><td><p>.dds: DirectDraw Surface </p><p>.bmp: Windows Bitmap </p><p>.jpg: Joint Photographics Experts Group .tga: Truevision Targa </p><p>.png: Portable Network Graphics </p><p>.exr: OpenEXR</p></td><td></td></tr><tr><td>.rig (Rig)</td><td>.re CDPR proprietary format</td><td></td></tr><tr><td>.ies (IES Light Profile Data Resource)</td><td>.ies: IES light profile</td><td></td></tr><tr><td>.mlmask (Multilayer Mask)</td><td><p>.tiff: Tagged Image File Format </p><p>.tif: Tagged Image File Format </p><p>.json: JSON</p></td><td></td></tr><tr><td>.rsvg (SvgResource)</td><td>.svg: SVG Resource definition file</td><td></td></tr><tr><td>.xbm (Bitmap Texture)</td><td><p>.dds: DirectDraw Surface </p><p>.bmp: Windows Bitmap </p><p>.jpg: Joint Photographics Experts Group .tga: Truevision Targa </p><p>.png: Portable Network Graphics </p><p>.tiff: Tagged Image File Format </p><p>.tif: Tagged Image File Format </p><p>.exr: EXR </p><p>.cube: Cube LUT</p></td><td></td></tr></tbody></table>
