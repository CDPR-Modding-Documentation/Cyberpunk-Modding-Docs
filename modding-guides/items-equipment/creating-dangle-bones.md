---
description: >-
  How to create your own bones for dangle physics without having to copy them from an existing mesh. This process is still experimental!
---

# Creating arbitrary dangle bones

**Published: November 2025 by @infraredbe**

## Background and motivation

To-date, if you wanted to add bones to a mesh, you needed to find a "donor" mesh that had the bones you wanted and manually copy them over in the .mesh representation: Either by converting to JSON, adding the bones, and then converting back; or manually via the Wolvenkit interface. (See [this guide](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/items-equipment/transferring-dangle-bones) for how to do this process.) This process is tedious and limiting because you need to find a specific mesh with your specific bones, and if you wanted to move those bones, you need to follow an even more tedious process to do so (see [this guide](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/3d-modelling/meshes-and-armatures-rigging/dangle-bones/moving-a-dangle-chain)).

The goal for this guide is to allow mod authors to use Blender-native tooling to add arbitrary bones to meshes for use in dangle physics.

## Theory

As best as I've been able to figure out, here are all the elements necessary to make new dangle bones work:

* A .mesh, which besides having the actual 3D model stored, contains the names and the transforms of the bones (you can only see this in Wolvenkit via the "advanced" editing interface, but they are there), as well as the weights of the vertices that correspond to those bones.
* A .rig, which contains the names, local/model space transforms, and parenting relationship of the bones in the .mesh.
* An .animgraph, which contains the dangle simulation parameters of the mesh/rig.

Finally, your .ent needs to have an animated component which points to both your .rig and your .animgraph to make your object come to life.

## Pre-requisites

For each of the above, I've written a tool:

* Mesh Appender Blender plugin to add new bones to the .mesh
* Rig Appender Blender plugin to add new bones to the .rig
* Animgraph Generator to create dangle physics for the .animgraph

Please note that these scripts are provided "as is" and may contain errors! Always use appropriate precautions when running code you've downloaded from the internet.

## Guide

As mentioned earlier, this is still experimental, so many of these steps may break in cases that haven't yet been tested. Please feel free to update this guide or find @infraredbe on the modding Discord to discuss!

### 1. Start your new mesh/rig

Start with a suitable mesh that has most of the bones you will want, typically the T-Bug bodysuit is a good start, or use whatever [this guide](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/items-equipment/adding-new-items) uses. You will also want a .rig to be the basis for your extended armature; for female bodies, use `woman_base_deformation.rig`, and for male `man_base_deformation.rig`. In Wolvenkit, export your chosen .mesh with the `(wo)man_base_deformation.rig` using the `withRig` option in the export interface.

### 2. Create your new model and bones

Import this into Blender; you should get both the model of whatever mesh you started with, as well as an armature with actual parenting relationships. (Your armature's bones will be pointing off to the left -- this is wrong but expected.)

You can now "draw the owl" of the rest of your model, replacing the mesh with your own mesh, and adding new bones to your armature for any dangle bones you will want. Please note that you **can not move any existing bones in this process** -- the way we will export your rig/armature later only impacts net-new bones. Other things to note:

* To avoid issues with the mesh import into Wolvenkit, you'll want to delete the Root bone from your armature. This does not appear to be an issue for the final mesh/rig combination, but it is odd. (Generally it doesn't seem to be a problem if the bones in the mesh and rig do not match 1:1, as long as the intersection of their sets of bones is a superset of the vertex groups in the mesh. In other words, as long as every vertex group has a corresponding bone in both the mesh and the rig, you should be okay.)
* The part of your mesh that you want to be controlled by the dangle should be modeled in its "rest" orientation. Your bones should roughly follow, erring on the side of "nearer" the body rather than "further" from the body.
* Any new bones need to be parented to the existing armature somewhere.
* If you think you'll want "half-cone" or "hinge" dangles, the animgraph generator will have the cone half or the hinge direction point towards +Z of the bone rotation, so use Blender's roll functionality to ensure the bone orientation is how you want it.
* Don't forget to weight-paint your mesh with your new bones (how to do this is outside the scope of this article, but you could look at some examples from Cyberpunk vanilla items to see how dangle weights are typically painted).
    
