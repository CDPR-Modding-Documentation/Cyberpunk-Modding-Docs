---
description: How to use ArchiveXL's new material property interpolation
---

# ArchiveXL: dynamic materials

## Summary

**Published:** May 01 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** May 01 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

## Prerequistes

* [ArchiveXL](https://www.nexusmods.com/cyberpunk2077/mods/4198) >= 1.13 — this will **not work** with older versions

### Assumed skill level

* You have a general understanding of how materials work (or read up on it under [#material-assignment](../../files-and-what-they-do/3d-objects-.mesh-files/#material-assignment "mention"))
* You have a Wolvenkit project and a mesh as well as a bunch of .mlsetups

## Why is this better than [.mi files](../../files-and-what-they-do/materials/re-using-materials-.mi.md)?

Because it's even lazier: For a mesh with 15 appearances, you need...



|                       | legacy | dynamic materials                   |
| --------------------- | ------ | ----------------------------------- |
| Appearances           | 15     | 15                                  |
| mlmask files          | 1      | 1                                   |
| mlsetup fil,es        | 15     | 15                                  |
| #`materialEntries`    | 15     | <mark style="color:green;">1</mark> |
| #`CMaterialInstances` | 15     | <mark style="color:green;">1</mark> |

## The problem

Normally, your materials look like this: a bunch of different appearances with the same `.mlmask`, but one `.mlsetup` file for each colour:

<figure><img src="../../../.gitbook/assets/archivexl_non-dynamic_materials.png" alt=""><figcaption></figcaption></figure>

The more variations you have, the more duplication you have, because you need to register a `materialEntry`  for each material, and then create a material for each of those. Traditionally, you do that by duplicating the last entry and changing the depot path. Tedious and not fun, right?

This is where the new technique kicks in.

## Step 1: Dynamic material assignments

We start by changing our `chunkMaterial` names. By appending the suffix `@dynamic`, we're telling ArchiveXL to map them to the `CMeshMaterialEntry` with the same name.

Instead of 15 `materialEntries`, we're down to one.

<figure><img src="../../../.gitbook/assets/archivexl_dynamic_materials_the_instance" alt=""><figcaption></figcaption></figure>

## Step 2: the material instance

Now, we need to adjust the material instances. We can delete all but one, since our `@dynamic` will contain everything that we need.&#x20;

{% hint style="warning" %}
The Flags for any dynamic material must be set to `Soft`, and the depot path must start with a \*. [File Validation](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/file-validation) will warn you about this.
{% endhint %}

Since that one won't change, we can leave the `MultilayerMask` alone. For the MultilayerSetup, we need to change both the `DepotPath`:

<figure><img src="../../../.gitbook/assets/image (299).png" alt=""><figcaption></figcaption></figure>

* By making the depot path start with a `*`, we tell ArchiveXL that this is a dynamic material
* The value for `{material}` will be passed from the appearance, like this:

<figure><img src="../../../.gitbook/assets/image (300).png" alt=""><figcaption></figcaption></figure>

... and the rest just works.
