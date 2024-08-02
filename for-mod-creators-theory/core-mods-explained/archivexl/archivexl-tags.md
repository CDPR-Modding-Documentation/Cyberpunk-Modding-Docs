# ArchiveXL: Tags

## Summary

**Published:** ??? by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** August 2 2024 by LadyLea

This page will tell you about **tags** and how they can be used to influence item behaviour. It also teaches you how [#adding-custom-tags](archivexl-tags.md#adding-custom-tags "mention") can help you conditionally un-hide items.

### Wait, this is not what I want!

* Tags are used for calculating Garment Support score, see  [garment-support-how-does-it-work](../../3d-modelling/garment-support-how-does-it-work/ "mention")
* There is an own page for [influencing-other-items.md](../../../modding-guides/items-equipment/influencing-other-items.md "mention")

## What do tags do?

[Tags](https://github.com/psiberx/cp2077-archive-xl/wiki#visual-tags) are a way to tell Cyberpunk that an item has certain properties and should behave in a certain way. This makes the game apply properties to your items, which can then be utilized by the game and ArchiveXL.

{% hint style="warning" %}
To apply visual tags to an item you must add them to [**visualTags**](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators/modding-guides/items-equipment/influencing-other-items#visualtags-garmentsupport) property of your appearance definition or to [**visualTagsSchema**](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators/modding-guides/items-equipment/adding-new-items/archivexl-dynamic-variants#the-root\_entity) of your root entity template.
{% endhint %}

{% hint style="danger" %}
Tags are case-sensitive!
{% endhint %}

### Base game tags

| Tag             | Effect                                                                      |
| --------------- | --------------------------------------------------------------------------- |
| `hide_H1`       | Hides an item in the `Head` slot.                                           |
| `hide_F1`       | Hides an item in the `Eyes` slot.                                           |
| `hide_T1`       | Hides an item in the `Chest` slot.                                          |
| `hide_T2`       | Hides an item in the `Torso` slot.                                          |
| `hide_L1`       | Hides an item in the `Legs` slot.                                           |
| `hide_S1`       | Hides an item in the `Feet` slot.                                           |
| `hide_T1part`   | Toggles the partial suffix (`&Full` →`&Part`) when applied to `Torso` item. |
| `hide_Hair`     | Hides hair.                                                                 |
| `hide_Genitals` | Hides genitals in uncensored mode and underwear in censored mode.           |

### ArchiveXL tags

| Tag                 | Effect                                                                                                                                                                                                                                                                          |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `hide_Head`         | Hides head.                                                                                                                                                                                                                                                                     |
| `hide_Torso`        | Hides the whole torso.                                                                                                                                                                                                                                                          |
| `hide_LowerAbdomen` | Hides lower abdomen.                                                                                                                                                                                                                                                            |
| `hide_UpperAbdomen` | Hides upper abdomen.                                                                                                                                                                                                                                                            |
| `hide_CollarBone`   | Hides collar bone area.                                                                                                                                                                                                                                                         |
| `hide_Arms`         | <p>Hides all of default arms submeshes. Cyberarms cannot be hidden with this tag<strong>*</strong>          </p><p>(<strong>*</strong><a href="../../../modding-guides/items-equipment/influencing-other-items.md#arms">Arms are terrible and we hates them, precious</a>.)</p> |
| `hide_Thighs`       | Hides thighs.                                                                                                                                                                                                                                                                   |
| `hide_Calves`       | Hides calves.                                                                                                                                                                                                                                                                   |
| `hide_Ankles`       | Hides ankles.                                                                                                                                                                                                                                                                   |
| `hide_Feet`         | Hides feet.                                                                                                                                                                                                                                                                     |
| `hide_Legs`         | Hides the entire legs (including feet)                                                                                                                                                                                                                                          |

{% hint style="info" %}
* Check the [#foot-states](archivexl-suffixes-and-substitutions.md#foot-states "mention") section for more tags concerning [Toggleable Feet](https://www.nexusmods.com/cyberpunk2077/mods/7049).
* Check the [#setting-footwear-sounds](../../../modding-guides/items-equipment/adding-new-items/different-equipment-slots.md#setting-footwear-sounds "mention") for shoe sound tags.
* Check the [#root-entity-tags](archivexl-tags.md#root-entity-tags "mention") section below for more tags.
{% endhint %}

### Base Game Tags and ArchiveXL Tags -  Visual Guides

<div>

<figure><img src="../../../.gitbook/assets/VisualGuide - AXL Tags &#x26; Base Tags - MaleBody - By LadyLea.png" alt="" width="563"><figcaption><p>Visual Guide - Tags - Male Body - By LadyLea </p></figcaption></figure>

 

<figure><img src="../../../.gitbook/assets/VisualGuide - AXL Tags &#x26; Base Tags - Female Body - By LadyLea.png" alt="" width="563"><figcaption><p>Visual Guide - Tags - Female Body - By LadyLea </p></figcaption></figure>

</div>

<div>

<figure><img src="../../../.gitbook/assets/HIDE TAGS - FORCE TAGS - ARMS BY LL.png" alt="" width="375"><figcaption><p>Visual Guide - Tags - Default Arms - By LadyLea </p></figcaption></figure>

 

<figure><img src="../../../.gitbook/assets/VisualGuide - AXL Tags &#x26; Base Tags - Head - By LadyLea.png" alt="" width="375"><figcaption><p>Visual Guide - Tags - Head - By LadyLea </p></figcaption></figure>

</div>

{% hint style="warning" %}
Tags to partially hide default arms and cyberarms are not available, however, you can make use of [Chunkmasks](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators/files-and-what-they-do/3d-objects-.mesh-files/submeshes-materials-and-chunks#chunkmasks-partially-hiding-meshes) with the aid of this [component list for Arms and Cyberarms](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators/references-lists-and-overviews/cheat-sheet-arms) OR you can create your own [Custom Tags](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators/core-mods-explained/archivexl/archivexl-tags#adding-custom-tags).
{% endhint %}

## Root entity tags

There are a few tags that can be added to the root entity **or** in the .app file. Here's a list:

#### EmptyAppearance

{% hint style="warning" %}
This only works for legacy ArchiveXL projects. \
If you're using [archivexl-dynamic-variants.md](../../../modding-guides/items-equipment/adding-new-items/archivexl-dynamic-variants.md "mention"), please use [conditional appearances](../../../modding-guides/items-equipment/adding-new-items/archivexl-dynamic-variants.md#conditional-switching-picking-appearances-by-name) in your .app file.
{% endhint %}

This will hide an item under certain conditions. Add the following tag to the root entity:

**`EmptyAppearance:FPP`**

You have the following other options to achieve the same end:

<table data-header-hidden><thead><tr><th width="209"></th><th></th><th></th></tr></thead><tbody><tr><td>Root entity appearance<br>(<strong>without</strong> dynamic variants)</td><td><code>name</code>: <code>my_appearance&#x26;FPP</code></td><td>.app path: <code>base\characters\appearances\player\items\empty_appearance.app</code><br><code>default</code></td></tr><tr><td>.app <a href="../../../modding-guides/items-equipment/adding-new-items/archivexl-dynamic-variants.md#conditional-switching-picking-appearances-by-name">conditional appearance</a>: change default appearance name</td><td><code>name</code>: <code>my_appearance&#x26;camera=tpp</code></td><td>ArchiveXL will automatically add empty appearances for anything you have not defined</td></tr><tr><td>.app <a href="../../../modding-guides/items-equipment/adding-new-items/archivexl-dynamic-variants.md#conditional-switching-picking-appearances-by-name">conditional appearance</a>: add empty appearance yourself</td><td><code>name</code>: <code>my_appearance&#x26;camera=fpp</code></td><td>no partsValues, no components.<br>Do not do this - use the line above this one instead!</td></tr></tbody></table>

**`force_Hair`**

A tag that forces hair to show up while wearing a head item. By default, head items turn hair invisible. By adding this tag to the root entity, you can override this process.

**`force_FlatFeet`**

A tag that forces female V's feet to be flat. Only works with a foot item as `$base` in the `.yaml`: use this if you're making flat shoes and don't want female V's feet to look as if she was wearing heels.

{% hint style="warning" %}
This tag will turn feet invisible for mascV unless the user has switch feet installed. You want to apply this to a conditional appearance in the .app file (`&gender=m`)
{% endhint %}

## Adding Custom tags

Custom tags let you set [component chunk masks](../../files-and-what-they-do/components/#chunkmask) from the .xl file without the need of touching either .app or .ent file.

{% hint style="danger" %}
For this, it is mandatory that you have unique component names. If you include your modder name, it's unlikely that anyone will overwrite them by accident.
{% endhint %}

### **Why would I need this?** [partsOverrides](../../files-and-what-they-do/appearance-.app-files/#partsoverrides) **exists!**

1. PartsOverrides can't un-hide components for you. It can only hide them. If you want to load a different mesh (for example, a de-formed hakama when wearing a kimono or haori), then you're flat out of luck.
2. By being clever about your submeshes, you can offer different versions of your mesh (cropped! No arms! No legs), and users only need to install an .xl file! No need to have different meshes or even different .archive files.

Not convinced? Pity, but if you find a new use case for those things, do [edit it in](https://app.gitbook.com/invite/-MP5ijqI11FeeX7c8-N8/H70HZBOeUulIpkQnBLK7)!

### **Example**

#### Registering the tag

Add custom tags **in your `.xl` file** (not in your `.yaml`!)

```
overrides:
  tags:
    my_custom_unhiding_tag:
      my_hidden_component_name: {show: [0, 1, 2, 3]}
    my_HideSeamfix:
      t0_000_pma_base__full_seamfix: {hide: [0, 1, 2, 3]}
```

#### Connecting the tag with the item

Simply add the tag to your appearance's tags array near the bottom of the individual entries.

<figure><img src="../../../.gitbook/assets/hiding_custom_tags.png" alt=""><figcaption></figcaption></figure>
