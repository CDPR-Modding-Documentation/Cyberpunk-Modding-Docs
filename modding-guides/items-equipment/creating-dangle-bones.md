---
description: >-
  How to create your own bones for dangle physics without having to copy them from an existing mesh. This process is still experimental!
---

# Creating arbitrary dangle bones

**Published: xxxx by @infraredbe**

## Background and motivation

To-date, if you needed to add bones to a mesh, you needed to find a "donor" mesh that had the bones you wanted and manually copy them over in the .mesh representation: Either by converting to JSON, adding the bones, and then converting back; or manually via the Wolvenkit interface. (See [this guide](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/items-equipment/transferring-dangle-bones) for how to do that.) This process is annoying and limiting because you need to find a specific mesh with your specific bones, and if you wanted to move those bones, you need to follow an even more annoying process to do so (see [this guide](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/3d-modelling/meshes-and-armatures-rigging/dangle-bones/moving-a-dangle-chain)).

The goal for this guide is to allow mod authors to use Blender-native tooling to add arbitrary bones to meshes for use for dangle physics.

## Theory

As best as I've been able to figure out, here are all the elements necessary to make new dangle bones work:

* A .mesh, which besides having the actual 3D model stored, contains the names and the transforms of the bones (you can only see this in Wolvenkit via the "advanced" editing interface, but they are there), as well as the weights of the vertices that correspond to those bones.
* A .rig, which contains the names, local/model space transforms, and parenting relationship of the bones in the .mesh.
* An .animgraph, which contains the dangle simulation parameters of the mesh/rig.

Finally, your .ent needs to have an animated component which points to both your .rig and your .animgraph to make your object come to life.

## Pre-requisites

For each of the above, I've written a tool:

* Mesh Appender script to add new bones to the .mesh
* Rig Appender script to add new bones to the .rig
* Animgraph Generator to create dangle physics for the .animgraph

## Guide

As mentioned earlier, this is still experimental, so many of these steps may break in cases that haven't yet been tested. Please feel free to update this guide or find @infraredbe on the modding Discord to discuss!

1. Start with a suitable mesh that has most of the bones you will want, typically the T-Bug bodysuit is a good start, or use whatever [this guide](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/items-equipment/adding-new-items) uses. You will also want a .rig to be the basis for your extended armature; `woman_base_deformation.rig` should work for this. In Wolvenkit, export your chosen .mesh with the `woman_base_deformation.rig` using the `withRig` option in the export interface.
2. Import this into Blender; you should get both the model of whatever mesh you started with, as well as an armature with actual parenting relationships. (Your armature's bones will be pointing off to the left -- this is not ideal but expected.) You can now "draw the owl" of the rest of your model, replacing the mesh with your own mesh, and adding new bones to your armature for any dangle bones you will want. Please note that you **can not move any existing bones in this process** -- the way we will export your rig/armature later will only impact net-new bones. Also, any new bones need to be parented to the existing armature somewhere. Weight-paint your mesh with your new bones as well (how to do this is outside the scope of this article, but you could look at some examples from Cyberpunk vanilla items to see how dangle weights are typically painted).
3. Once your mesh is done (or, more likely, once you're ready to test an initial form of your mesh), it's time to get it into Wolvenkit, along with your modified rig. (We will handle the animgraph later.) Because you can't create bones out of thin air while doing a Wolvenkit-import of a .glb (unless [this issue](https://github.com/WolvenKit/WolvenKit/issues/2321) gets resolved), we will add the bones to the .mesh in two steps. First, we will add new bones to a .mesh.json and then Wolvenkit-JSON-convert that into the .mesh format. Then, we will Blender-export our .glb with new vertex weights (corresponding to the new bones added) and Wolvenkit-import this .glb. (I will call this initial.json.mesh and initial.glb, respectively.) The rig is more straightforward: We will add our bones to a .rig.json and then Wolvenkit-JSON-convert that into our .rig.
    * .mesh.json: Use the Mesh Appender script, with your new mesh selected, and the "base mesh" being the .mesh.json of the mesh you started with (e.g. the T-Bug .mesh.json). If this works, you should get a count of all the new bones added. Now, convert this .mesh.json to .mesh in Wolvenkit. If you look at your .mesh, you should have all the new bones (only visible in "advanced mode"), but the actual model preview should show whatever mesh you started with.
    * .glb: Export from Blender as usual, ensuring that your mesh has weight painting for the new bones you've created in the step above. Now Wolvenkit-import this .glb over the .mesh you created in the previous step. If this works, not only should you see your new bones in the .mesh, you should also see your model in the model preview. This and the previous step have to happen in this order, every time you make changes to the bones or mesh!
    * .rig: Use the Rig Appender script, with your new armature selected, and the "base rig" being `woman_base_deformation.rig.json`. Convert this in Wolvenkit to get your .rig.
Quick sanity-checks at this point: Wolvenkit-export your new .mesh, using `withRig` with your new .rig, and then import that into Blender. The mesh should be your new model, with proper weight painting on new bones, and your armature should be connected and include your new bones, and your new bones _should also be rotated off in weird directions_.
4. Time to hook up all these pieces and test in-game! In your `mesh_entity.ent`, create a new `entAnimatedComponent` with `graph` set to a placeholder `animgraph` (you can use Claire's pants dangle animgraph), and `rig` set to your new `.rig`. You should be able to test your new mesh in-game; there won't be any dangling yet, but it should load your mesh in its rest position!

### Issues you may run into at this point

* If the Blender export fails:
    * This is just a normal mesh at this point, you should be able to debug with all the normal means (usually it's because you have vertex groups without weights)
* If the Wolvenkit import of your .glb fails:
    * `Value was either too large or too small for an unsigned byte`: It's because your .mesh has more than 255 bones. Start with a .mesh that has fewer bones (again T-Bug seems to be the perfect set), or create fewer dangle bones
    * Missing the Root bone: Delete your Root from your armature, and start back over from the .mesh.json export. (I haven't exactly figured out if the Root is necessary or not, but it seems often that the .rig has a Root bone but the .mesh does not.)
* If the vertices with new bones appear to either collapse to your character's origin, or somewhere halfway between its rest position and the origin:
    * One or more of your bones either do not exist in your .mesh or .rig files. Convert both to .json, and for each new bone, ensure that it exists in both files.

5. Next, it's time to generate the animgraph.
