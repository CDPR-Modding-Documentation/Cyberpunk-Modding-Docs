---
description: Make your own pose, then import it into photo mode
---

# Poses/Animations: make your own

## Summary <a href="#summary" id="summary"></a>

**Created by @manavortex**\
**Published September 2023**

{% hint style="info" %}
This guide will teach you how to **create a custom pose** in Blender and import it into the game via **Wolvenkit**. Effectively, this will let you make a **photo mode replacer**.

This is a **prerequisite** for pose sets for both [Photo Mode](archivexl-adding-photo-mode-poses.md) and [Appearance Menu Mod](amm-collab-anims-poses.md).&#x20;

Check the [animations.md](../../animations.md "mention")section for more general knowledge.
{% endhint %}

#### **It has been tested with the following software versions. Install these or newer.**&#x20;

|                                                                                                                                                      |                                                             |
| ---------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| Wolvenkit ([stable](https://github.com/WolvenKit/Wolvenkit/releases) \| [nightly](https://github.com/WolvenKit/WolvenKit-nightly-releases/releases)) | >= 8.9.1                                                    |
| [Blender](https://www.blender.org/download/)                                                                                                         | [3.6.2 LTS](https://www.blender.org/download/releases/3-6/) |
| [Cyberpunk Blender Add-On](https://github.com/WolvenKit/Cyberpunk-Blender-add-on)                                                                    | 1.3.0 (Jun 20)                                              |

{% hint style="warning" %}
We all stand on the shoulders of giants: this process has first been documented by [xbaebsae | Angy](https://xbaebsae.jimdofree.com/cyberpunk-2077-tutorials/cp2077-custom-poses-and-animations/), who also provided the [original animation templates](https://drive.google.com/file/d/1kL04dQy9xmK\_yRsvsS4Sn83joPzrljAr/view). Thank you!
{% endhint %}

### Skipping and skimming

This guide will include the minimum amount of fluff and will **link** background information rather than giving it.

Any links in the text will either

* provide additional information which you **do not need** to complete this guide
* lead to step-by-step instructions for any given process

Follow them if  you want to learn more, or if you are unclear on how to complete the current step, then come back here.

## Step 0: Preparations

### Your Wolvenkit project

To import your pose into Cyberpunk, you need a Wolvenkit project.&#x20;

1. [Create one](http://127.0.0.1:5000/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects#creating-a-new-wolvenkit-mod-project), give it a name that you can identify later
2. Now, [search](http://127.0.0.1:5000/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files) for the correct photo mode file and add it to your project:

| body gender | file                                                           |
| ----------- | -------------------------------------------------------------- |
| female      | base\animations\ui\photomode\photomode\_\_female\_\_idle.anims |
| male        | base\animations\ui\photomode\photomode\_\_male\_\_idle.anims   |

3. Export the file(s) via [Export Tool](http://127.0.0.1:5000/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export#ui-location-tools). We will **overwrite** these glb(s) with our new pose, then use Wolvenkit to merge them into the existing .anims file.

{% hint style="danger" %}
You **can not move** these .glb files. Wolvenkit needs them to stay where they are so it can splice your new animation into the existing `.anims` file.
{% endhint %}

### Download the template files

Download the animation template(s) for your rig(s) from [Angy's Google Drive](https://drive.google.com/file/d/1kL04dQy9xmK\_yRsvsS4Sn83joPzrljAr/view), move/copy them somewhere, then open the one you want in Blender. I'll be using the one for female V because ~~the other one doesn't exist~~ I happen to have one of those.

## Step 1: Posing the mannequin

This step will happen in **Blender**.&#x20;

{% hint style="info" %}
If the written instructions aren't clear enough for you, check the screenshots below them.
{% endhint %}

1. Open up the file
2. Select the armature by clicking on one of the bones in the viewport (the red circle on the screenshot below). They will be highlighted if you did it right.

<figure><img src="../../../.gitbook/assets/animations_tutorial_blender_viewport.png" alt=""><figcaption><p>Your viewport directly after opening the file.</p></figcaption></figure>

3. Switch the viewport to `Pose Mode` in the dropdown menu at the topleft of the viewport. This will turn the armature red.
4. Now, you need to **create your pose**. Before you do that, check the box below:

<details>

<summary>Nice-to-know about creating poses</summary>

**General**

* The real human skeleton changes pose **only** via **bone rotation** — moving bones leads to dislocated joints. **Do not move bones**.

**Tooling**

* Instead of **overwriting** the entire `.anims` file, Wolvenkit will splice the NLA tracks that you will create below into the container. For that reason, you can have as many .blend and .glb files as you want and import them in sequence, or have all your poses in a single .blend.

**Tool usage**

* You can limit a tool's effect to an axis by pressing `x`, `y` or `z`. Press the key a second time to use the **local** axis rather than the **global** one, and a third time to remove the limitation.
* Viewport zoom matters. Get closer for finer movements!

</details>

5. As of today (September 2023), we can only create poses and animations by **adjusting each bone by hand**. This is how:
   1. Select a bone by clicking on it (it will appear highlighted)
   2. Rotate the bone by either
      * pressing `R` to enter roration mode, then moving the mouse to rotate the bone (read up on axis limitation in the expandable box above)\
        **or**
      * selecting the `Rotate` tool from the toolbar on the left, then clicking and dragging along the coloured axes
   3. When you're done with this bone, position the next one.

<figure><img src="../../../.gitbook/assets/animations_blender_rotate_bone.png" alt=""><figcaption></figcaption></figure>

6. Now, [draw the rest of the owl](https://knowyourmeme.com/memes/how-to-draw-an-owl), then proceed to the next section.

## Step 2: Creating the animation

You now need to create an animation that Wolvenkit can add into the existing file. For that purpose, we will create a **nonlinear animation** in Blender.

1. In the panel at the bottom, click on `<No Action>` to select it.&#x20;
2. In the Armature -> Animation Data panel, click on the **New** button.
3. Now, we need to add keyframes, one for the **fallback position** and one for the **pose**.
   1. Click into the main viewport next to the armature
   2. Press `I` to open the keyframe menu
   3. Press `W` to insert the whole character
   4. Press the right arrow to select the next keyframe
   5. Press `I` and then `W` again
   6. After you have done that, click on the `Push Down Action` button

<figure><img src="../../../.gitbook/assets/animations_blender_keyframe_1.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/animations_blender_keyframes_2.png" alt=""><figcaption></figcaption></figure>

4. Now, **rename** both your NLA strip **and** your animation to **`idle_stand_01`**.  This will overwrite the "Tabula Rasa" animation. (Find a list of animations and their associated names [here](../../references-lists-and-overviews/cheat-sheet-photo-mode.md#idle).)

#### This is important!

{% hint style="danger" %}
This step is **crucial**. If you don't do this, then Wolvenkit won't import your animation.

The names **must** be the same, and they **must** match the name in your .anim file.
{% endhint %}

<figure><img src="../../../.gitbook/assets/animations_blender_name_anims.png" alt=""><figcaption><p>Before</p></figcaption></figure>

<figure><img src="../../../.gitbook/assets/animations_blender_name_anims_2.png" alt=""><figcaption><p>After</p></figcaption></figure>

5. Go back and read the warning box under step 4.
6. Double-check the names. (Yes, this is **that** important)
7. Now that you're sure that you have the correct names, switch the viewport back to **Object Mode** (the same way you switched to pose mode). Your armature should still be selected.\
   _TODO: This step will be made **optional** when the Blender plugin update hits. Update guide when it does._
8. From the File -> Export menu, select `Export Selection to GLB for Cyberpunk`

<figure><img src="../../../.gitbook/assets/animations_blender_export_selection.png" alt=""><figcaption></figcaption></figure>

8. This will open a file picker. Do the following things:
   * Check the `As Photomode Pose` box on the right
   * Navigate the to the path of the file you exported in the [previous step](poses-animations-make-your-own.md#your-wolvenkit-project) and click on it to overwrite it
9. When you're done, hit "Export for Cyberpunk".

Now it's time to import the file back into Wolvenkit.

## Step 3: Importing and testing

1. Switch back to Wolvenkit and open the [Import Tool](http://127.0.0.1:5000/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export#ui-location-tools).
2. Click on `photomode__female__idle.glb` to select it and open the import settings panel.
3. In the panel on the right, change `Target File Format` to Anims:

<figure><img src="../../../.gitbook/assets/animations_blender_wolvenkit_import.png" alt=""><figcaption></figcaption></figure>

4. Hit the **Import Selected** button.

{% hint style="success" %}
Youc an now test your mod: Install your Wolvenkit project by clicking the green button on the taskbar, and launch the game.&#x20;

If all went well, entering photo mode will show your new pose.
{% endhint %}

## Troubleshooting

### My pose doesn't import!

I have no idea how to tell you this, choomba, other than stressing thrice that it's important and putting a big red box, but the NLA strip and the animation **must** have the same name. Go back to "[this is important](poses-animations-make-your-own.md#this-is-important)" and double-check. The animation might have trailing numbers, e.g. be called `photomode__female__idle.001`, that will already do it.

### Very funny, but it wasn't that

If you're really 100% sure, then you might have a broken NLA strip. That happens sometimes — simply recreate it:

1. If your armature isn't selected anymore, click on it to select it
2. Switch into Pose Mode
3. Press `A` to select all bones
4. Press `Ctrl+C` to copy their positions
5. Create a new NLA strip by repeating [Step 2](poses-animations-make-your-own.md#step-2-creating-the-animation) — but instead of posing the armature, you can simply press `Ctrl+V` to paste the bone positions from your previous animation.
6. Export the new NLA strip, then [import it via Wolvenkit](poses-animations-make-your-own.md#step-3-importing-and-testing). This should work now.

### Nope, still borked

We're reaching the end of the rope here. Go back and [check the animation names](poses-animations-make-your-own.md#this-is-important). If that wasn't it,

1. create a new copy of the .blend file you downloaded (but keep yours open)
2. In your old Blend file, repeat 1-4 of the [previous step](poses-animations-make-your-own.md#very-funny-but-it-wasnt-that)
3. In your new Blend file, repeat 5+6 of the [previous step](poses-animations-make-your-own.md#very-funny-but-it-wasnt-that)



