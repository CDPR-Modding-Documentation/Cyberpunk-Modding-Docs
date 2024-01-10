---
description: >-
  This page will cover how to modify a character's body mesh and/or clothes, in
  detail.
---

# Altering Appearances within Wolvenkit - Full Workflow

**Created by @madmaximusjb**\
**Published December 26 2023**

<details>

<summary>This guide relies heavily on a few other resources, take a look here:</summary>

[Appearances: change the looks](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators/modding-guides/npcs/appearances-change-the-looks#wait-this-isnt-what-i-want)\
[Creating a Mod](https://wiki.redmodding.org/wolvenkit/getting-started/creating-a-mod)\
[Exporting Characters to Blender](https://wiki.redmodding.org/wolvenkit/modding-community/exporting-to-blender)\
[Refit Clothes Easily](https://youtu.be/RK3AAfOHh40?si=2LWG72v\_aVHjhr2b)

</details>

**For this guide, I'm using versions:**

Wolvenkit -> 8.11.2 Nightly

Blender -> 3.6

Cyberpunk Blender Add-On -> 1.5.2

### Requirements

* Blender
* Wolvenkit
* Blender Add-On

***

Hey choombas! Today we're going to be going over the entire workflow of modifying the appearance (body mesh or clothing) of a character in the game. For this guide, we'll be giving Vic (the ripperdoc) bigger pecs, but this guide should work with any character. Ready? Let's go.

## Locating the .app File

The first step in this process is going to be locating the .app file. Most main characters have their .app file located in the folder "base\characters\appearances\main\_npc," but if you're modifying a side character or a character that you can't find the .app file for, you should look for their .ent file, which will point you in the direction of their .app file. Most .ent files are located at "base\characters\entities".

For us, we'll be wanting to locate victor\_vektor.app, which is in the main\_npc folder I listed earlier. Once we add this file to our project and open it, we will see an array named "appearances".

<figure><img src="../../../.gitbook/assets/image (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

All of the different appearances for Victor are located in this array. Upon expanding it, we see that he only has three.

<figure><img src="../../../.gitbook/assets/image (2) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

We'll be editing the default appearance in this guide. But the principle is the same. Next we will open the default appearance and then open the "components" array. This is where all of the components for that appearance are stored. Clothes, body meshes, hair meshes, etc.&#x20;

<figure><img src="../../../.gitbook/assets/image (3) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

As you can see, there are quite a lot to sort through. Don't worry though, most of these things you won't have to mess with anyway.

{% hint style="info" %}
A quick tip: most of these components are prefaced by something like t0 or l1. Here's what that means: t=torso (t0 is usually the body mesh, t1 is usually clothes), l=legs, h=head, s=shoe.
{% endhint %}

Since we want to modify the body mesh and his shirt, here are the components we'll want to modify: "t0\_001\_ma\_body\_\_ripper\_doc6245" (body mesh) and "t1\_001\_ma\_full\_\_ripper\_doc1487" (shirt). We'll start with the body mesh.

## Modifying the Body Mesh

To modify the body mesh, we'll export it to Blender. First, add the mesh file to your project. The mesh file can be found and added by expanding the component and clicking the yellow arrow next to the mesh file.

<figure><img src="../../../.gitbook/assets/image (4) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

Next, we want to export the file out of Wolvenkit to enable us to edit the mesh in Blender, since right now, the file is in a format Blender can't read. To export the file, go to your toolbar on the top, click on "Tools" and then "Export Manager". Once that's open, you'll want to check the box next to your body mesh and click "Export Selected".

<figure><img src="../../../.gitbook/assets/image (5) (1) (1).png" alt=""><figcaption></figcaption></figure>

Now, your file can be read and modified by Blender. Open up Blender (make sure you have the CP Add-On installed), and once you have a fresh project open (delete everything, camera and light included), click on "File>Import>Cyberpunk GLTF". Locate your project folder, then find your mesh file in "raw". It'll probably be somewhere like "Ripperdoc\_Tutorial\source\raw\base\characters\main\_npc\ripper\_doc". Import it.

<figure><img src="../../../.gitbook/assets/image (6) (1).png" alt=""><figcaption></figcaption></figure>

If all went well, you should see a blank body mesh in your viewport.

<figure><img src="../../../.gitbook/assets/image (7).png" alt=""><figcaption></figcaption></figure>

To edit this mesh, there are two ways to do it. You can use edit mode to edit specific vertices, or use sculpt mode if you prefer. We're going to use edit mode. Make sure you have your mesh selected, and enter edit.&#x20;

{% hint style="info" %}
Side note: for the purposes of ease, I'm going to join together the components of the mesh so I can edit the whole body without having to switch objects. To do this, go into Object Mode, select all components of the body (highlight the whole thing), and press Ctrl+J. Done.
{% endhint %}

You should see something like this:

<figure><img src="../../../.gitbook/assets/image (8).png" alt=""><figcaption></figcaption></figure>

These are all of the vertices that make up your mesh. Before we begin editing, you'll want to enable this button right here:

<figure><img src="../../../.gitbook/assets/image (9).png" alt=""><figcaption></figcaption></figure>

This enables proportional edit mode. Now, select a few vertices at random on Vic's pec muscles. It should look like this:

<figure><img src="../../../.gitbook/assets/image (10).png" alt=""><figcaption></figcaption></figure>

Now, to edit these vertices, we're going to press "g" and then "y" to edit them on the y-axis. Remember to scroll up until you see the circle around your cursor shrink to a little less than the width of Vic's chest. Now, we'll drag the cursor out a little to pull those areas out. Use some creative independence to determine what looks good. For me, this is fine.

<figure><img src="../../../.gitbook/assets/image (11).png" alt=""><figcaption></figcaption></figure>

Now that we've done that, make sure there aren't any rough edges on your mesh and then select your mesh and **export it as a Cyberpunk GLB to the same file that you edited.**

Now, you must go back to Wolvenkit to import the mesh. Even though you exported the file from Blender, it's still in a raw format and unreadable by the game. Go to "Tools>Import Tool". Select your mesh and "Import Selected".

<figure><img src="../../../.gitbook/assets/image (12).png" alt=""><figcaption></figcaption></figure>

Cool! You've just edited your first body mesh! Now we can change the shirt to account for our changes.

{% hint style="info" %}
Keep in mind that instead of modifying the mesh in the game files, you could have made a copy of the mesh, modified that, and pointed the .app file to use that mesh. The same thing applies for the clothes.
{% endhint %}

## Modifying the Clothes

The first thing we want to do is find the piece of clothing that we want to edit within the .app file. For us, that's "t1\_001\_ma\_full\_\_ripper\_doc1487". Let's export it using the same process as with the body mesh (remember to add it to your project before trying to export it).

Before we import the mesh into Blender, let's first import the edited body mesh so that we can see what we need to change. Follow the same process we used to import it the first time. You should get something like this:

<figure><img src="../../../.gitbook/assets/image (13).png" alt=""><figcaption></figcaption></figure>

Now that we can see what we need to edit, let's begin. Make sure to select all of the meshes that make up the shirt, as there are several. Once you have done so, select multiple vertices in the areas that the body is clipping, similar to what we did with the body mesh. Also, remember to enable proportional editing mode in the toolbar up top. Again, press "g" to enter edit mode and "y" to edit the mesh on the y-axis. Remember to scroll up until the circle around your cursor is small enough. Edit the shirt out until it doesn't clip anymore. This looks good to me:

<figure><img src="../../../.gitbook/assets/image (14).png" alt=""><figcaption></figcaption></figure>

Once you're happy with your edits, select ALL of the shirt meshes and export as a Cyberpunk GLB to **the same file you imported.**&#x20;

<figure><img src="../../../.gitbook/assets/image (15).png" alt=""><figcaption></figcaption></figure>

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

