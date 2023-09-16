---
description: Step-by-step guide on refitting a mesh - for newbies!
---

# R\&R: Refitting (step by step)

This page is a subsection of the [Netrunning Suit guide](./). It will teach you how to do custom refits in Blender.

**Assumed level of skill**: You know how to read — if you can read and struggle with this guide, then it's not yet good enough. Please reach out to [manavortex](http://127.0.0.1:5000/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention") on Discord so that I can improve it.&#x20;

{% hint style="info" %}
You don't **need** the [Wolvenkit Blender Add-on](https://github.com/WolvenKit/Cyberpunk-Blender-add-on) for this, but it is really cool, and if you want to keep editing Cyberpunk stuff, you should definitely install it.
{% endhint %}

## Step 1: Adding the meshes to your project

### The body

First, you need the mesh of the body that you want to refit for. (Technically speaking, you could do without, so if you like suffering, go ahead and skip this step.)

There are two ways of acquiring the body mesh:

#### From Nexus

Check the Nexus page of the body mod you're using — there's a good chance that the modder is simply offering a resource that you cna import into Blender.

#### From the mod itself

It might be easier and faster to simply export the base body.&#x20;

1. Switch to the [Mod Browser](../../analysing-other-mods/#step-1-switch-to-mod-browser)
2. In the Wolvenkit search bar, find the base body mesh:
   * Female body gender: `base\characters\common\player_base_bodies\player_female_average\t0_000_pwa_base__full.mesh`
   * Male body gender: `base\characters\common\player_base_bodies\player_man_average\t0_000_pma_base__full.mesh`
   * Anything else: Check [this list ](../../../references-lists-and-overviews/body/#player-base-body)or go hunting - here's the [Wolvenkit search documentation](http://127.0.0.1:5000/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files)!
3. Check the preview to make sure that you're grabbing the right mesh, then add it to your project by double-clicking or via context menu.

### The suit

1. In the Mod Browser, now search for the following files:
   * female body gender:\
     `manavortex\torso\netrunning_suit\meshes\pwa_netrunning_suit.mesh`\
     `manavortex\torso\netrunning_suit\meshes\pwa_emissive.mesh`
   * male body gender:\
     `manavortex\torso\netrunning_suit\meshes\pma_netrunning_suit.mesh`\
     `manavortex\torso\netrunning_suit\meshes\pma_emissive.mesh`
2. Add them to your project by double-clicking or via context menu.
3. If you don't want to use the emissive mesh, you can delete it now.

## Step 2: Exporting the meshes from WKit

The whole process is explained [here](../../../3d-modelling/exporting-and-importing-meshes/#gltf-binary-.glb).&#x20;

TL;DR:&#x20;

* Find "Export Tool"
* Select the mesh(es) you want
  * Body
  * Netrunning Suit
  * _optional: emissive submesh_
* Click **Export** button

In Wolvenkit, switch to the `raw` folder (or scroll all the way down). Right-click on the glb file, and select "Open in File Explorer":

<figure><img src="../../../../.gitbook/assets/netrunner_export_open_in_file_explorer.png" alt=""><figcaption></figcaption></figure>

#### Windows Explorer Path

You will now see a Windows Explorer window. Copy the file path like this:

<figure><img src="../../../../.gitbook/assets/netrunning_suits_copy_path.png" alt=""><figcaption><p>Alternatively, you can also navigate Blend</p></figcaption></figure>

## Step 3: Importing to Blender

{% hint style="info" %}
You might see the submesh and armature numbers changing through the guide. That is ~~to keep you on your toes~~ because I didn't take them in one setting, and also because they don't matter - any number from `.001` to .`999` will be removed on reimport with Wolvenkit.
{% endhint %}

Open Blender and create a new file. You will probably be greeted by a bunch of standard objects that we need to get rid of:

<figure><img src="../../../../.gitbook/assets/netrunning_suits_blender_delete_standard.png" alt=""><figcaption></figcaption></figure>

Now, let's import our meshes.&#x20;

From the "File" menu, select "Import" and then one of the entries for "gltf":

<figure><img src="../../../../.gitbook/assets/netrunning_suits_blender_import.png" alt=""><figcaption></figcaption></figure>

You will now see a file picker.&#x20;

<figure><img src="../../../../.gitbook/assets/netrunner_blender_file_picker.png" alt=""><figcaption></figcaption></figure>

1. In the path bar at the top, paste the path from the [previous step](r-and-r-refitting-step-by-step.md#windows-explorer-path).
2. Select the mesh(es) that you want to refit, and import them
3. Now, repeat the process with the body mesh. If you don't know where it is, you can find it here (`..` means that you need to co up a directory from the one with the netrunning suits):\
   `..\..\..\..\base\characters\common\player_base_bodies\player_female_average\t0_000_pwa_base__full.glb`
4. If you have imported without the plugin, you will see something like this and need to hide the armatures. If you have imported with the plugin, it will already have done that for you.

<figure><img src="../../../../.gitbook/assets/netrunners_refitting_no_plugin.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
You are currently in Object Mode, which will let you select whole objects.
{% endhint %}

5.  Change the colour of the body mesh to better see clipping (see the next screenshot for details):

    1. Click on the body mesh, or find it in the Scene Collection under its armature parent, and select it there.
    2. Select the "Material Properties" tab in the right sidebar (a round red icon near the bottom at the list)
    3. Click on "Use Nodes" to uncheck it
    4. Set a base colour that is not white to see clipping





    <figure><img src="../../../../.gitbook/assets/netrunners_refitting_colour_body.png" alt=""><figcaption></figcaption></figure>



## Step 4: Refitting

We will use the Proportional Editing mode here. If you don't vibe with that, you can read up [here](../../../3d-modelling/mesh-sculpting-techniques.md#sculpting) on other approaches for refitting, or refer to the [community guides](../../community-guides/) section.

{% hint style="info" %}
Proportional editing will leave the garment supports intact, preventing the risk of [string cheese](../../../3d-modelling/troubleshooting-your-mesh-edits.md#my-mesh-is-string-cheese-exploding-vertices-a-puddle-on-the-floor).
{% endhint %}

1. While still in `Object Mode`, expand both armatures (not the one with the body) and select all included meshes.
2. Switch into Edit Mode by hitting Tab or selecting it from the dropdown at the topleft
3. Turn on "Proportional Editing" by checking the round button at the top of the viewport

<figure><img src="../../../../.gitbook/assets/netrunner_refit_proportional_editing_1.png" alt=""><figcaption></figcaption></figure>

4. Hide the body mesh by shift-clicking on the body armature's eye icon twice: it's in the way, and we need to select some vertices.

<figure><img src="../../../../.gitbook/assets/netrunner_recolours_hide_body_armature.png" alt=""><figcaption><p>Shift-click will hide the entire armature and its children.</p></figcaption></figure>

5. Make a selection — somewhere close to the future highest point.

<figure><img src="../../../../.gitbook/assets/netrunner_refit_select_vertices.png" alt=""><figcaption></figcaption></figure>

5. Show the body mesh again:&#x20;
   1. Shift-click on the eye icon next to the body armature to show everything
   2. left-click on the eye icon (no shift, just a regular click) to hide only the armature)

### The tools

We will use scaling (shortcut: `S`) and movement (shortcut: `G`). &#x20;

* You can lock the axis on which you are moving by pressing `X`, `Y` or `Z`
* You can scale the strength of the proportional modifier by using the mouse wheel — but only after you have a tool selected.

I'm afraid that this is where you [draw the rest of the owl](https://knowyourmeme.com/memes/how-to-draw-an-owl) - you need to refit the suit. Try playing around with the settings. For example, you can start by pressing `G` - `Y` to let out the chest, then try scaling.&#x20;

Do this until you have covered all skin that you don't want exposed. Now it's time to export our edited meshes, and import them back.

{% hint style="info" %}
**Pro tip:** Keep the .blend file open until you have seen the refit in action. It's quite likely that it still clips somewhere and that you'll have to get active again.
{% endhint %}

## Step 5: Exporting

1. Switch back to Object mode by pressing `Tab`&#x20;
2. select all meshes under one armature (e.g. the emissive meshes)
   * If you  are exporting without the Wolvenkit Plugin, select the armature as well.&#x20;
3. From the menu, select File -> Export&#x20;

<figure><img src="../../../../.gitbook/assets/netrunner_guide_refit_export.png" alt=""><figcaption><p>If you  are exporting without the Wolvenkit Plugin, find the correct settings in the <a href="../../../3d-modelling/exporting-and-importing-meshes/#gltf-binary-.glb-1">import/export guide</a>, then check <code>Selected Only</code>.</p></figcaption></figure>

4. **Overwrite** the file you originally imported from (`pwa_emissive.glb`)
5. Repeat the process with the other armature.

## Step 7: Importing into Wolvenkit

{% hint style="info" %}
As of 8.9.1, Garment Support is still experimental. If your meshes look like string cheese or twitch all over the place, you can [delete the parameters](../../../3d-modelling/troubleshooting-your-mesh-edits.md#my-mesh-is-string-cheese-exploding-vertices-a-puddle-on-the-floor). That will destroy the automatic deform when you put a jacket on, but at least your mesh will work.
{% endhint %}

1. In the Import Tool, select the first file that you want to import, then check the `Import Garment Support` box.
2. Do the same for the second mesh. (As of 09/09/2023, the emissive component doesn't have garment support, but eventually I will make this work)
3. Import both glb files.

If everything went well, you can now see your reshaped meshes in Wolvenkit. If not, you can refer to the [Export/Import](../../../3d-modelling/exporting-and-importing-meshes/) guide.&#x20;

Should anything be wrong with your mesh, you can check the corresponding [troubleshooting guide](../../../3d-modelling/troubleshooting-your-mesh-edits.md).

{% hint style="success" %}
Happy modding, choomba!
{% endhint %}