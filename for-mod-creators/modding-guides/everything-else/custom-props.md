---
description: How to create custom props to use with AMM or sector editing
---

# Custom props

## Summary <a href="#summary" id="summary"></a>

**Created by @manavortex**\
**Published April 2023, updated July 2023**

This guide will teach you how to create a customizable by chaining an .ent, an .app, and a .mesh file with multiple appearances.&#x20;

{% hint style="info" %}
For a guide on how to make meshes out of 2d textures, see [here](your-image-as-custom-mesh.md).
{% endhint %}

Its focus is on the **file structure** and the **relations between the files**. If you want more hands-on tips what you can do with materials, check [here](textured-items-and-cyberpunk-materials.md) or [here](../../materials/).&#x20;

**It uses the following versions:**

* Cyberpunk 2077 game version 1.6.1 (DLSS)
* [WolvenKit](https://github.com/WolvenKit/WolvenKit-nightly-releases/releases) >= 8.8.1
* [Appearance Menu Mod](https://www.nexusmods.com/cyberpunk2077/mods/790) (>= version 2.1, anything earlier won't have customizable appearances)
* Optional, but recommended if you want to create multiple props: [Notepad++](https://notepad-plus-plus.org/downloads/)

**Level of difficulty:** You know how to read.

## Setting up the project

This section will tell you how to get the files, then give you an [explanation](custom-props.md#explanation-what-did-you-just-download) of what they do and finally show you a [diagram](custom-props.md#diagram) on how they hang together.

1. Create a project in Wolvenkit and give it a name. This will later be the name of your archive file.
2. Download the AMM prop template from [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/8011) or from manavortex's [mega](https://mega.nz/file/3Q1hiTjL#\_-6O\_9m3vk50Qkhfck\_vKQ2\_xI07BCvQVdem1es\_4tI), or download the complete [source folder](https://mega.nz/file/OYVBAByY#\_FYr6OpKYK3q5\_bcyKjtnljFv\_dwqyHkTNKL0zG84Pg) for Wolvenkit. It will have prepared files, which is faster than doing everything from scratch by yourself.
3.  Prepare your Wolvenkit project and make sure that you have the following files:

    <figure><img src="../../../.gitbook/assets/amm_props_structure.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
The first part of the structure is up to you, although for the sake of the tutorial you might want to stick to it and [change it at the end](moving-and-renaming-in-existing-projects.md). The section about [Creating another prop](custom-props.md#creating-another-prop) will tell you how to change file and folder names in all the files.

The second part (under "resources") is where AMM will look for custom props. You can't change it other than creating subfolders under "Custom Props".
{% endhint %}

### Explanation: what did you just download?

{% hint style="success" %}
This section gives an explanation of the included files, explaining the difference in file structure between props with vs without variants.&#x20;

If you don't want to know this, you can skip ahead to [Creating another prop](custom-props.md#creating-another-prop) to get crackin', or check the [diagram](custom-props.md#diagram) to see how the files connect.
{% endhint %}

#### LUA file

This file registers your prop with AMM. File content looks like this:

```lua
return {
  -- put your name. Unless that's what you're called, not judging.
  modder = "your_name_here",
  
  -- you're supposed to put your _OWN_ thing here
  unique_identifier = "amm_custom_props_tutorial",

  props = {
    {
      name = "Tutorial item (customizable)",
      path = "tutorial\\amm_props\\template\\template.ent",
      category = "Misc",
      distanceFromGround = 1,
      appearances = {
          "template_item_textured",
          "template_item_multilayered",
      }
    }, 
    {
      name = "Tutorial item",
      path = "tutorial\\amm_props\\template_no_variants\\template_no_variants.ent",
      category = "Misc",
      distanceFromGround = 1,
    },
  }
}
```

Without a `lua` file, AMM (as of version 2.1) won't be able to spawn your props.&#x20;

{% hint style="info" %}
`name` is what you'll search for in AMM

`category` is for AMM sorting

`distanceFromGround` is pretty self-explanatory (I like floating objects)

`appearances` registers the variant names.
{% endhint %}

#### Entity file

Defined in your `LUA` file, this file holds the game entity that AMM spawns when you click the button. There are two ways of using entity files:&#x20;

**Mesh entity (the legacy version)**

One entity file per variant. The props will not have appearances — AMM's prop browser has one entry per entity file (e.g. `cube_black`, `cube_white`, `cube_glowing`).&#x20;

{% hint style="info" %}
**Fun fact:** The cluttered prop browser annoyed manavortex so much that she joined the AMM developer team, helped Max implement the alternative workflow described below the picture, and wrote this guide!&#x20;

It was bad!
{% endhint %}

You add props by putting meshes directly into the components array.&#x20;

<figure><img src="../../../.gitbook/assets/mesh_entity.png" alt=""><figcaption><p>Mesh/Component entity, loading something directly. You can read more about the theory <a href="../../files-and-what-they-do/entity-.ent-files.md#mesh-component-entity-simple-entity">here</a> — you don't need to know for the rest of this guide.</p></figcaption></figure>

**Root entity**

One entity file per prop, one entry in AMM's prop browser (e.g. `cube`). After spawning it, you can toggle its appearances (`white`, `black`, `glowing`) the same way you do it with NPCs.

{% hint style="info" %}
If you have [added clothing items](../items-equipment/adding-new-items/), then this will be familiar to you. If you haven't, please ignore the link and keep reading — this is the simpler version!
{% endhint %}

Instead of adding items directly via the components array, we link **appearances** to an .app file. The only component we keep in the root entity is the **targeting component** for the CET cursor: this way, it will be added to each appearance in the .app file.

<figure><img src="../../../.gitbook/assets/root_entity.png" alt=""><figcaption><p>Root entity, pointing towards an .app file. You can read more about the theory <a href="../../files-and-what-they-do/entity-.ent-files.md#root-entity">here</a> — you don't need to know for the rest of this guide.</p></figcaption></figure>

#### Appearance file

This file holds a list of `appearances`. Inside each `appearance`, you can define any number of things to be loaded (components) and specify or override their behaviour.

{% hint style="info" %}
We will only use `entPhysicalMeshComponent`s, and they must be named  `amm_prop_slot1` .. `amm_prop_slot4` if you want to enable scaling.
{% endhint %}

{% hint style="warning" %}
If you have more than four mesh files assigned to your app's components, the prop will no longer be scaleable (as of AMM 2.1). You can get around this limitation by **making meshes with more submeshes** instead of having individual files.
{% endhint %}

#### template\_textured.mesh

A pre-configured mesh for a textured material. Uses the following files in the subfolder `textures`:

* `template_01_d.xbm`: A diffuse (albedo) map, colouring the mesh
* `template_01_n.xbm`: A normal (bump) map, adding depth to the object.

{% hint style="info" %}
If you stick to this naming convention and have your filenames end in `_d` or `_n`, Wolvenkit will recognize and identify the correct settings for image import.
{% endhint %}

You can learn more about textured materials [here](../../materials/#textured). This is not necessary for the purpose of this guide.

#### template\_multilayered.mesh

A pre-configured mesh for a multilayered material. Uses the following files in the subfolder `textures`:

* `6_layers.mlsetup`: A [multilayer setup](../items-equipment/editing-existing-items/changing-materials-colors-and-textures.md#multilayered-material) with colour properties
* `6_layers.mlmask`: A [multilayer mask](../../materials/multilayered.md), determining which parts of the mesh are affected by which layer of the mlsetup. In this case, it just contains six blank layers.
* `template_01_n.xbm`: A normal (bump) map, adding depth to the object.

You can learn more about multilayered materials [here](../../materials/#multilayered). This is not necessary for the purpose of this guide.

{% hint style="success" %}
If you have downloaded the example Wolvenkit project, you can now install it and launch the game, seeing everything in action.
{% endhint %}

### Diagram

Okay, now that we've gone through the theory, let's have a quick overview how everything hangs together:

#### Without variants

<figure><img src="../../../.gitbook/assets/amm_custom_props__mesh_entity diagram.png" alt=""><figcaption><p>No app file, directly pulling in a mesh with defined appearance</p></figcaption></figure>

#### With variants

<figure><img src="../../../.gitbook/assets/ent_app_mesh_relationship.png" alt=""><figcaption><p>The better option — not actually that much more complex, is it? :)</p></figcaption></figure>

## Creating another prop

{% hint style="success" %}
This step is **optional**. If you just want to see how this works, you can pack your project with Wolvenkit and search AMM for "tutorial item". However, assuming that you actually want to make cool things, you will be doing this a lot.
{% endhint %}

If you want to create another prop, here's the fastest non-script way to go about it (tried and tested by manavortex):

1. In Windows Explorer, duplicate the `template` folder
2. Rename the new folder (`template - Copy`) to the name of your prop (e.g. `baseball`)
3. Rename all files inside of the folder: replace `template` with the name of your prop (e.g. `baseball`). Make sure that it is the same as the containing folder, or you'll have to clean up things by hand later.
4. Right-click on your folder and export the entire thing to json.
5. Switch to the `raw` tab in Wolvenkit and open your json files in Notepad++
6.  Via `Search and Replace in Files` (Ctrl+Shift+F), replace `template` with the name of your new prop and folder (e.g. `baseball`). Replace it in all files, **using Match case**:

    <figure><img src="../../../.gitbook/assets/amm_customizable_props_replace_in_files.png" alt=""><figcaption><p>Make sure to check "<strong>Match case</strong>", or you will be unable to re-import the .ent file!</p></figcaption></figure>
7. **Optional**: If you have changed the folder structure (e.g. moved your folder from the subfolder `stuff` to the subfolder `misc`), run another `Search and Replace in Files` (Ctrl+Shift+F) to adjust your file paths.
8. In the project browser's raw section, right-click on the folder and select `Convert from json`. This will have updated the relationships between the files to your renamed files.
9. Delete the files / appearances that you don't need. Save and close the mesh file.
10. Import your meshes and textures over the ones from the template. For a guide on how to do that, check [here](textured-items-and-cyberpunk-materials.md#importing-a-mesh).&#x20;
11. Add another entry to the props array in your `LUA` file:

```
    {
      name = "Baseball (customizable)",
      path = "tutorial\\amm_props\\baseball\\baseball.ent",
      category = "Misc",
      distanceFromGround = 1,
      appearances = {
          "baseball_textured",
          "baseball_multilayered",
      }
    }, 
```

Now you can launch the game and check your prop. If everything went well, you should see something like this now:

<figure><img src="https://i.imgur.com/GQ8fELd.png" alt=""><figcaption><p>Not a moon</p></figcaption></figure>

If not, it is time to hit up the [troubleshooting](custom-props.md#troubleshooting).

## Troubleshooting

This section will only cover troubleshooting steps for this guide. \
For anything related to mesh imports, see [here](textured-items-and-cyberpunk-materials.md#troubleshooting). \
For general 3d model troubleshooting (including import errors), see [here](../../3d-modelling/troubleshooting-your-mesh-edits.md).

### My prop doesn't spawn and AMM won't target it!

AMM can't find your .ent file. Check the paths in the lua.

###
