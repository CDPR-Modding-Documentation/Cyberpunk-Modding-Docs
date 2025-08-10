---
description: Or how to fit ported garments to Cyberpunk's "A Pose"
---

# Refiting 3D Ports: T-pose to A-Pose

## <mark style="color:blue;">▶</mark> <mark style="color:yellow;">Summary</mark>

> **Created & Published:** March 2 2025 by [PinkyJulien](https://app.gitbook.com/u/iKTJipgsEBTEnUVSuliSjOUuiJq2 "mention")\
> [Original guide written on Tumblr](https://www.tumblr.com/pinkyjulien/758176432758374401/hi-can-i-ask-if-you-perhaps-have-a-tip-for)

For a lot of ports, the first step is usually getting the garment to fit the Cyberpunk' bodies "A" pose\
This tutorial will guide you in tackling this first step!&#x20;

For this guide, you will need:&#x20;

* Recent version of [Blender](../../../for-mod-creators-theory/3d-modelling/blender-getting-started/)
* Basic modding knowledge
* Know your ways around [Blender](../../../for-mod-creators-theory/3d-modelling/blender-getting-started/) and have some [basic garment refiting](../../../for-mod-creators-theory/3d-modelling/mesh-sculpting-techniques.md) knowledge

Depending on what type of garment you want to port, and from where you go it, there are multiple ways to tackle refiting it to fit Cyberpunk' bodies "A-pose"&#x20;

***

## <mark style="color:yellow;">◼</mark> Example 1: My model is rigged with custom controls

Most models that are shared for 3D render purposes _(downloaded from Open3DLab or SmutBase, for example)_ will come with their own rigs and their own custom skeleton controls; this is the easiest type of model to refits to CP77's A pose!

<figure><img src="../../../.gitbook/assets/image (594).png" alt=""><figcaption></figcaption></figure>

Select the RIG controls and enter Pose Mode, \
you'll be able to rotate the controls to fit the model over the CP77 body

<figure><img src="../../../.gitbook/assets/image (595).png" alt=""><figcaption></figcaption></figure>

If the different submeshes doesn't not automatically follow the rig, make sure they have an Armature modifier with the correct Rig set in it

<figure><img src="../../../.gitbook/assets/image (596).png" alt=""><figcaption></figcaption></figure>

***

## <mark style="color:yellow;">◼</mark> Example 2: My model has a rig

Refiting rigged models without custom controls will be similar to the first example! \
Some models come with their own rigs _(models directly extracted from games with modding tools that have rig options, for example)_

It's a tiny bit less practical than refiting custom control models cause you'll have to find and move the right bones needed to affect the sleeves in the desired way

<figure><img src="../../../.gitbook/assets/image (597).png" alt=""><figcaption></figcaption></figure>

Enter Pose Mode and rotate the bones around

Don't hesitate to also move the bones or/and the model itself - don't stick to only rotating it\
The goal is to make it fit the CP77 Body; you don't need to pay attention to the original model fitting into its original rig it came with _(you will delete it later anyway)_

<figure><img src="../../../.gitbook/assets/image (598).png" alt=""><figcaption></figcaption></figure>

***

## <mark style="color:yellow;">◼</mark> Example 3: My model has no rig - we ~~die~~ refit like men

If you're porting models directly from ArtStation, Sketchfab or other 3D hosting website, you'll probably get a simple non-rigged model _(same when extracting files from a game with simple modding tools)_

<figure><img src="../../../.gitbook/assets/image (600).png" alt=""><figcaption></figcaption></figure>

Depending on the pose, I won't lie, this is a pain in the ass 💀✋ so buckle up!

You'll need to work in **Edit Mode** with the desired submesh selected _(if you have multiple submesh, I recommend merging everything together and un-merge them later via the UV islands)_

<figure><img src="../../../.gitbook/assets/image (599).png" alt=""><figcaption></figcaption></figure>

I recommend first working on the front of the model\
You can fix your camera by clicking on the "Y" here

<figure><img src="../../../.gitbook/assets/image (601).png" alt=""><figcaption></figcaption></figure>

Toggle the **X-ray** vision to be able to select back faces

<figure><img src="../../../.gitbook/assets/image (602).png" alt=""><figcaption></figcaption></figure>

And enable **Proportional Editing**\


<figure><img src="../../../.gitbook/assets/image (604).png" alt=""><figcaption></figcaption></figure>

This will come in extremly handy and allow us to "smoothly" rotate / move / edit part of the mesh without creating "staircase" effect and harsh corners

Since we want our garment to go from T-pose to A-pose, I'll first select the whole arm area; \
press **G** to reduce the **Proportional Editing**'s effect radius _(we don't want the chest to be affected)_

<figure><img src="../../../.gitbook/assets/image (605).png" alt=""><figcaption></figcaption></figure>

I'll first slightly rotate the sleeve with the Green ring

<figure><img src="../../../.gitbook/assets/image (606).png" alt=""><figcaption></figcaption></figure>

Notice how the shoulder area follow the rotation as well

Without un-selecting the sleeve, press **G** to enter free movement - increase the proportional editing radius just a little bit to affect all the shoulder - and move the sleeve downward

<figure><img src="../../../.gitbook/assets/image (607).png" alt=""><figcaption></figcaption></figure>

Do this again and again until the sleeve is in the correct position \
I recommend changing the selection often during the whole procedure _(Take your time!)_

<figure><img src="../../../.gitbook/assets/image (608).png" alt=""><figcaption></figcaption></figure>

There will be some sagginess near the shoulder and armpit area; that's normal and fixable\
You can edit it now or after the sleeve is correctly fited!

<figure><img src="../../../.gitbook/assets/image (609).png" alt=""><figcaption></figcaption></figure>

Change the camera view to the side and you can now do the exact same process from this view 🤠

<figure><img src="../../../.gitbook/assets/image (610).png" alt=""><figcaption></figcaption></figure>

Once you're satisfied with the overall fit of the sleeve, you can edit all the little details like the elbow, the cuffs, the armpit ,the shoulder, etc etc

<figure><img src="../../../.gitbook/assets/image (611).png" alt=""><figcaption></figcaption></figure>

You can now do the same on the other sleeve!

When refiting garment ports, I recommend using and abusing the "hiding" function (shortcut **H**) to hide part of the mesh while you refit - but be cautious not to accidently hide a part that is close to the area you're editing as it might be affected by the proportional editing, otherwise you will notice gaps or extreme stretch when un-hiding your mesh! Nothing unfixable, but still annoying

Happy refiting! 🙏