### 3. Get your new bones, mesh, and rig into Wolvenkit

Once your mesh is done (or, more likely, once you're ready to test an initial form of your mesh), it's time to get it into Wolvenkit, along with your modified rig. (We will handle the animgraph later.)

Because you can't create bones out of thin air while doing a Wolvenkit-import of a .glb (unless [this issue](https://github.com/WolvenKit/WolvenKit/issues/2321) gets resolved), we will add the bones to the .mesh in two steps: First, we will add new bones to a .mesh.json and then Wolvenkit-JSON-convert that into the .mesh format. Then, we will Blender-export our .glb with new vertex weights (corresponding to the new bones added) and Wolvenkit-import this .glb.

The rig is more straightforward: We will add our bones to a .rig.json and then Wolvenkit-JSON-convert that into our .rig.

* .mesh.json: Use the Mesh Appender script, with your new mesh selected, and the "base mesh" being the .mesh.json of the mesh you started with (e.g. the T-Bug .mesh.json). If this works, you should get a count of all the new bones added. Now, convert this .mesh.json to .mesh in Wolvenkit. If you look at your .mesh, you should have all the new bones (only visible in "advanced mode"), but the actual model preview should show whatever mesh you started with.
* .glb: Export from Blender as usual, ensuring that your mesh has weight painting for the new bones you've created in the step above. Now Wolvenkit-import this .glb over the .mesh you created in the previous step. If this works, not only should you see your new bones in the .mesh, you should also see your model in the model preview. This and the previous step have to happen in this order, every time you make changes to the bones or mesh!
* .rig: Use the Rig Appender script, with your new armature selected, and the "base rig" being `(wo)man_base_deformation.rig.json`. You only have to re-run this step if you move/add/delete bones. Convert this in Wolvenkit to get your .rig.

Quick sanity-checks at this point: Wolvenkit-export your new .mesh, using `withRig` with your new .rig, and then import that into Blender. The mesh should be your new model, with proper weight painting on new bones, and your armature should be connected and include your new bones, and your _new_ bones should also be rotated off in weird directions, just like the bones from the base rig.

### 4. Hook up the mesh_entity and test in-game

Time to hook up all these pieces and test in-game! In your `mesh_entity.ent`, create a new `entAnimatedComponent` with `graph` set to a placeholder `animgraph` (if the animgraph doesn't have your bones, there should be no ill effect -- you can use Claire's pants dangle `animgraph` for now), and `rig` set to your new `.rig`. You should be able to test your new mesh in-game; there won't be any dangling yet, but it should load your mesh in its rest position!

**Issues you may run into at this point**

* If the Blender export fails:
    * One issue you'll almost certainly run into is you have vertex groups without weights, or bones without weights. You can follow the [instructions here](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-error-messages#vertex-groups-not-assigned-to-a-bone) to fix.
* If the Wolvenkit import of your .glb fails:
    * `Value was either too large or too small for an unsigned byte`: It's because your .mesh has more than 255 bones. Start with a .mesh that has fewer bones (again T-Bug seems to be the perfect set), or create fewer dangle bones. Remember you can't delete bones from the .mesh using this process, only add.
    * Missing the Root bone: Delete your Root from your armature, and start back over from the .mesh.json export. (Even in vanilla, it seems often that the .rig has a Root bone but the .mesh does not, so this should be fine.)
* Mesh issues in-game:
    * If the vertices with new bones appear to either collapse to your character's origin, or somewhere halfway between its rest position and the origin: One or more of your bones that has vertex weights do not exist in one of, or both of, your .mesh or .rig files. Convert both to .json, and for each new bone, ensure that it exists in both files.

### 5. Generate the animgraph

Next, it's time to generate the animgraph. The Animgraph Generator is partially self-documenting, but the important bits

**Issues you may run into at this point**

* If your mesh doesn't seem to move at all:
    * Is it photo mode? For some reason, mesh physics doesn't seem to kick in until you un-equip and re-equip your item
    * Otherwise, make sure your mesh_entity has the animated component and it points to the correct .rig and .animgraph
