---
description: Properties of the multilayered material
---

# Multilayered Material Properties

## Summary

**Created:** Jan 14 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** Jan 14 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page documents multilayered shader properties.&#x20;

* For an **overview** of glass shaders, see [cheat-sheet-materials.md](../../references-lists-and-overviews/cheat-sheet-materials.md "mention")-> [#multilayered](../../references-lists-and-overviews/cheat-sheet-materials.md#multilayered "mention")
* For an **explanation** of material properties and further links, see [.](./ "mention")

## Multilayered Material

For a full documentation, check the corresponding [page](../multilayered/).&#x20;

To set it up, use these keys for the "values" array of your material:

|                 |                                                                                                                        |
| --------------- | ---------------------------------------------------------------------------------------------------------------------- |
| GlobalNormal    | path\to\normal.xbm                                                                                                     |
| MultilayerMask  | path\to\mask.mlmask ([white file](../../references-lists-and-overviews/cheat-sheet-materials.md#white-multilayermask)) |
| MultilayerSetup | path\to\material.mlsetup                                                                                               |

<figure><img src="../../../.gitbook/assets/material_docu_multilayered_example.png" alt=""><figcaption><p>an example multilayered material</p></figcaption></figure>
