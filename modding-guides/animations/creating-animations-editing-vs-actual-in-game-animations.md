---
description: 'Tutorial: How to Edit Third-Person and First Person Animations for V'
---

# Editing V's Actual In Game Animations

## **Summary**

**Published: Sep 27 2024 by @tylr**\
**Last documented edit:** Jan 11 2025 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This tutorial will show you how to Edit Third-Person and First Person Animations for V.\
&#xNAN;_&#x57;orks with JB's TPP Mod which is found on Nexus Mods and for replacing first-person animations_

### Wait, this is not what I want!

* Check [animations](animations/ "mention") for guides on how to do that
* If you want to learn how to export animations to Blender, check [wkit-blender-plugin-import-export.md](../../for-mod-creators-theory/modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-import-export.md "mention") -> [#animations](../../for-mod-creators-theory/modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-import-export.md#animations "mention")&#x20;

### Download the template

I highly suggest using my template, which can be downloaded here: [https://drive.usercontent.google.com/download?id=1\_Z1cmk\_r2xH0YtII7t1JbqQoMgvY2m3g\&export=download\&authuser=0](https://drive.usercontent.google.com/download?id=1_Z1cmk_r2xH0YtII7t1JbqQoMgvY2m3g\&export=download\&authuser=0)

It includes:

* A Blender template with FemV locomotion animations, rigs, and mesh
* A WolvenKit project template
* Pre-exported NPC animations ready for Blender

It's the same one I use in my tutorial videos.

## Requirements (click to download)

## Video Format

This tutorial is mainly in video form for simplicity. Don’t worry if this looks tough—it's actually really easy once you get the hang of it.&#x20;

First, open WolvenKit from the link above. In the video, I show how to open the project file from my template and install the Cyberpunk Blender Addon.

{% embed url="https://www.youtube.com/watch?v=P25T03CKAJw" %}

## **Replacing an Animation (Video Walkthrough: This video only shows the manual way to replace animations)**

1.  **Open the Blender Template**

    Before exporting, remove any unedited animations. This prevents unnecessary files from being included and speeds up the export process.

    **Export Your Animation**

    For example, if you've fixed the backward jog (FPP JOG 180), export it as `player_locomotionnnn.anims.glb` to:\
    `Template Folder\WolvenKit Template Folder\Player Animation Template\source\raw\base\animations\player\female\body\player_locomotionnnn.anims.glb`

    Overwrite the file when prompted.

    **Import to WolvenKit**

    In WolvenKit, click **Import** and select the edited `.glb`. This will import your modified animation into the `player_locomotionnnn.anims` file.

    **Manual Method**

    1. **Update Animation Handles**: Copy the animation handle from `player_locomotionnnn` and paste it over the FPP JOG 180 handle in the `Player Locomotion.anim` file.
    2. **Transfer AnimAnimDataChunk**: Copy the AnimAnimDataChunk from `player_locomotionnnn` and paste it in the locomotion anim data chunk. Then, set the `unkindex` in the animbuffer to match the data chunk.

    **Automatic Method (100x Faster)**

    1. Simply rename your `.glb` to match the `.anims` file you are replacing. In this case, you would just rename the .glb to `player_locomotion.anims.glb`&#x20;
    2. Import it, and the system will handle the rest automatically.
    3. Again make sure to only include animations that you've included before importing.

    **Optional Fix: Frame Clamping**

    If the animation glitches, enable frame clamping to keep the FPS at 30.

That’s it! You can use this method to replace any animation for V, including combat animations. If you want to revert to the original animation, right-click the file and select **Replace with Original**.

{% embed url="https://www.youtube.com/watch?v=kEb-k6Xa0a0" %}

## **Editing/Fixing Animations**

Editing animations for _Cyberpunk 2077_ can be tricky due to the large number of bones in its rig. While it's possible to use animations from other games, it can require a lot of adjustments. Fortunately, NPC animations and V’s other animations tend to work well, though NPC arm bones often don’t transfer properly to V.

In this video, I demonstrate how to fix an animation for third person, specifically the **backward crouch walk**. The best approach I’ve found is to use keyframes from other animations and replace the problematic keyframes in the animation you want to fix.

In this case, the back looks off, so I need to replace the **spine bone keyframes**. The main bones to focus on (for most animations) are from **Hips to Spine3**, and if needed (though I rarely touch these), **Left Shoulder to Right Hand**.

For this fix, I found that the **backward walk angled at 220 degrees** is the closest match to use keyframes from. I copy keyframes from the spine bones one by one and paste them into the backward crouch walk animation, adjusting as needed.

### Keyframe Scaling for Different Durations

If the animations are different lengths, press **S** on your keyboard to scale the keyframes to fit the animation you’re editing. This ensures that the animation will still loop perfectly even when using keyframes from other animations. In this video, I scale the keyframes around the **4:27 mark**.

The animation I fixed in 9 minutes is featured in a mod I posted on Nexus Mods titled **TPP Jog Animation Redone** and can be downloaded there if you wish to see how this edited animation looks in game.

{% embed url="https://www.youtube.com/watch?v=Lb4WoK9sYQw" %}

***

## **Additional Information**

I also included about 10 different NPC animations exported from WolvenKit, ready for Blender in my template. This video shows how to import those animations into Blender and apply them to V, as well as how to use keyframes from them.

For example, I import **Panam’s sniper combat locomotion** animation. As you’ll notice, it looks awkward on V, especially the arms. To fix this, I copy the keyframes from Panam’s animation—excluding the arm keyframes—and paste them into V’s walk animation. The result looks much better.

This process took just **two minutes**. To import that edited animation into the game, simply follow the steps outlined earlier for replacing an animation. Once replaced, V will use this animation whenever walking fast.

{% embed url="https://www.youtube.com/watch?v=qFz8myUqVhk" %}

