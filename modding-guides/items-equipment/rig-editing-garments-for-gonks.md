# Rig Editing Garments for Gonks

## <mark style="color:blue;">▶</mark> <mark style="color:yellow;">Summary</mark> <a href="#summary" id="summary"></a>

> **Created & Published**: June 2025 by [PinkyJulien](https://app.gitbook.com/u/iKTJipgsEBTEnUVSuliSjOUuiJq2 "mention")

This will be a rough copy/paste of a tutorial from a Discord chat.

I’ll go over how to edit a RIG: both the actual .rig files and garment’s armatures. This is useful for moving dangle bones, present in hair meshes or necklaces, and also for porting custom motorcycles that do not fit the game’ vanilla bike rigs, for example 🤠

### ▶ <mark style="color:yellow;">Requirements</mark> <a href="#requirements" id="requirements"></a>

* a recent version of [WolvenKit](https://wiki.redmodding.org/wolvenkit/readme) <mark style="color:yellow;">| used in tuto: 8.16.1</mark>
* a recent version of the [CP77 Blender Plugin](https://github.com/WolvenKit/Cyberpunk-Blender-add-on) <mark style="color:yellow;">| used in tuto: 1.6.4</mark>
* a recent version of Blender <mark style="color:yellow;">| used in tuto: 4.4.3</mark>
* Eagul’s [Bone position and Matrix scripts for Blender\
  ](https://drive.google.com/drive/folders/1kCMdFteY9qNWnRLIV5OxiBRY4higSONs?usp=drive_link)_The scripts included in the linked folder have been slightly edited to make them easier to use!_

Huge thanks to [Eagul](https://next.nexusmods.com/profile/eagull?gameId=3333) for letting me include his scripts directly in this tutorial, and for his guidance while I was working on the [Thundergod](https://www.nexusmods.com/cyberpunk2077/mods/21522) 🙏

For a more in-depth tutorial on Dangle Bones,[ I recommend checking Eagul’s tutorial on the Wiki](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/3d-modelling/meshes-and-armatures-rigging/dangle-bones)

***

## 🟦 <mark style="color:yellow;">Exporting the Mesh</mark>

This tutorial was initially written to help a choom refit Fingers’ collar for Fem V; I’ll be using the same mesh and same screenshots here!

After adding your mesh to your wKit project, you’ll need to export it with its rig

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdGvznU2UJhwbs_uhCArl-DPIRDf8guFHvIjC7jMXr9hHf8RgLffF_SsGl-BaxrrpkvtV3Pj-zCl8ToNt9R0nCsR0ZEBfTqwmVpKzuFyWTi8Wobm87BE45oTeZpEgErZlKXGA8hug?key=ai1S6sFeCblBDAjdio0ziA" alt=""><figcaption></figcaption></figure>

Select the “withRig” settings in the export window, and make sure to add the corresponding rig to your garment; it can be a regular rig, or a dangle rig.

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXd5gqFfgcR_i56UXSdZP13gTzb72-EXrAtCWKMsEFRv0bnjKzBphqFNYiTg2sQ1b0HQ_7tAEHh6UAiu3xEFk0QeQ5HtCM5a3W0N8BnAYZYGtu5UJnHZwZcLqHENUsjNZBnFsAaRIQ?key=ai1S6sFeCblBDAjdio0ziA" alt=""><figcaption></figcaption></figure>

## 🟦 <mark style="color:yellow;">Refitting the RIG in Blender</mark>

To refit your rig, you’ll first need to refit your garment to the new desired model; in the case of this tutorial, Fingers’ collar will be refitted for FemV

Take note of the bones position on the original mesh, as you will need to follow the positioning once your refit is done.

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXf9WsAhPEEPyCjbfqhaVUUfR1WAr_gzszhv7X4MLaAx4ZqCY3x7YzEC9zjSj2-1diaPFyOEoO7pZfzN41yhqG1Q0hpqxucWg0_zQFELd6QJNMJOrdoXxLBBTJylFilWU7VM4WCitw?key=ai1S6sFeCblBDAjdio0ziA" alt=""><figcaption></figcaption></figure>

When it comes to Finges’ collar, only 3 bones matters;

* Neck
* dyng\_Necklace\_01
* dyng\_Necklace\_02

{% hint style="info" %}
Bones with the prefix “dyng” are dangle bones

Dangle bones have physics in game, making garments follow the character’s movement in a dynamic way
{% endhint %}

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXew-ROV_aF8NfMgDq1lSCEAJHqkgrfXe1fWfmj1dsCluTAb7QcX0s5Su4irtBbv34i91KsVDvYk2iS5GfHsMMTPsV3JGHJFh8Tu0_pYjv80tuL3Wctrt80PbJ4qnV4ezl64xVeaBg?key=ai1S6sFeCblBDAjdio0ziA" alt=""><figcaption></figcaption></figure>

_(imagine the collar is actually refitted 🤠)_

Once refitted, click on your mesh’ Armature and switch to Edit Mode

Only move the bones that interest you (you can hide all the others) and reference other meshes to know where to position them:

* The Neck bone should match the vanilla WA RIG Neck position
* The dyng\_necklace\_01 bone should be at the first hoop on the collar itself, like the original collar mesh&#x20;
* The second dyng\_necklace\_02 bone should be at the second hoop, above the leather pendant



It’s now time to prepare your scripts!

I personally change the Timeline window at the bottom into a Text Editor, then split it in two (you can do so by right clicking on the window and selecting “move/split area”)

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXd-5QvmYoAWuAgsTbrmDgchkmrhpeB1e4XZagJVRtDYiCsXAbWmw3sVzchaCkGgGjUJJgEB34uxsWEiR8bXWHpn5TDGP-paASc8Ae2j3dJaNlFZXBLVSEliILD_oC6LDBfWbRRE?key=ai1S6sFeCblBDAjdio0ziA" alt=""><figcaption></figcaption></figure>

In the first window, open the **rigscript\_boneposition.py** file&#x20;

In the second, open the **rigscript\_meshmatrices.py** file

You’ll also need to open Blender’s console window \
Click in the "Window" tab at the top > "Toggle System Console"

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfkCAvRbtWBWkcjUZRO8Gd5fwC3a_dIRgEVflGtee-NdjcKwLXY1EdOHNFLKz91VisGLeg3_sbOB7fUw5r7-u8IkyQvDPLCGVqyCVeDCE7rSJHU4vAHQOuQngKN7xa6IkxdxFvV7Q?key=ai1S6sFeCblBDAjdio0ziA" alt=""><figcaption></figcaption></figure>

Once you have everything ready, the bones fit your refit, your scripts opened at the bottom and Blender’s console on the side;

* Still in edit mode, select the first bone you need in the bone list (In this case, we’ll start with Neck)
* Press "play" on the first script "bone position"
* Press "play" on the second script "mesh matrice"

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXeWfbSaijfVZTwfUEZe7gP-vlk_jSCeIa-rJGNJohK-OH7Mpesolk9Z8W3SKqZjoVnFCJKE_E5y6U3rk6nMKpwe3yUZD9OFI6lhG82MP2GxMMZPJ7Fw7wnxwu6wwJiaWyxapims?key=ai1S6sFeCblBDAjdio0ziA" alt=""><figcaption></figcaption></figure>

You should see a bunch of numbers appear in the console

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcxzu8bRhOZ-u03yG5hxGk60olgZ16mZOGz-lEuAOsXablG-HXLotNUkJVQfTCo7eFCckSz5t8Gnszaf-836OIApugT1MpCd7OV6f8t-LWMOsAv5ct-am5Se_pvstsX144OrHTn1A?key=ai1S6sFeCblBDAjdio0ziA" alt=""><figcaption></figcaption></figure>

With this, we can now edit our .rig and our mesh armature in WolvenKit!

## 🟦 <mark style="color:yellow;">Editing the RIG in WolvenKit</mark>

We’ll start with the actual **.rig** file

I recommend making a copy of the rig you’re editing and removing all the bones you won't need; in our case, since we want to make a refit of the collar itself, we’ll be keeping only the Neck, necklace 01 and necklace 02 (Since this tutorial was quickly made on Discord, the screenshots will be editing the original rig)

{% hint style="info" %}
To check which bones affect a garment, open its .mesh in wolvenKit and expand the bones names list!
{% endhint %}

Open your rig, and find the bone you just pulled the numbers from; Neck

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXegkQCas7lVLC_-GPQlctQmwXaEsU4y8XwEZw8sgK9rZxiL1xZQop1DCQh0TBzy4PKlkJoegCWbWNiPmwYwI3B-o5vIXFbQTMxENNXLuPL976QF-FwKpWEKEsRx9_M5H-fM9FBBXg?key=ai1S6sFeCblBDAjdio0ziA" alt=""><figcaption></figcaption></figure>

For this specific collar, we don't need to mess with the Quaternions rotations and will only need to focus on the Translation values. If you rotate the bones, in the case of hair dangles for example, you’ll need to also use the rotations values

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXc2rQkYMTZKdI86s0nNNcG_6q1z3Kr5gw92Kx-KExoOVO2Zeqp9RUM7QW0DZ0colphUdjM9TphFxRBHOvBZZkHWL_FjmGQotrQD1eRC56CVoamsr-udUwI659oIv-4dsU2XLYZM?key=ai1S6sFeCblBDAjdio0ziA" alt=""><figcaption></figcaption></figure>

While working on my bike mod, I noticed the order in which the values were displayed was different from WolvenKit; that’s why I edited the script to add all these letters 👀

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdUtHYSBexAhfSoB8pOB2tKSuByKXca0RehP83NRcxLxgUr-enCu5j634LrZ6EjGiSORmZGxxRN2YA-s-nwnyta_9db_Re7Cb2x0QqiUoBQTfW3pX90Zo5aP-jBZjsxR9tM_K6TDQ?key=ai1S6sFeCblBDAjdio0ziA" alt=""><figcaption></figcaption></figure>

Simply copy and paste the values into the corresponding field in wkit\
**And be sure to replace the dot with a comma!**

Then for the mesh armature, we'll use the Bone Matrix numbers

Open your mesh and expand its **boneRigMatrices** list

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXedX9atYsQJL1eqnGVVeDLXWXNqUOZ-wRcQSdsmDFCkNdN8o36cSU9PCOaSjhrgKaBsLMoVhklodDy-xWOO4YzXWWF-4tDSviZEWYrZgXsyeL3hAX0kANv0es_nG12Ja2eUW7M0?key=ai1S6sFeCblBDAjdio0ziA" alt=""><figcaption></figcaption></figure>

There are 4 lists, <mark style="color:blue;">**W X Y Z**</mark>, that have 4 values each, <mark style="color:yellow;">**W X Y Z**</mark>;

* <mark style="color:blue;">W</mark>
  * <mark style="color:yellow;">W</mark>
  * <mark style="color:yellow;">X</mark>
  * <mark style="color:yellow;">Y</mark>
  * <mark style="color:yellow;">Z</mark>

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXd7yPGObIjFzbFiwSWN3lvtUUoO1G8PZDd3ezll0O3jqTxJa6bVjz1wI4OsrGBQ6Jppl5vj7xhyVculnVNxUZsKF1x1lupIwLF06n-cpAJWw8-AnDfGn553KqXKzUMv26Eb5tzxXg?key=ai1S6sFeCblBDAjdio0ziA" alt=""><figcaption></figcaption></figure>

Thankfully these ones are in order, and already have a comma, so you can simply copy/paste them directly in the corresponding field!

Repeat both step, Bone Positions in the RIG and Bone Matrix in the Mesh, for all the bones that has been moved

Once you’re done, you can simply export your edited model from Blender into the mesh with the edited matrices, and link your edited rig in the entity’s animated component!
