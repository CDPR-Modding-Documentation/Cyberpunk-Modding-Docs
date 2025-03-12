# CCXL: Body Tattoos



## Summary

This page will tell you how to use ArchiveXL to add body tattoos to the character creator

### Wait, this is not what I want!

* To learn more about the character creator, check [files-and-what-they-do](../../../files-and-what-they-do/ "mention") -> [character-creator](../../../files-and-what-they-do/file-formats/character-creator/ "mention")
* If you want to **create** a tattoo first, check out [custom-tattoos-and-scars](../../../../modding-guides/npcs/custom-tattoos-and-scars/ "mention")

## Requirements

* You have a [Wolvenkit Project](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects)
* You have downloaded the example project from [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/19903/), and merged it with your project's `source` folder

{% hint style="warning" %}
We recommend that you use the **suggested paths**, as the template is configured to load files from there, then rename files **at the very end** once everything works.

If you ignore this advice, you're making things needlessly difficult for yourself.
{% endhint %}

## Step 1: Extracting the essentials

In this tutorial, we will create an **overlay mesh** from a base game body mesh, which you can get from the [Asset Browser](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/asset-browser "mention").

{% hint style="info" %}
If you want to create an overlay from a modded body, use the [Mod Browser](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/asset-browser#mod-browser "mention") instead.
{% endhint %}

{% hint style="success" %}
You can look up all mesh paths in [cheat-sheet-body.md](../../../references-lists-and-overviews/cheat-sheet-body.md "mention")
{% endhint %}

This is the path to acquire the gender you want to work on for vanilla V.

<figure><img src="../../../../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>

For the tutorial, I will take male V's right arm:

```
base\characters\common\player_base_bodies\player_man_average\arms_hq\a0_000_pma_base_hq_r.mesh
```

<figure><img src="../../../../.gitbook/assets/image (1).png" alt=""><figcaption></figcaption></figure>

### Rename the .mesh file

{% hint style="warning" %}
If you have downloaded the template project, you'll want to name your tattoo exactly as described below. We will rename it again later, which is easier if you stick to the workflow now.
{% endhint %}

ArchiveXL will do the heavy lifting, but if we leave the body mesh where it is right now, you will break the player body. For that reason, you need to rename the mesh file (you can use Wolvenkit's rename menu - hotkey: `f2`).

For this tutorial, we'll put it in the following path (where the template files expect it):

```
your_modder_name\ccxl\your_tattoo\models\your_tattoo_pma.mesh
```

### Edit the .mesh in Blender

This tutorial will **not** go into details about this process, but you need to

* [#export-from-wolvenkit](../../../modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-import-export.md#export-from-wolvenkit "mention")
* Slightly **inflate** the mesh so that it doesn't clip with the body (you can use a shrinkwrap modifier for this)
* Import back into your project (check the link in the first bullet point)

## Step 2: Setting up the .mesh

In this section, we will configure your `.mesh` file to load the texture(s) via the included `.mi`.

### Explanation

The textures are inside the `textures` folder. They are loaded by the `.mi` file.&#x20;

If you want to tweak the parameters, make sure to edit this file (we will look at it in more detail later).

<div align="left"><figure><img src="../../../../.gitbook/assets/image (6).png" alt=""><figcaption></figcaption></figure></div>

{% hint style="info" %}
You can learn more about meshes and materials on the [3d-objects-.mesh-files](../../../files-and-what-they-do/file-formats/3d-objects-.mesh-files/ "mention") page, and about .mi files under [re-using-materials-.mi.md](../../../files-and-what-they-do/file-formats/materials/re-using-materials-.mi.md "mention").&#x20;

This is not necessary for the purpose of this tutorial.
{% endhint %}

### Let's do it!

1. Open your .mesh file in Wolvenkit
2. Create or edit a `materialEntry`:
   1. Set the name to `your_tattoo`
   2. Set isLocalInstance to `true` (check the box)
3. Create or edit a local material instance:\
   If your mesh does not have `preloadLocalMaterialInstances`, use `localInstances.materials` instead.
   1. Set baseMaterial to `your_modder_name\ccxl\your_tattoo\textures\your_tattoo.mi`\
      (the relative path to the `.mi` file)
4. Create or edit an `appearance`: the `chunkMaterials` need to point at `your_tattoo`.

<figure><img src="../../../../.gitbook/assets/image (3).png" alt=""><figcaption></figcaption></figure>

## Step 3: Setting up the .app

As this is a template project, the `.app` is already configured. Since you moved the .mesh to `your_modder_name\ccxl\your_tattoo\models\your_tattoo_pma.mesh`, you don't need to change anything here:

<figure><img src="../../../../.gitbook/assets/image (7).png" alt=""><figcaption></figcaption></figure>

## Step 4: Renaming the files

Now, use dynamic renaming feature and rename your files.

### Moving your .mesh file

Since our imported mesh is named as `your_tattoo_pma`, the dynamic renaming feature will allow you to rename it to whatever you want. If you ignored our advice, have fun correcting all those entries one by one:

<figure><img src="../../../../.gitbook/assets/image (9).png" alt=""><figcaption></figcaption></figure>

### Moving the other files

You can use the dynamic renaming feature (check the box) to safely move all the files in your project.&#x20;

### The inkcharcustomization file?

Change the `localizedName` entry to something globally unique – call it something like `UI-customization_yourmoddername_my-first-tattoo`.&#x20;

{% hint style="info" %}
If you end up using the same translation key as somebody else, the game might show either entry, and you probably don't want that.
{% endhint %}

<figure><img src="../../../../.gitbook/assets/ccxl_tattoo_mesh_file.png" alt=""><figcaption></figcaption></figure>

## Step 5: The Translation Entry \[The .json]

{% hint style="info" %}
This works the same as in [ccxl-hairs.md](ccxl-hairs.md "mention") -> [#step-5-the-translation-entry](ccxl-hairs.md#step-5-the-translation-entry "mention")
{% endhint %}

This entry defines what the game will display instead of `UI-customization_yourmoddername_my-first-tattoo` (as defined in our .inkcharcustomization file).

`FemaleVariant` is used as default, so you can leave the male variant empty.\


<figure><img src="../../../../.gitbook/assets/image (12).png" alt=""><figcaption></figcaption></figure>

## Step 6: The .xl file

Open the .archive.xl on your project's directory. Here, double-check the paths and make sure that they point at the **relative paths** of your files.

```yaml
customizations:
  male: your_modder_name\ccxl\your_tattoo\your_tattoo_pma.inkcharcustomization
  female: your_modder_name\ccxl\your_tattoo\your_tattoo_pwa.inkcharcustomization
localization:
  onscreens:
    en-us: your_modder_name\ccxl\your_tattoo\localization\your_tattoo.json
```

Note: If you want to do for only one gender, just delete either male or female from the .xl and make sure to pick the mesh path to load the one you want if you want either of the genders. Adapting a tattoo is usually pretty easy! Why not make your mod for both genders?

