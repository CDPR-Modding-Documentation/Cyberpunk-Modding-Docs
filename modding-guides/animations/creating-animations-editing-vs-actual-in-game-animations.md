---
description: 'Tutorial: How to Edit Third-Person and First Person Animations for V'
---

# Creating Animations - Editing V's Actual In Game Animations

## **Summary**

**Published: Sep 27 2024 by @tylr**\
**Last documented edit: Sep 27 2024 by** [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention") (Formatting)

This tutorial will show you how to Edit Third-Person and First Person Animations for V.\
_Works with JB's TPP Mod which is found on Nexus Mods and for replacing first-person animations_

### Download the template

I highly suggest using my template, which can be downloaded here: [https://drive.usercontent.google.com/download?id=1\_Z1cmk\_r2xH0YtII7t1JbqQoMgvY2m3g\&export=download\&authuser=0](https://drive.usercontent.google.com/download?id=1\_Z1cmk\_r2xH0YtII7t1JbqQoMgvY2m3g\&export=download\&authuser=0)

It includes:

* A Blender template with FemV locomotion animations, rigs, and mesh
* A WolvenKit project template
* Pre-exported NPC animations ready for Blender

It's the same one I use in my tutorial videos.

## Requirements (click to download)

[Cyberpunk Blender Addon 1.6.0](https://nightly.link/WolvenKit/Cyberpunk-Blender-add-on/actions/runs/10962098113/Cyberpunk%20Blender%20Plugin-PR-2024-09-20--15-31-39.zip)﻿\
\
[Wolvenkit 8.14.0](https://github.com/WolvenKit/WolvenKit-nightly-releases/releases/download/8.14.1-nightly.2024-09-23/WolvenKit-8.14.1-nightly.2024-09-23.zip)﻿\
\
[BLENDER 4.2 ](https://download.blender.org/release/Blender4.1/blender-4.1.0-windows-x64.zip)﻿

## Video Format

This tutorial is mainly in video form for simplicity. Don’t worry if this looks tough—it's actually really easy once you get the hang of it.&#x20;

First, open WolvenKit from the link above. In the video, I show how to open the project file from my template and install the Cyberpunk Blender Addon.

{% embed url="https://www.youtube.com/watch?v=P25T03CKAJw" %}

## **Replacing an Animation (Video Walkthrough)**

1. **Open the Blender Template**\
   Before replacing an animation, **remove all unedited animations** from the list. This ensures you're only exporting the animations you've worked on. Otherwise, the export will take much longer and include unnecessary animations.
2.  **Export Your Animation**\
    In this example, I’ve fixed the backward jog animation (FPP JOG 180), so that’s what I’ll export. Save it as `player_locomotionnnn.anims.glb` in:\
    `Template Folder\WolvenKit Template Folder\Player Animation Template\source\raw\base\animations\player\female\body\player_locomotionnnn.anims.glb`

    Just overwrite the file when prompted.
3. **Import to WolvenKit**\
   In WolvenKit, click **Import** and select your edited `.glb` file. It will import to the `player_locomotionnnn.anims` file, which now contains your modified animation.
4. **Update Animation Handles**\
   The game animations for TPP FemV are stored in `Player Locomotion.anim`. Go to the `locomotionnnn` file, copy the **Animation Handle** for the edited animation, and paste it over the **FPP JOG 180 handle** in the `Player Locomotion.anim` file.
5.  **Transfer AnimAnimDataChunk**\
    Next, copy the **AnimAnimDataChunk** (the actual animation data) from the `locomotionnnn` file and paste it into the `locomotion` anim data chunk. You'll see it’s at **Number 4**.

    Now, go to the **animbuffer** for that animation and set the **unkindex** to 4 (or wherever your chunk is located). This links the correct data to the animation.
6. **Frame Clamping (Optional Fix)**\
   If the animation doesn’t play correctly in-game, enable **frame clamping** to prevent it from going over 30 FPS. This should resolve most issues.

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

