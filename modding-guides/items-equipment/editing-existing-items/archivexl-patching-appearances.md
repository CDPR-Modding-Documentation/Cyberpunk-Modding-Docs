---
description: Modifying game items with minimal conflicts
---

# ArchiveXL: Patching appearances

## Summary

**Published:** July 23 2024 by [Zhincore](https://app.gitbook.com/u/OsI9JXgCSSbt40hb327iBDif7Xv1 "mention")\
**Last documented update:** July 23 2024 by [Zhincore](https://app.gitbook.com/u/OsI9JXgCSSbt40hb327iBDif7Xv1 "mention")

This guide will teach you how to use ArchiveXL's Resource Patching feature to add/modify appearances of existing items without conflicting too much with other mods or even game's updates!

{% hint style="info" %}
Concepts discussed here can be applied to many other areas in the game. See the general guide for more info: [archivexl-resource-patching.md](../../../for-mod-creators-theory/core-mods-explained/archivexl/archivexl-resource-patching.md "mention")
{% endhint %}

## Prerequisites

* [ArchiveXL](https://www.nexusmods.com/cyberpunk2077/mods/4198) >= 1.14 — this will **not work** with older versions
* WolvenKit project with new or modified appearance(s) in .ent/.mesh/.app file(s)
  * If you don't, you should check out [adding-decals.md](adding-decals.md "mention"), [changing-materials-colors-and-textures](changing-materials-colors-and-textures/ "mention")or other guide for your case.

## Step 1: Delete the work of others

For resource patching you only ship what you've made. Open your .ent/.mesh/.app files and delete appearances and materials that were there from vanilla. Keep your custom ones, **make sure your appearances have a unique name**!

<figure><img src="../../../.gitbook/assets/image (13) (1).png" alt=""><figcaption><p>You can select multiple items in a list and then right-click and then Delete Selection.</p></figcaption></figure>

{% hint style="info" %}
When deleting materials, the names might get messy. That's because mats get names from the `materialEntries`array, try to remember what materials are yours and don't forget to delete vanilla entries too. Also **update the index of materialEntries if needed**! (counting begins from 0)
{% endhint %}

You mostly can and probably _should_ delete any other fields that you don't want to change. For example, in `.mesh` files, if you don't change the mesh itself, you should right-click `renderResourceBlob` and choose "Reset Object", same with `lodLevelInfo`. That way the files only contain your changes and the rest is taken from vanilla game.

## Step 2: Move your files out of the way

You should make a special folder for your mod, outside of the vanilla structures. Common pattern is `your_name\mod_name\` (e.g. `zhincore\new_gun_appearance`).&#x20;

<div align="center" data-full-width="false">

<figure><img src="../../../.gitbook/assets/image (15) (1).png" alt=""><figcaption><p>Example folder structure of my mod.</p></figcaption></figure>

</div>

Move all your patch files to your folder, but remember where you took them!

{% hint style="info" %}
For finding the old paths easier, feel free to just copy your files to their new place for now and delete the old ones after step 3.
{% endhint %}

## Step 3: Configure ArchiveXL

Create an `.archive.xl` file in your `resources` folder if you haven't already (reuse it if you have one). It should be named `your_mod_name.archive.xl` (best if you match it with your project name so the normal .archive is named the same).

<figure><img src="../../../.gitbook/assets/image (18) (1).png" alt=""><figcaption><p>My .archive.xl file.</p></figcaption></figure>

Open the file in your favorite text editor and add the following lines:&#x20;

```yaml
resource:
  patch:
    <source_file_path>:
      - <target_file_path>
```

Replace `<source_file_path>` with the relative path to your patch file, e.g. `modder\mod_name\gun_appearance.app`.\
And replace `<target_file_path>` with the relative path to the original file, e.g. `base\weapons\firearms\rifle_assault\militech_ajax\w_rifle_assault__militech_ajax.app`.

{% hint style="info" %}
In WolvenKit's Project Explorer you can right-click a file and choose "Copy relative path" and just paste in into your `.xl` file. You don't have to write the paths manually!
{% endhint %}

You can repeat these lines for all the files you want to patch (just don't duplicate the first two lines).

And you should be good to go! Install your mod and test it.
