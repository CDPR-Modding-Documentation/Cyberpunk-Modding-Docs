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



|                         | legacy | dynamic materials                   |
| ----------------------- | ------ | ----------------------------------- |
| Appearances             | 15     | 15                                  |
| mlmask files            | 1      | 1                                   |
| mlsetup fil,es          | 15     | 15                                  |
| #`materialEntries`      | 15     | <mark style="color:green;">1</mark> |
| #`CMaterialInstances`   | 15     | <mark style="color:green;">1</mark> |
| #`chunkMaterials` lists | 15     | <mark style="color:green;">1</mark> |

{% hint style="success" %}
To be **even lazier**, check out [archivexl-resource-patching.md](../../core-mods-explained/archivexl/archivexl-resource-patching.md "mention") and [archivexl-resource-linking.md](../../core-mods-explained/archivexl/archivexl-resource-linking.md "mention")!
{% endhint %}

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

<figure><img src="../../../.gitbook/assets/image (321).png" alt=""><figcaption></figcaption></figure>

* By making the depot path start with a `*`, we tell ArchiveXL that this is a dynamic material
* The value for `{material}` will be passed from the appearance, like this:

<figure><img src="../../../.gitbook/assets/image (322).png" alt=""><figcaption></figcaption></figure>

... and the rest just works.

{% hint style="success" %}
You can use dynamic interpolation in pretty much everything — base material paths or material properties. Just remember to set your Flags to `Soft`, or it will fail.
{% endhint %}

## Step 3: Appearance expansion

But wait, there's more. After using dynamic materials, we've been able to reduce the number of material entries and instances, but there is still a lot of repetition between the appearances - if you've followed this guide so far, each of your appearances has a `chunkMaterials` list that looks the same as all the others except for the different material name. It would be great if we could get rid of that repetition, and we can, with Appearance Expansion.

And it's very simple to do. You simply assign empty `chunkMaterials` lists to all your appearances except the first one, and ArchiveXL will automatically use the first appearance as a template and generate the `chunkMaterials` list by substituting the appearance name:

<div align="left">

<figure><img src="../../../.gitbook/assets/archiveXL_appearance_expansion.png" alt=""><figcaption></figcaption></figure>

</div>

Now, you only have to maintain one chunk list, and the rest of your appearances are simplified down to a single name and nothing else.
