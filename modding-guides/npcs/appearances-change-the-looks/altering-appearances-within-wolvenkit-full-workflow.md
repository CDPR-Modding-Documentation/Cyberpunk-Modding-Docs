---
description: >-
  This page will cover how to modify a character's body mesh and/or clothes, in
  detail.
---

# Altering Appearances within Wolvenkit - Full Workflow

## **Summary**

**Created**: December 26 2023 by **@madmaximusjb**  \
**Last documented edit:** August 17 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This guide will edit Viktor's body and clothing: he's an ex-boxer, he should be more muscular!&#x20;

In the process, you'll learn the following things:

* Locating an NPC's files
* Editing a body in Blender
* refitting a clothing item in Blender

[Creating a Mod](https://wiki.redmodding.org/wolvenkit/getting-started/creating-a-mod) in Wolvenkit will not be covered by this guide.

### Wait, that's not what I want!

* If you just want the quick and dirty version, check [.](./ "mention")
* Or maybe you only care about [Exporting Characters to Blender](https://wiki.redmodding.org/wolvenkit/modding-community/exporting-to-blender)

## Required tools

* The [wolvenkit-blender-io-suite](../../../for-mod-creators-theory/modding-tools/wolvenkit-blender-io-suite/ "mention")
* Blender (the version that is compatible with the plugin)
* Wolvenkit [stable](https://github.com/WolvenKit/Wolvenkit/releases) | [nightly](https://github.com/WolvenKit/WolvenKit-nightly-releases/releases) ([Which one do you need?](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/getting-started/download#which-version-do-i-want))

***

Hey choombas! Today we're going to be going over the entire workflow of modifying the appearance (body mesh or clothing) of a character in the game. For this guide, we'll be giving Vic (the ripperdoc) bigger pecs, but this guide should work with any character. Ready? Let's go.

## Locating the .app File

The .app file lists the NPC's **components**, so everything that the game will add to them. This section will tell you how to find either the `.app` file directly, or an `.ent` file that leads to it.

### By .ent file

Entity files are using the `.app` files, so you can find them from there. For instructions on how to find them, just keep reaidng.

<figure><img src="../../../.gitbook/assets/image (497).png" alt=""><figcaption></figcaption></figure>

#### Wiki

Under [people](../../../for-mod-creators-theory/references-lists-and-overviews/people/ "mention"), you can find a bunch of paths. If you're lucky, then your character is on that list.

#### From the entity folder

Almost all entity files are in the following folder:

```
base\characters\entities
```

#### Via Wolvenkit Search

Type something like `character > .ent` in the Wolvenkit Search Bar and scroll a lot, or click on [this link](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files) to learn more

### By folder

Most main characters have their .app files here:

```
base\characters\appearances\main_npc
```

### Via Wolvenkit Search

Type something like `character > .app` in the Wolvenkit Search Bar and scroll a lot, or click on [this link](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files) to learn more

## Understanding the .app file

{% hint style="info" %}
You can read more about this under [appearance-.app-files](../../../for-mod-creators-theory/files-and-what-they-do/file-formats/appearance-.app-files/ "mention"), but you don't have to.
{% endhint %}

For us, we'll be wanting to locate victor\_vektor.app, which is in the main\_npc folder I listed earlier.&#x20;

Once we add this file to our project and open it, we will see an array named "appearances".

<figure><img src="../../../.gitbook/assets/image (227).png" alt=""><figcaption></figcaption></figure>

All of the different appearances for Victor are located in this array. Upon expanding it, we see that he only has three.

<figure><img src="../../../.gitbook/assets/image (228).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
We'll edit the **default appearance** in this guide, but the process is the same for all of them, or even [creating new appearances](../amm-custom-npcs/).
{% endhint %}

Open the default appearance and then the `Components` array. This is where all of the components for that appearance are stored: clothes, body meshes, hair meshes, etc.&#x20;

<figure><img src="../../../.gitbook/assets/image (229).png" alt=""><figcaption></figcaption></figure>

As you can see, there are quite a lot to sort through. Don't worry, most of these things you won't have to mess with anyway.

{% hint style="info" %}
A quick tip: most of these components are prefaced by something like t0 or l1. Here's what that means: t=torso (t0 is usually the body mesh, t1 is usually clothes), l=legs, h=head, s=shoe.\
For more information, read [here](../../../for-mod-creators-theory/3d-modelling/garment-support-how-does-it-work/#component-prefixes) — you don't have to.
{% endhint %}

Here are the components for body and shirt: "t0\_001\_ma\_body\_\_ripper\_doc6245" (body mesh) and "t1\_001\_ma\_full\_\_ripper\_doc1487" (shirt).&#x20;

We'll start with the body mesh.

## Modifying the Body Mesh

To modify the body mesh, we'll export it to Blender.&#x20;

First, add the mesh file to your project by clicking on the yellow arrow next to the mesh file's path:&#x20;

<figure><img src="../../../.gitbook/assets/image (230).png" alt=""><figcaption><p>Alternatively, you can also copy the path, put it into the search bar, and add it by double-clicking.</p></figcaption></figure>

Next, we want to export the file out of Wolvenkit to enable us to edit the mesh in Blender, since right now, the file is in a format Blender can't read.

### Exporting the body mesh

{% hint style="info" %}
You can find step-by-step instructions under the plugin's [import/export page ](../../../for-mod-creators-theory/modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-import-export.md#meshes)
{% endhint %}

To export the .mesh into something that Blender can read, find the [Export Tool](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export#ui-workflow-documentation).&#x20;

Once that's open, check the box next to your body mesh and click "Export Selected".

<figure><img src="../../../.gitbook/assets/image (231).png" alt=""><figcaption></figcaption></figure>

### Importing it into Blender

{% hint style="warning" %}
You need to have the [wolvenkit-blender-io-suite](../../../for-mod-creators-theory/modding-tools/wolvenkit-blender-io-suite/ "mention") installed for this!
{% endhint %}

Open up Blender, delete everything from the default project, and click on "File>Import>Cyberpunk GLTF".&#x20;

Locate your project folder, then find your mesh file in your project's [raw section](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/project-explorer#raw). It'll probably be somewhere like "Ripperdoc\_Tutorial\source\raw\base\characters\main\_npc\ripper\_doc".&#x20;

Import it.

<figure><img src="../../../.gitbook/assets/image (253).png" alt=""><figcaption></figcaption></figure>

If all went well, you should see a blank body mesh in your viewport.

<figure><img src="../../../.gitbook/assets/image (254).png" alt=""><figcaption><p>Who'd have thought? Vik is a ken doll. As a ripperdoc, he probably keeps his junk in the trunk.</p></figcaption></figure>

To edit this mesh, there are two ways to do it. You can use edit mode to edit specific vertices, or use sculpt mode if you prefer. We're going to use edit mode. Make sure you have your mesh selected, and enter edit.&#x20;

{% hint style="info" %}
Side note: for the purposes of ease, I'm going to join together the components of the mesh so I can edit the whole body without having to switch objects. To do this, go into Object Mode, select all components of the body (highlight the whole thing), and press Ctrl+J. Done.
{% endhint %}

You should see something like this:

<figure><img src="../../../.gitbook/assets/image (255).png" alt=""><figcaption></figcaption></figure>

These are all of the vertices that make up your mesh. Before we begin editing, you'll want to enable this button right here:

<figure><img src="../../../.gitbook/assets/image (256).png" alt=""><figcaption></figcaption></figure>

This enables proportional edit mode. Now, select a few vertices at random on Vic's pec muscles. It should look like this:

<figure><img src="../../../.gitbook/assets/image (257).png" alt=""><figcaption></figcaption></figure>

Now, to edit these vertices, we're going to press "g" and then "y" to edit them on the y-axis. Remember to scroll up until you see the circle around your cursor shrink to a little less than the width of Vic's chest. Now, we'll drag the cursor out a little to pull those areas out. Use some creative independence to determine what looks good. For me, this is fine.

<figure><img src="../../../.gitbook/assets/image (258).png" alt=""><figcaption></figcaption></figure>

Now that we've done that, make sure there aren't any rough edges on your mesh and then select your mesh and **export it as a Cyberpunk GLB to the same file that you edited.**

Now, you must go back to Wolvenkit to import the mesh. Even though you exported the file from Blender, it's still in a raw format and unreadable by the game. Go to "Tools>Import Tool". Select your mesh and "Import Selected".

<figure><img src="../../../.gitbook/assets/image (259).png" alt=""><figcaption></figcaption></figure>

Cool! You've just edited your first body mesh! Now we can change the shirt to account for our changes.

{% hint style="info" %}
Keep in mind that instead of modifying the mesh in the game files, you could have made a copy of the mesh, modified that, and pointed the .app file to use that mesh. The same thing applies for the clothes. Find out how to custompath assets here: [Custompathing](../../items-equipment/custompathing-assets.md)
{% endhint %}

## Modifying the Clothes

{% hint style="info" %}
For more intel about clothes refitting, check [Refit Clothes Easily](https://youtu.be/RK3AAfOHh40?si=2LWG72v_aVHjhr2b)
{% endhint %}

The first thing we want to do is find the piece of clothing that we want to edit within the .app file. For us, that's "t1\_001\_ma\_full\_\_ripper\_doc1487". Let's export it using the same process as with the body mesh (remember to add it to your project before trying to export it).

Before we import the mesh into Blender, let's first import the edited body mesh so that we can see what we need to change. Follow the same process we used to import it the first time. You should get something like this:

<figure><img src="../../../.gitbook/assets/image (260).png" alt=""><figcaption></figcaption></figure>

Now that we can see what we need to edit, let's begin. Make sure to select all of the meshes that make up the shirt, as there are several. Once you have done so, select multiple vertices in the areas that the body is clipping, similar to what we did with the body mesh. Also, remember to enable proportional editing mode in the toolbar up top. Again, press "g" to enter edit mode and "y" to edit the mesh on the y-axis. Remember to scroll up until the circle around your cursor is small enough. Edit the shirt out until it doesn't clip anymore. This looks good to me:

<figure><img src="../../../.gitbook/assets/image (261).png" alt=""><figcaption></figcaption></figure>

Once you're happy with your edits, select ALL of the shirt meshes and export as a Cyberpunk GLB to **the same file you imported.**&#x20;

<figure><img src="../../../.gitbook/assets/image (262).png" alt=""><figcaption></figcaption></figure>

Now, head back to Wolvenkit and import your changes. "Tools>Import Tool", check your mesh and click "import selected".

All that's left is to replace the depot path of the mesh you just edited. Head back to Vik's .app file, and find the shirt component ("t1\_001\_ma\_full\_\_ripper\_doc148"). Replace the "mesh" path with the relative path of your mesh (right click on your mesh in the project explorer and "copy relative path"). Click save on the top left.

Now, you can pack your mod or install it directly to your game.

{% hint style="warning" %}
Note that if you did copy the mesh and created a custom path, you would have to also replace the path under "AppearanceVisualController>appearanceDependancy" for the component to appear correctly.
{% endhint %}

{% hint style="warning" %}
Also note that since we didn't copy the mesh and use a custom path, this mod would not display the other two appearances correctly. You would have to modify the other clothes.
{% endhint %}

***

Congratulations! You just edited an appearance and changed the clothes to match! This guide can be applied to most characters, so I'm excited to see what you'll do with it!

Until next time, chooms!

