# Glass material properties

## Summary

**Created:** Jan 14 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** Jan 14 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page documents glass shaders and their properties.&#x20;

* For an **overview** of glass shaders, see [cheat-sheet-materials.md](../../references-lists-and-overviews/cheat-sheet-materials.md "mention")-> [#glass](../../references-lists-and-overviews/cheat-sheet-materials.md#glass "mention")
* For an **explanation** of material properties and further links, see [.](./ "mention")

## Glass

Cyberpunk's glass material, such as `base\materials\glass_onesided.mt`

{% hint style="info" %}
All glass materials can consider the vertex color attribute, which you can edit [directly in Blender](https://all3dp.com/2/blender-vertex-paint-simply-explained/).&#x20;
{% endhint %}

<table><thead><tr><th width="291"></th><th></th></tr></thead><tbody><tr><td>Opacity</td><td>float, <code>0.0 - 1.0</code>: Controls glass transparency. </td></tr><tr><td>GlassTint</td><td>A texture to tint your glass. (TBD: Does it work as a mask?)</td></tr><tr><td>TintColor</td><td>Glass tint as RGB (copy from e.g. <code>mi_neokitsch_fridge_z_emissive.mi</code>). </td></tr><tr><td>IOR</td><td><a href="https://pixelandpoly.com/ior.html">Index of refraction</a> as float, <code>1.0-2.0:</code> The refraction properties of your material.</td></tr><tr><td>Refraction Depth</td><td>float <code>0.0-10.0:</code> Control refraction amount here.</td></tr><tr><td>FresnelBias</td><td>float, <code>0.0 - 2.0</code>: How much does the glass behave like a lens (that is, warp the picture behind it)?</td></tr><tr><td>BlurRadius</td><td>float, <code>0.0 - 1.0</code>: Blur amount when looking through the glass</td></tr><tr><td>VertexColorTint</td><td>float, <code>0.0 - 1.0</code>: Transparency of vertex colour tint</td></tr></tbody></table>

Find a ready-to-use bottle glass .mi [here](https://mega.nz/file/XJshBTxT#OLiUH1UbZEBJG2izMX2egRxq7vVYzqjg9Tbj-7o2bYQ).&#x20;

### Non-warping glass

For a glass material without view distortion and warping, use `base\vehicles\common\materials\glass_windshield_tinted_black.mi`

<table><thead><tr><th width="291"></th><th></th></tr></thead><tbody><tr><td>Opacity/OpacityBackFace</td><td>float, <code>0.0 - 5.0</code>: Controls glass transparency. OpacityBackFace will only affect inside-facing normals.</td></tr><tr><td>FrontFacesReflectionPower / BackFacesReflectionPower</td><td>float, <code>0.0-10.0</code>: How strongly should the glass reflect?</td></tr><tr><td>TintColor/TintSurface</td><td>Surface and refraction color as RGB (copy from e.g. <code>mi_neokitsch_fridge_z_emissive.mi</code>). </td></tr></tbody></table>

Find a ready-to use glass .mi file [here](https://mega.nz/file/3UkRgJRJ#o8uHKkr1-LaHQ6eUwmbs9A08ZAE-pxYvlseQru9EGhg)&#x20;

### Half-transparent glass

`base\environment\decoration\electronics\devices\device_neokitsch\textures\device_neokitsch_glass_black.mi`

### Device screen glass

`base\fx\shaders\parallaxscreen.mt`

<table><thead><tr><th width="226"></th><th></th></tr></thead><tbody><tr><td>ParalaxTexture</td><td>Texture that your screen should display, e.g. <code>base\materials\placeholder\black.xbm</code></td></tr><tr><td>LayersSeparation</td><td>1</td></tr><tr><td>ScanlinesIntensity</td><td>0</td></tr><tr><td>ScanlinesDensity</td><td>0</td></tr><tr><td>Emissive</td><td>0</td></tr><tr><td>Roughness</td><td>0.200000003</td></tr><tr><td>Metalness</td><td>0</td></tr></tbody></table>

Find a ready-to-use example of a turned-off screen [here](https://mega.nz/file/mMsWlDja#QlZ-jsSHuIJ-E8jYmXRbzrk5wstsDOJXTK3pe7XP89I).
