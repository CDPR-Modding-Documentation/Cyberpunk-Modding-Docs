---
description: 'Step 1: How to generate your V''s custom head mesh'
---

# NPV: Preparing the head in Blender

**Created by @manavortex**\
**Published May 13 2023**

This page is a part of the [NPV guide](./). It will show you how to create your V's head in Blender.

## Step 1: Getting head

1. Open the `head` folder
   1. **Optional:** Be confused and/or panic about why there are over 9000 files.&#x20;
2. Look into the `head/morphtargets` folder
   1. **Optional:** Be confused and/or panic about why there are over 9000 files **again**.&#x20;
3. Delete all those files that you aren't using (read on as for how)

{% hint style="info" %}
**It's too many of them!**

True! That's because I included all options for any given V. After you have deleted the ones that you won't be using, you should be left with a maximum of **7** files for female V and 8 files for male V.
{% endhint %}

I have included all meshes and morphtargets from the game files. We'll now thin out the options.

### What the actual fuck are all these files?

{% hint style="info" %}
If you don't care and just want to know what to delete, go [here](npv-preparing-the-head-in-blender.md#deleting-files).
{% endhint %}

#### Meshes vs Morphtargets

We actually only care about the mesh, since that is the file we'll be loading. But because of the customization options, we also need the morphtargets, which will deform the meshes dynamically.&#x20;

For our NPV, we won't do anything dynamic. We will apply the morphtargets in Blender and then never use them again, but I have included them in the files **for the sake of transparency**.

#### Okay, and all those numbers?

The different variants in the character creator correspond to the different meshes. For example, if you select cyberware 3 in the character creator, the mesh that will get loaded is `cyberware_03`. Not so difficult, is it?

Here's what the prefixes mean:

|       |                                                                                                                                         |
| ----- | --------------------------------------------------------------------------------------------------------------------------------------- |
| h0\_  | head (with ears)                                                                                                                        |
| hb\_  | male V only: beard                                                                                                                      |
| heb\_ | eyebrows                                                                                                                                |
| he\_  | eyes                                                                                                                                    |
| ht\_  | teeth                                                                                                                                   |
| hx\_  | <p>applied on top of h0: </p><ul><li>cyberware</li><li>makeup</li><li>freckles</li><li>pimples</li><li>tattoos</li><li>scars </li></ul> |
| l1\_  | ear ring (01-04)                                                                                                                        |

### Deleting files

{% hint style="success" %}
Number in file name <=> Number in character creator
{% endhint %}

Many of the files are **variants** and your V will be using **one or none of them.** That means you have a bunch of files to delete. The table below should give you some oversight.

You need to delete both the `.mesh` file in the `head` folder and the `.morphtarget` file in the `head/morphtargets` folder.

Examples:

| Body gender/variant    | Files not to delete from variants                                                                                                                                                                                                              |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| female V, cyberware 03 | <pre><code><strong>tutorial\npv\your_female_character\head\hx_000_pwa_c__basehead_cyberware_03.mesh
</strong>tutorial\npv\your_female_character\head\morphtargets\hx_000_pwa__morphs_cyberware_03.morphtarget
</code></pre>                    |
| male V, scars 01       | <pre><code>tutorial\npv\your_male_character\head\hx_000_pma_c__basehead_scars_01.mesh
tutorial\npv\your_male_character\head\morphtargets\hx_000_pma__morphs_scars_01.morphtarget
</code></pre>                                                 |
| male V, big beard      | <pre><code>tutorial\npv\your_male_character\head\hx_000_pma_c__basehead_scars_01.mesh
tutorial\npv\your_male_character\head\hb_000_pma_c__basehead_big_beard.mesh
</code></pre>                                                                |
| female V, tattoo 09    | <pre><code>tutorial\npv\your_female_character\head\hx_000_pwa_c__basehead_tattoo_09.mesh
tutorial\npv\your_female_character\head\morphtargets\hx_000_pwa__morphs_tattoo_09.morphtarget
</code></pre>                                           |
| male V, no earring     | <p>Files to delete (0* means "01 - 04"):</p><pre><code>tutorial\npv\your_male_character\head\i1_000_pma_c__basehead_earring_0*.mesh
tutorial\npv\your_male_character\head\morphtargets\i1_000_pma__morphs_earring_0*.morphtarget
</code></pre> |

#### Expected result

After deletions, both `head` and `head/morphtargets` should hold only the files that your V is actually using.&#x20;

For a list, see the [table above](npv-preparing-the-head-in-blender.md#okay-and-all-those-numbers).

| min number | 4                                  |
| ---------- | ---------------------------------- |
| max number | <p>13 (female)</p><p>14 (male)</p> |

## Step 2: Exporting head

1.  Find the Export Tool (Tools -> Export)

    1. Click into the empty row under "name" and write "`morphtarget`"
    2. Check the box in the header to select everything
    3. Click "Export Selected"



    <figure><img src="../../../.gitbook/assets/npv_export_files.png" alt=""><figcaption><p>Export all your morphtargets. Mesh files will be auto-generated for you.</p></figcaption></figure>



2. Switch to your project's `raw` folder or Wolvenkit's `raw` perspective. You will find the entire file structure mirrored there.
3. Navigate to the `head` folder again and find the file `head_import.blend` there.

{% hint style="info" %}
It's a utility file for exactly this process. It needs to go into the `head` folder, because it will automatically import and export the files for you.
{% endhint %}

4. Open it in Blender. It will take you to the **scripting** perspective, where you'll see something like this:

<figure><img src="../../../.gitbook/assets/npv_blender_00_import.png" alt=""><figcaption><p>Looks scary, but you don't have to do anything here!</p></figcaption></figure>

5. Press the play button.
6. The script will now import a bunch of armatures from the `morphtargets` folder. You will see them showing up in the topright corner (see the next screenshot under 7. for how it should look)
7. Switch to the next script in the file, like this:

<figure><img src="../../../.gitbook/assets/npv_blender_00_import_2.png" alt=""><figcaption><p>select "01_apply_shapekeys.py" from the dropdown menu</p></figcaption></figure>

{% hint style="info" %}
If you've been previously afraid of scripting: This is a good place to stop! :))
{% endhint %}

8. Find line 32 and following in the script, and alter the values to those of your V (which you get from **the character preset**, see [here](npv-preparing-the-head-in-blender.md#the-character-preset) for further explanation).&#x20;

<figure><img src="../../../.gitbook/assets/npv_blender_01_apply_shapekeys.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
You don't need to select the eyebrows here, as those are "painted on" later via mesh appearance. The mesh only needs to have the right shape, which is what we're doing here.
{% endhint %}

9. After you've changed the values to those of your V, click the "play" button again. This will apply the morphs to your V's face:

<figure><img src="../../../.gitbook/assets/npv_tutorial_before_after.png" alt=""><figcaption></figcaption></figure>

## Step 4: Importing head

{% hint style="info" %}
Start by deleting the morphtargets — we don't need them anymore.

Remove the entire folder, both from `raw` and `archive`. From now on, it's meshes only!
{% endhint %}

### Exporting from Blender

Now that your head looks the way you want, it's time to run the final script, which will export your changed head to .glb for you:

<figure><img src="../../../.gitbook/assets/npv_blender_03_export.png" alt=""><figcaption><p>Select and run it</p></figcaption></figure>

This will overwrite already existing files, leaving you with a set of import-ready mesh files.&#x20;

Now it's time to get them back into Wolvenkit.

1. Find the Import Tool (Tools -> Import Tool)
2. Click "Import All"
3. You're done!

Now it's time to [hook up stuff for the game files](npv-creating-a-custom-npc.md).

##
