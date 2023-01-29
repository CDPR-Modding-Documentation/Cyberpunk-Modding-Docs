---
description: Best Practices for actually changing meshes
---

# Mesh sculpting techniques

## Summary <a href="#summary" id="summary"></a>

**Created by @manavortex**\
**Published January 29 2023**

This guide will give you a number of techniques when it comes to editing meshes in Blender (displayed version: 3.4.1)

Assumed skill level: \
\- You have [exported a mesh and imported it into Blender](exporting-and-importing-meshes.md)\
\- You are able to read and comprehend instructions.

## Perquisite: Deleting shapekeys

Before you start editing your mesh, you should delete its shapekeys. This is necessary for the Sculpt Mode to show your changes in real time, and you don't need them anymore after edigint your mesh.

<figure><img src="../../.gitbook/assets/mesh_deform_shapekeys.png" alt=""><figcaption><p>Order matters, because deleting a shapekey will apply it. Start at the bottom!</p></figcaption></figure>

{% hint style="success" %}
Some people have been told to delete the Armature modifier before sculpting. **That's not necessary**!
{% endhint %}

## Sculpting

The obvious approach is to change your mesh by moving vertices. However, this will take **a very long time** and probably be frustrating. A faster way is to use Blender's Sculpt Mode.

{% hint style="info" %}
The downside of the sculpt mode is that it can edit **only the selected mesh**. \
For a workaround, see [here](mesh-sculpting-techniques.md#sculpting-affecting-several-meshes).
{% endhint %}

The Sculpt Mode is pretty much What You See Is What You Get.&#x20;

The easiest tools for beginners are **Elastic Deform** and Smooth&#x20;

{% hint style="info" %}
In the "Tool" panel (Toggle shortcut: N), you can optionally enable symmetry (blue on the picture below).
{% endhint %}

<figure><img src="../../.gitbook/assets/mesh_deform_sculpting.png" alt=""><figcaption><p>Elastic Deform and x-symmetry are your friends!</p></figcaption></figure>

A useful shortcut to keep in mind is **F**, which will let you change the cursor size.

{% hint style="info" %}
You can import a body mesh as reference.&#x20;

You find the player body under\
`base\characters\common\player_base_bodies\player_female_average\`\
`base\characters\common\player_base_bodies\player_male_average\`
{% endhint %}

### Sculpting: Affecting only parts of the mesh

To affect only parts of your mesh, you need to **hide** those parts that you don't want to sculpt.

Use the Edit Mode (Shortcut: Tab) to make a selection. Then, leave only those parts visible that you want to affect before switching back to Sculpt Mode.

{% hint style="info" %}
Useful hotkeys:

* H: Hide selection
* Shift+H: Hide everything **but** selected
* Alt+H: Unhide everything
{% endhint %}

## Sculpting: Affecting several meshes

Unfortunately, there is currently no way to sculpt several meshes at the same time. However, there is a workaround: You can fuse all meshes together, then split them apart after you're done.

Let's assume that we're sculpting Rogue's pants. For surface material assignment, the seams are an own submesh — the pants (submesh\_00) are coloured via [`multilayered`](../modding-cyberpunk-2077/materials-how-to-configure-them/multilayered.md) material, while the seams have a variation of `metal_base` with coloured stitches.

We don't want to edit those separately, so we'll fuse them into one mesh, sculpt everything in one go, and then split them apart again.

To allow splitting, we need to make sure that every submesh has its own unique material. Select the mesh, switch to the "Material Properties tab on the right", and duplicate the assigned material:

<figure><img src="../../.gitbook/assets/mesh_deform_material.png" alt=""><figcaption><p>You can rename the material to e.g. "seams", but it's not necessary.</p></figcaption></figure>

{% hint style="info" %}
Before the next step, make sure to remember the submesh numbers, because you need to restore them later. Changes in the submesh order will mess up material assignment in WolvenKit.

You can create a copy by **duplicating** the meshes (shortcut: Shift+D)
{% endhint %}

Now, join the meshes together — hold CTRL, select the main mesh, and join the meshes together (shortcut: Ctrl+J)

<figure><img src="../../.gitbook/assets/mesh_deform_join.png" alt=""><figcaption></figcaption></figure>

{% hint style="success" %}
You now have a single mesh which you can sculpt at your heart's content.
{% endhint %}

Once you're done, you can separate the meshes again. Switch to **Edit Mode**, then select something that belongs to the former submesh. From the menu, pick the following entry:\
`Select -> Select Similar (Hotkey: Shift+G) -> Material`

Then, split off the selection into its own submesh again: \
`Right-Click -> Separate (Hotkey: P) -> Selection`

{% hint style="success" %}
Make sure to restore the original mesh names before [exporting your mesh from Blender](exporting-and-importing-meshes.md#blender-saving-the-mesh).
{% endhint %}

{% hint style="info" %}
After importing back into WolvenKit, remember to [delete the GarmentSupport](garment-support-how-does-it-work.md) parameters from your mesh, as they will now [produce string cheese](troubleshooting-your-mesh-edits.md#my-mesh-is-string-cheese-exploding-vertices).
{% endhint %}

## Troubleshooting

{% hint style="info" %}
If your problem isn't listed here, check [Troubleshooting your mesh edits](troubleshooting-your-mesh-edits.md).
{% endhint %}

### Sculpt changes don't show before I enter and leave Sculpt Mode

You need to [delete the shapekeys](mesh-sculpting-techniques.md#perquisite-deleting-shapekeys).
