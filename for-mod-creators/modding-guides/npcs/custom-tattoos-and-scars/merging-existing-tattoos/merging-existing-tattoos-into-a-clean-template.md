---
description: >-
  Optional: If you want to merge your tattoos into a clean template, check this
  page.
---

# Merging existing tattoos: into a clean template

## Summary

**Published**: 18 May 2024 by YoursTrulyBilly\
**Last documented edit**: 18 May 2024 by YoursTrulyBilly

This is an **optional sub-page** for the [merging-existing-tattoos.md](../merging-existing-tattoos.md "mention") guide. Only follow the steps here if you want to merge into a clean template — otherwise, you can go on!

### Adding the target file

We will merge both of these tattoos into the file that's loaded by the VTK framework. To get that, we'll download the Modding resources from xBaebSae's [VTK mod](https://www.nexusmods.com/cyberpunk2077/mods/7054?tab=files).

{% hint style="info" %}
For a list of which frameworks overwrite which files, you can check [overlay-list.md](../converting-between-tattoo-frameworks/overlay-list.md "mention")
{% endhint %}

1. In the downloaded zip file, open the subfolder `xBaebsae_VanillaHD_Body`
2. Extract the `base` folder inside into your Wolvenkit project, subfolder `source\archive`:

<figure><img src="../../../../../.gitbook/assets/Screenshot 2024-05-18 151455.png" alt=""><figcaption></figcaption></figure>

3. You only need `v_textures\body`, so you can delete the folder `characters`.&#x20;

{% hint style="success" %}
The file `v_body_d.xbm` contains the naked body texture. You can use that as a reference!
{% endhint %}

<div>

<figure><img src="../../../../../.gitbook/assets/Screenshot 2024-05-18 151548.png" alt=""><figcaption><p>You should now have these files:</p></figcaption></figure>

 

<figure><img src="../../../../../.gitbook/assets/Screenshot 2024-05-18 151354.png" alt=""><figcaption></figcaption></figure>

</div>

4. Now, rename `v_overlay.xbm` (for example to `v_overlay`**`_0.`**`xbm`)

### Why am I renaming this?

Tattoo frameworks work by loading certain **overlays** on top of the regular skin texture. Due to technical limitations, these overlays must be **hardcoded**.

You want to create a new overlay with the merged textures from both of your `.archive` mods. Since all these files will change the same .xbm file, we're creating a backup here.&#x20;

<img src="../../../../../.gitbook/assets/Screenshot 2024-05-18 151943.png" alt="" data-size="original">

