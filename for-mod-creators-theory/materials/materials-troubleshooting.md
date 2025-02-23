---
description: Troubleshooting guide for materials.
---

# Materials: troubleshooting

## My material ignores transparency!

If you have [done everything correctly](../../modding-guides/textures-and-luts/images-importing-editing-exporting.md), then something in the mesh got borked. Easiest way to fix:&#x20;

* Export your mesh
* Re-name it to act as a backup
* Replace it with something where transparency definitely works
* Import over that mesh
* Copy-paste the material setup from the original mesh

## My material is black and shiny!

That happens when one of the `depotPath`s can't be resolved. Double-check your `values` — [Wolvenkit File Validation](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/file-validation) can help you with this.

### All paths are okay, it's still broken

It's possible that you have a texture ref inside an object that expects mlsetups or mlmasks, or vice versa. File validation can't test for this, so you'll have to do it by hand.&#x20;

Make sure to have the correct kind of cKeyValuePair for your kind of material.

## My material isn't showing at all!

Test if it is the material, or if your mistake is somewhere else. Replace your material's `basePath` with something that you'll definitely recognize, such as `base\environment\decoration\containers\cases\coffin\textures\m_z_gold.mi`.

If the gold material shows up and your custom material doesn't, then you have an issue with the material.

If the gold material also doesn't show up, then your problem lies somewhere else. Maybe the entire [chunk ](../files-and-what-they-do/file-formats/3d-objects-.mesh-files/submeshes-materials-and-chunks.md#chunkmasks-partially-hiding-meshes)is hidden?
