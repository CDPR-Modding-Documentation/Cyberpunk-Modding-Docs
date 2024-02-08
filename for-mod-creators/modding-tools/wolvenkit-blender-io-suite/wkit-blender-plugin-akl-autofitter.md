---
description: How to use the auto refitter
---

# WKit Blender Plugin: AKL Autofitter

The auto-refitter is a tool developed by [AllKnowingLion](https://app.gitbook.com/u/ntwa3K86ZPgEhR4Ds0rOU5qaKHm1 "mention") that automates the tedious process of refitting meshes for the various body mods.

If you need a tutorial for manual refitting, check [r-and-r-refitting-step-by-step.md](../../modding-guides/items-equipment/recolours-and-refits/r-and-r-refitting-step-by-step.md "mention") or follow the links from there.

## How to auto-refit

With a mesh selected, you can find it in the **Mesh Tools** section of the **CP77** panel. Use the dropdown to select a target body, then click the button to apply the changes:

<figure><img src="../../../.gitbook/assets/blender_plugin_autorefitter.png" alt=""><figcaption></figcaption></figure>

## Modifier cannot be applied to a mesh with shapekeys

Future versions of the plugin will make this process much easier. For now:

1. Duplicate the mesh (Hotkey: `Shift+D`, `Esc`)
2. [Delete the shapekeys](../../3d-modelling/troubleshooting-your-mesh-edits.md#option-2-guaranteed-to-work-delete-garmentsupport-from-the-mesh) from one of the meshes
3. Delete the modifier from the other mesh
4. After the shapekeys are gone, apply the modifier:

<div align="left">

<figure><img src="../../../.gitbook/assets/blender_plugin_apply_modifier.png" alt=""><figcaption></figcaption></figure>

</div>

5. Select the mesh **without shapekeys** (the one you changed by applying the modifier)
6. Switch to the Data tab and create a modifyer by hitting the + button
7. Name your new shapekey `Basis`. This is how it's supposed to look when no shapekeys are active.
8. Select the mesh **with shapekeys** (the one with the original shape)
9. Switch to the Data tab, select the second shapekey in the list, and transfer it:

<div align="left">

<figure><img src="../../../.gitbook/assets/blender_plugin_transfer_shapekeys.png" alt=""><figcaption></figcaption></figure>

</div>

10. Repeat the process with all other shapekeys
11. You can now delete the original mesh.

#### It shrinks too far!

OK, that's a bit nasty, because it means you'll have to either **merge** the shapekeys, or create [garment-support-from-scratch.md](../../3d-modelling/garment-support-how-does-it-work/garment-support-from-scratch.md "mention") (which is easier than it sounds like).&#x20;

If you want to merge, select the shapekey that you want to change, and set its value as high as you can without clipping. Then, select the "New Shape from Mix" entry in the dropdown menu (see the screenshot above).&#x20;

You can now delete your original shapekey and rename the newly-created one (which will be called "Key 2" or something like that) to the original's name.

## The body I want is not supported!

The lattice modifier has to be created from hand and added to the Wolvenkit Blender IO suite.

TODO: This section will eventually document the steps how you can&#x20;

* add a body mod to your local version of the plugin
* share that edit with everyone else by having it added officially

