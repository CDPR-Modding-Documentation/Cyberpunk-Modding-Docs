---
description: How to port props using the Props Creation Kit for World Builder
---

# Props Making for Gonks

## ▶ <mark style="color:yellow;">Summary</mark> <a href="#summary" id="summary"></a>

**Created & Published**: Jully 2025 by [PinkyJulien](https://app.gitbook.com/u/iKTJipgsEBTEnUVSuliSjOUuiJq2 "mention") ([Original Link](https://docs.google.com/document/d/1id5LszqjS5xs-OKshXc1JDjLLHwa5zZTFVE2ifQ18J0/edit?tab=t.0))\
Last documented edit: Nov 13 2025 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

In this tutorial, I’ll show you my own prop-making workflow, using my own updated [Props Creation Kit](https://www.nexusmods.com/cyberpunk2077/mods/5979). This tutorial will be focused on making props for [World Builder](https://www.nexusmods.com/cyberpunk2077/mods/20660)!

### Wait, this is not what I want!

* If you want to make props for AMM, check  [AMM: Custom Props](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/everything-else/custom-props)
* To quickly get the scaffold files, you can check out Wolvenkit's Prop Generator (≥ 1.17.2 | [Nightly](https://github.com/WolvenKit/WolvenKit-nightly-releases/releases))

## Prerequisites

I’ll assume you know your ways around Blender, WolvenKit and know how to pack a mod - if not, once again, check out the modding wiki

* [Getting started: Making Mods](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/getting-started-making-mods)
* [Blender: Getting Started](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/3d-modelling/blender-getting-started)

### ▶ <mark style="color:yellow;">Requirements</mark> <a href="#requirements" id="requirements"></a>

{% include "../../../.gitbook/includes/wkit-blender-plugin-current-version.md" %}

<mark style="color:yellow;">Tutorial uses: WKit 8.16.1, Blender 4.4.3 and plugin version 1.6.4</mark>

* my updated [Props Creation Kit](https://www.nexusmods.com/cyberpunk2077/mods/5979)
* [World Builder](https://www.nexusmods.com/cyberpunk2077/mods/20660)
* a 3D model to port

Please be mindful of what you’re porting, especially if your goal is to publish your pack on NexusMods!&#x20;

***

## 🟦 <mark style="color:yellow;">Preparing your Mod</mark>

First, we’ll prepare our prop pack mod environment!

My Props Creation Kit has been created for new modders in mind, and has been recently updated (11.07.25) for the sake of this tutorial, to give you everything you need for a proper World Builder “WB” prop pack

Download my Kit and un-zip its content into a new wKit project

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfBU16AolyyX-rI2WV_iUbcnHrnOG-Z68mQ-876pis6KFDUtBVg7S1mpzh-ChLSHjDWYOmTPpbSw1N6Gf7WsbYXSbIjVw8shnFPdfgBO306a9sr9uBGyj-6b1Wu193CcWCrsyCTrg?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

Before doing anything, we’ll have to rename some folders and files

Right click on the “**archive**” folder and **\[Open in Windows Explorer]**\
Rename both the “**your\_modder\_name**” and “**your\_proppack\_name**” folders with your desired names

Do the same for the “**moddername\_proppackname**” .txt file in your resources folder \
This file is necessary for WB to detect our new props - we’ll fill it later!

We can also delete the two instructions .txt files present in the main folder and texture folder - since you’re reading this tutorial, you won’t need them.

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXe4FUD8Y4tD8HV3R91-HtB_NjhFhRt98jvGtrgScvK90-lTK4UF_Q4bD9sojAnMIo9JoJc1kd_cSAJnh-1TbvTSWDbh_Jc9RtOeOSNUUxYGw3uAxAQaWMXb8hj_jw8bOOQjxJyp?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

## 🟦 <mark style="color:yellow;">Choosing the right model to port</mark>

Before porting anything to the game, it’s important to check the model’s topology; it might be tempting to port realistic 3D scans, but these models are a mess to work with due to their high amount of polygons _(often having in big texture maps, both resulting in really heavy mods 👎)_

On [SketchFab](https://sketchfab.com/feed), you can easily inspect a 3D model before downloading it

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcuOaFNcqacPZt6hV9aThHCNCDziyDNQ3P5S1aGoS9AAU5GlSNMnPegvzYOHYzVrqC-R_is7b3aipHvHPcIelcetJDXLyS_cviBUIHbIIxMK9Un7IDWsKtR_K7wKWnh7APUGUIW1g?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

For example, here’s a scan of a [Destroyed Car, by Renafox](https://sketchfab.com/3d-models/destroyed-car-07-raw-scan-916b51c7e5644eb2a6c9b3797ebb08cf)

We can see it has 2.5m triangles, and 1.3 vertices - but this might not mean much to you; for a better idea, turn on the Model Inspector (stacked plane button on the bottom right) and turn on the Wireframe - I choose Green so it’s easier to see

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcZeNTOvVOQDPZBdlq5os8bby-aAjXKDxYJxgYSyxpZ_MExAr8UEetCUrvRr7Oderem8xX1kX9E9CEs7huqo_wBcOJBJYNq0u6okeCbBnR1ftZo9EzxPoTERBMGoOaRHP1do_I75g?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

That’s a big ol’ YIKES from me!

{% hint style="warning" %}
You won’t even be able to export such a big mesh, as [Cyberpunk 2077 only allows up to 65,535 vertices per submeshes](https://tinyurl.com/vertex-count)
{% endhint %}

Scans can work for smaller props _(like my_ [_Nature Pack - Flowers vol. 1 pack_](https://www.nexusmods.com/cyberpunk2077/mods/10974)_)_ but unless you plan on remeshing, I recommend avoiding them

Here’s another model from Renafox, this time easy to port; [Old Rusty Car](https://sketchfab.com/3d-models/old-rusty-car-95baa20ebc5d4d2e869f0b549be838fe)

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfZ0jKRd6XFX8gPWz8PonzEmIprm0d2_NYrORp9aJ7fdLVQ5woemSQDb1pW48QfDjp7I7kj9D-5en2TbjuaDFeS8JQjQg6bA4aGI1ijVh2hCgSXR2fBQd5mxg8lgIqlE5Go-yPudQ?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

With that in mind, we can choose and download the model we want to port!

I choose a Floppy Disk for my Retro Tech pack

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcvdnC6HnbZVTOLn44HoxgYNQGK6goss67RmDVeiSgDe4iYR1AhsPEQsjSoowzHRzis0wgn8Tz_XRJlZ4xnKbW9VOyVjTYChae-U_m9cmfxlTyH7ZU2tnX1Kj0dJupe3oRyBbc?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

Majority of models come with their own textures, sometimes with normal maps and roughness/metallic maps too - if not, you can always create your own, or use the Multilayer system (we’ll get to it later)

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcX5umEGd5z1E9ao8b3JHh2HkW0uGr3iYXVSrtJ0FiEGJtL9czMTn9antw7NYdnLsy_15XjUtMaweSmR8Fu5pThjpaLMRCu9Yjd6ShsNeM88u-0EXjvU5aVcs0Ipdm22ulAFeFM_g?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

## 🟦 <mark style="color:yellow;">Preparing our Files</mark>

Now that we have our models, we’ll need the proper container to import them into the game

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXe1zxQQjNjfZUhOavta4nplijFwqPZ8Vr9PWr42eDe6eF8laj9mXobbACVp1245wM3OrEod6UnIIas6WuDGWD8pqGiaSSRsS0fopTeMdWUJANoJiI5Z5XAftCyMez8iMU4dHfFb0g?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

My Props Creation Kit includes three different meshes;

* sourcemesh\_diffusemap\_complete.mesh
* sourcemesh\_diffusemap\_simple.mesh
* sourcemesh\_multilayer.mesh

“**diffusemap**” indicate this mesh uses the \[metal\_remt] material\
It allows us to path different PBR textures; diffuse, normals and roughness/metalness maps

use the “**\_complete**” mesh if your model comes with its own diffuse/albedo map, normal map and roughness/metalness map

if it only has a diffuse/albedo and a normal map, use the “**\_simple**”

If your model doesn’t have any textures, you can use either the “**\_complete**” or “**\_simple**” if you plan on painting your own, or you can also use the “**multilayer**” mesh and handle your prop like a vanilla game garment!

{% hint style="info" %}
[Multilayered: Cyberpunk’s supershader](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/materials/multilayered)
{% endhint %}

Since the floppy disk comes with its own textures maps, I’ll delete the files I don’t need in my wolvenKit project. I’ll keep the “**diffusemap\_complete**” mesh

I have no use for the emissive “**e01**” map since nothing on my floppy disk will glow, so I delete it too, only keeping the three maps I need; the diffuse map “**d01**”, the normal map “**n01**” and the roughness/metalness map “**rm01**”

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdUu1ryc1-uw2AnnK2NNpMfnL4zY0idvSkrl4zb86ZYuJ_yToKWMBgCM9LWeglQHWEzzbm7MfbW9OUwGTe9ppPCEhRN9a7JP2Zl1b9m8G6AHupbkBxkk0mpCnE1OnK9qtLzkfDu3A?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
**AS OF NOVEMBER 2025** - The propkit pack now includes individual roughness and metalness maps
{% endhint %}

Now that I know what I’m porting, I can also rename my files

{% hint style="danger" %}
Never use CAPS in your folders and files names!
{% endhint %}

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXebQsnFOWazJxnEje8CW_J0-ISE9tU_rXEWLjW1aaRCurt_T9nPi908Cmucvq6opGYBkNz9INuMzLmw2rv-nnsCMN6Rv826PwAwHSiZnpHTVtOWj3RpkZzbURCrHn6g4POrMIQUyw?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

Now that everything is renamed, we’ll need to editing the pathing of the textures in our .mesh

{% hint style="info" %}
For the sake of this tutorial, I’ll be working in **Easy Mode**\
You can change the mode by clicking on the “**Editor Mode**” button
{% endhint %}

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXeMUwvMZqsumveQPmLsamWf0pOue8O2iMuGy77CnBOxMpDMMsyymuMxPyfss-zTtfQtjlhRo3srWazA_7SJQekQ7juN1lS_r-ep1xZXPyfNkVMwHoaQP8hEon3qC7dZCBi9u-7C?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

Most props you’ll port will probably only have one appearance - I’ve added two appearances to my Kit’s meshes so you don’t feel limited to only one; it’s really easy to add multiple variants and to use them with World Builder!

For this tutorial, I’ll handle only one appearance

Right click on “**appearance\_02**” in the \[**appearances**] list and delete the entry by clicking on “**Delete Item**”.  Do the same for “**dm\_02**” in the \[**localMaterialBuffer**] list and \[**materialEntries**] list

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdBRnMTJO72CuUtXQYPAIwNEbz4lqIrjVfzzDdXynQpIXaUATQVzQF5ypxhj5HMZNlIRQb1iPi8j0mFxiSKzmDmFLIWmni2cDIVieVdEz8Upn8hVZzJqsmhQHsCWHII4LKI99U7OQ?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

Now, expand the “**dm\_01**” material in the \[**localMaterialBuffer**] list\
Here, you’ll see a bunch of values and paths:

* **BaseColor** is the path to your diffuse **d01.xbm** texture
* **Metalness** is the path to your **m01.xbm** or **rm01.xbm** texture
* **Roughness** is the path to your **r01.xbm** or **rm01.xbm** texture
* **Normal** is the path to your **n01.xbm** texture
* **Emissive** is the path to your **e01.xbm** texture

{% hint style="info" %}
For a guide on what each maps do, I recommend checking the wiki\
[Textures: What kinds of textures exist, and what do they do?](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/materials/textures)
{% endhint %}

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXf8kMccHtq23JyXfNN5yTeSLOdRyf0NIALIP072SD9rHue7Hea7UP3dxdUQhSG8q42CGc3UR3HaFfRvEdVMVxB3-WvilrO7uX8Nbpy-SDnixljs67WJ_HqbtnFjoRG70H1FDHHd8A?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

Since I deleted the emissive map, I can safely delete the last three values; “Emissive”, “EmissiveColor” and “EmissiveEV” - to do that, select all three values, right click and choose “Delete Items”

Now I’ll path the correct textures into each respective entries

Right click on your diffuse d01.xbm and choose “Copy relative path”

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXetOMNxXa9seNUyo4El-pX0YNWqr4nIaQEEbqWiQQrAbhv7QePk67AZzuIwXALtZUwhwoOWLku08WMmIUtqTuZuWPNwMlk2JsHbryp4S0tDoaOGrLXeUqB-hcWGwpt0jV5WKtNK8w?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

And paste it into the “BaseColor” value

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfnsJgrykFv9gJ9yr_M-WzgSQPNkcmWrQEPSL88qgzzq3R6S1aaEPmUDLxOrlJJFZHHpI3zi_JPoq5MupaysH4SNAksckDsZouD4DakfrPvFC0bq7bbpVdq3EAGq-kmHko1AstJ?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

Do the same for the rest of your texture maps

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcuT1ihn6Duuj_TrDSD_gG0V8PUKhKGcskePMpS-m2_qW-LothCz29MzTBOOnaU6YRQChD6OyF-yBixnAKaCPVWj0ilq9nSdESCCD-xNULb-fzVKiEBeaZ0y-EIlxVZEM6B3yg1yQ?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

Once that’s done, save your Mesh by pressing CTRL+S or clicking the “Save” button

We can now export our files so we can replace them with the one we downloaded and want to port 👌

Go into the “Tools” tab and choose “Export Tool”\
Here, select your .mesh and all of your texture maps

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXenc05dJTdFy01gFHNEP17xO9X8M7CEyGfbaQxcp7cgJ27CBmxWKt_Y7Jn6Q3Lgit_02ywVbzMjnoHuglPD1mjfqqQvKIGo2u-u0aJzQPUpWSUuMo4NBW_HRKd4qOT9LCRqTvwCzg?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

And press “Export Selected”

Our exported files will be available in the raw folder\
We can safely delete the “.Material.json” - we don’t need it 👋

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXf2kvTveRGRMffggRf_8fcYOgj9RM5V23X9eYij19bIZgqtretV0X6zibonoUyZWO4rTBDBxL20RphrsV-EfUhfzdUR1jo_onjSFsuMsJGm0bneTGxzJvTf8pBELMvk6rxFrxyl?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

## 🟦 <mark style="color:yellow;">Preparing our Model</mark>

We can now switch to blender and work on our model

Chances are, if your model comes with texture maps, you won’t have to unwrap its UVs - if you’re unlucky tho, I recommend once again to check the wiki _(your model will need UV regardless of if you choose to go with texture maps or multilayered materials)_

{% hint style="info" %}
[UV Mapping: texturing a 3D object](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/materials/uv-mapping-texturing-a-3d-object)
{% endhint %}

The first thing I recommend doing after importing your 3D model is to fix its pivot point! \
This is REALLY important to make your prop easy to use and pose in game

Select your mesh, go into the “Object” tab, “Set Origin”, “Geometry to Origin” and then “Origin to 3D Cursor”

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXf5l1hoFmN5wH09zBqWPYLOQfFd9YNgpAzV-iKb4lRf2TcfA-kGJYRTKuu8TMWG06c3pFVNGPnYPNCRaZ2OklfDLqlmAend8IBLjeVfdgvUwvNwGCfaWcQnHbDTi5RD6o9EsIBlzg?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

I also recommend importing either a MA or WA CP77 body for a scale comparison - you wouldn’t want to spawn a gigantic floppy disk the size of the Crystal Palace, or a microscopic Eiffel Tower

Keep in mind that we can also resize meshes with World Builder and AMM

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXeg9lotw0wKc6C90uLaXZ7ZD69ENuiEZ109XpLWvvY_QIazlPZhFHzlZ_SmV6bHosLumNmyxLSDGl_utJu5K7jNvc8kZOP6wjEcz8_GaphibulnQsnjb8QPRlJFiPandZ1Nrqgr?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

That seems fine to me so I won’t edit the scale

If your model has a lot of polygons or has multiple objects into one, you might want to split them into different submeshes _(You’ll also need to split it into multiple submeshes if you want to include special materials like glass or moving screens in your prop!)_

{% hint style="info" %}
[Submeshes: How and Why we split meshes](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/files-and-what-they-do/file-formats/3d-objects-.mesh-files/submeshes-materials-and-chunks)
{% endhint %}

Once your model is fully edited to your liking, we can import our source mesh that we exported to .glb earlier; we can find it in our Raw folder

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXetSITcljAs8ffGYzitxjPHPZoTkyGwVPe_minCgA2MNTPYPzvgc3evLW770qcWnyDCHnygiG2vsKEnz8QM-V8c3kbqskTcTqE3zS6RIbtBidb0sPtSvjKh2c0ABzIhqzM9HsVqSg?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

Select the cube, enter Edit Mode (press TAB) select all of it (press A) then press X and delete all of its faces

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdvaENCMEXUMUifAxMtiwH62b4XGkm_vTssUeS4L4e_vsA6W3u7UG0CfMcSg_VTtpbOoC5KSKTQrqXKqJVUpIA9OXTAoucAdOG0KcqexOs8Ypy2Aj3UM_CFt-d2DAhstW3AVyjTgw?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

Now that we’ve emptied our submesh, we can merge our prop into it!

Go back into Object Mode (press TAB) select your prop model, then CTRL+Select your emptied submesh 00 _(your prop should be dark blue, selected, and the submesh\_00 should be light blue, active)_

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfeh3UFNBVX7nX6bORdujKSEcOjsukHr5V8V6kg7yW3RHx8jgB62JB_Ta6elTFcRc6BrtsGgE2eXCCoRmm3Rj0UefaC6SbElcM29NEPIc6BMaAG8kwe56w7bZiu06ouBzHCuZlkvg?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

Press CTRL+J to merge your prop into submesh\_00

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfg08RlWgFPbPRTDavFiIAzTGmYFdgx2wvlzkwAQYNO1K74O1ZywQDGGg8vQ7Vdd4LN1Zy_NK9AW0l_jVmIHD7XUn5CURAbLyAO6YsaMHWLaRHiWHKkrJ_pfRagdF1VmHRpcPKk?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

Your prop is now ready to export!

Select your submesh(es) then go to Export > Cyberpunk GLB\
Make sure to check “**Export as Static Prop**” and overwrite your prop.glb

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXe80G2T-Iw5wadX4oNo8IG1sA41FGqbH5NXzp4yJoBoKdsYes4-hFjuThV5W58ePjsnVo4gHawmtEhqQjEYH_I9eqQUDgd5rMUIQmNiBBLhvfllEfhMDW0jgrIgnNIotW2DVOiJxw?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

We now have to replace our texture maps

Open the Raw textures folder that contains the .png and make sure to replace each maps with the corresponding one:

* d01 is the diffuse, the albedo; it's the map that looks like the correct colors and aspect of the object
* n01 is the normal map; its the purple or green map with bumps and highlights
* rm01 is the roughness and metalness maps; you can actually split them into two distinctive maps, r01 for roughness and m01 for metalness if needed _(simply duplicate and rename both the .png and .xbm)_

I’ll split my rm01 into two because I prefer it that way

{% hint style="warning" %}
Be mindful of the size of your maps!\
Small props work fine with a 1024px map; 2048px for bigger props like chairs, tables and couch. I don’t recommend using 4096px or higher maps unless your prop is really, really big (like a whole building)
{% endhint %}

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXd66xRur0AVpDUJWcA1ewzq-ZffnMOccfjKC7CuMJNgcgzE58JJwKTFEMh2VBQd-VRp79OvD1_sfjsz2rriboMj9pahsCRwRKFRyEePwyUrzlmLWR1M66-KuzNKcGYNaIYxmslttQ?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

Once everything is replaced, go back to wKit and open the Import Tool

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXeK8lcxiy2mrSJoXz6tgge9WIo2HQyslB_TCavI4LitY3iznAR_EUzSNmvZWTrrYaoH4RZcELwIcCqIQSwjBLHyEezkWe3kzlyxnZcUPe2VlNHDqcWZBWEn83w5rNUQRG4QzVyd?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

If everything goes well, you should see your prop show up in the File Information preview window when clicking on your .mesh ✨

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXc1pyfIQlhhUu6vRVYjqaEfiWyaq6zZHuMcW9NPJWdo2HaYQk0UIm2R4goi__kDpEjFqeAvSKrmIQooZmldwxlDZllP19eCw24WMI3wqUSjtOJQS5f2cthE7v6co_YZakCBWe0neQ?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

To make sure your textures are correctly imported and correctly pathed into your mesh, you can also open your Mesh, go into the “Mesh Preview” tab and click on “Generate Materials”

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdNp_bqYsfZJItvyAzAqtPhIFpkHqTnra3ayDqFtqb4j0rGVDVABQro41J54TFxLYZ6709NIZ3PcnC5uVsSYalybFalEPRJTKvpD0BuEved6A5a78q6n5LprvF-z8a1JijeL3FZRw?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

We need one last step to make sure we’ll be able to spawn it easily with World Builder

Open the .txt file from your Resource folder

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdAdyVdst5kZPru5YANtU9hPcliIkV7TO56AIiTc2zj2txPvRTk4YAj4lQnM4mILa03FjlakpAPZDaphM3zE7KzIFAvsIFPi1__wMoudzlZkRqNDskUsCB2FJ7AKTe1R2UmPGFW?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

And paste the path to your prop .mesh _(You can easily copy it by right clicking on your .mesh and select “Copy relative path”)_

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdXIR_7KEpK09-bvBIvMhX7uHCbxKobEU2L3pIQzWKTi8fBFtCRqpOvQsv_E8ZFgt8Zldi4GdxarwTS_SPSU0CgnabnTZ54WpHyvPksLl-TEav_2M-_CBpPxEZAzAqXPvzUcoG64Q?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

You’ll need to add all of your pack’s meshes path here!\
Don’t forget to save :)

## 🟦 <mark style="color:yellow;">Test and categorize your prop</mark>

Open up WorldBuilder and type in your mesh’ name

If your path is correctly set in the .txt file, it should show up!\
&#xNAN;_(Make sure to select Mesh in both Object Type and Object Variant)_

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXc4u7tr60J6kpjMHN5m3_40f4u13dMMxOndH1iEVVvJUx-M1BPGv_ajsCE7bwbKFxHQigLxNJ_K3xURDQ0WHr5CewuEjTH4GUCdtoiMPr-OvZRemgFx0OwvgjaevnxnVLS2VjW7jw?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

Click on it to spawn it!

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdTUgzHTukC5lM8VLVJiZ1zUTKQLyL09FZLl6YmVSu4sAwnu3lm5YA9imv_09Z14rUnUyQEDHFmZ8YiPoDM2jKxOumQoqPBvQQY3sMTy9M16f7H_GQqJLHtgynrb4mUnV6-xLYoHQ?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

You can always come back to the model and the textures to tweak things if it doesn’t look 100% how you’d want it :)

One last step I recommend doing before sharing your pack to the world;\
Make a new category and add tags for your new props!

{% hint style="info" %}
[World Builder: Favorites and Prefabs](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/world-editing/object-spawner/ui-tabs-explained/tab-favorites-and-prefabs)
{% endhint %}

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXeuwMY4WwUyATZVjq158j4whqC8QsRwkgV6USA71Zl15cDGsitI7mTUu4B6BIgSwCQTDhc9C9FMRTH9VxXX1O9s6-8Yw9W1dzy20wz5rcGKjjPBk_cw04chsYdNPx9sCCdYuRuLww?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXf6XcToQ2HnBYDByjs_95P1noxvmSYlnT_XNr127kuwFhCAMlbgHSdO22CMaicOkSHFOCZinmm3jKnUfZp0hDRArJSwdZ_BW5SBjge2gCRuBEO5Q-D0XSPHjzo4bRvzFXeZecoL?key=AdJcyfKc-rq9OsJ-Sb9gww" alt=""><figcaption></figcaption></figure>

