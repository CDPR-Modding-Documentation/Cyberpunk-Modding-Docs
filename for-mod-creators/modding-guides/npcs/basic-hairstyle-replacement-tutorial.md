---
description: How to add custom hair for V
---

# Basic Hairstyle Replacement Tutorial

**Published:** 17.03. 2024 by D.I.S.C.O\
Last documented update: 18. 03. by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This guide will teach you how to&#x20;

* port a hair mesh from a different game to Cyberpunk
* add physics ("dangle bones") to parts of it&#x20;
* use the UUH4V framework to avoid conflict with NPCS

### Wait, this is not what I want!

* For an overview of existing hair files and -colours, check [hair.md](../../references-lists-and-overviews/cheat-sheet-head/hair.md "mention")
* For a more detailed guide on hair physics, check [dangle-bones](../../3d-modelling/dangle-bones/ "mention") or [moving-a-dangle-chain.md](../../3d-modelling/dangle-bones/moving-a-dangle-chain.md "mention")

## Requirements

* [WolvenKit](https://github.com/WolvenKit/WolvenKit-nightly-releases/releases) >= 8.13.0 (you should have it [installed and onfigured](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/getting-started/download))
* [Blender](https://www.blender.org/download/releases/4-0/) >= 4.0
* the [wolvenkit-blender-io-suite](../../modding-tools/wolvenkit-blender-io-suite/ "mention") (most recent version)
* [UUH4V Framework](https://www.nexusmods.com/cyberpunk2077/mods/7181) (To avoid conflicts with spawned NPCs)

## Introduction

You first need to understand the files you need for hair to work in CP2077. There are three type of files: the Mesh, the Texture and the Physics.



## The Mesh

\-Begin by importing the player’s head. This will allow you to adjust your mesh more accurately and to avoid clipping.

**Path for MascV head:**

`base\characters\head\player_base_heads\player_man_average\h0_000_pma_c__basehead\h0_000_pma_c__basehead.mesh`

**Path for FemV head:**

`base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\h0_000_pwa_c__basehead.mesh`

<img src="https://lh7-us.googleusercontent.com/c7r1m8lnmv4ZQKUBMP80hb1KfXuB3zkouaU8KxfVHCI-b_8Zxo8MHAvo7E2ATDEowIPsLtpPCkpAEdpWJ8ybDIqe-adatU5HQpqkOpYJ8dt0I9gLaJHYmMBbV6H_9CBuOQHshWPlxMjJHyUFBre4IFw" alt="" data-size="original">![](https://lh7-us.googleusercontent.com/2Ezimo8M6XC82ieS8jtJlYi\_rHTaWqBRsqIb3ARPUM3cQoakKTJ84gWpu9Xn3TU0MLVDNiBnvC-kQYmaBCsOAnR2ELH0fi4SH7MCLvvohUyvszhnYOy8UG4AOHMBBQ95folmwBov8PZ\_OUFQbcY-Ig8)

\-Import your hairstyle mesh. I’m using Festive Hunter’s hairstyle from Nier Reincarnation for this tutorial. I choose this hairstyle because I can also show you what to do when your want to add ornaments on your hair as well.

![](https://lh7-us.googleusercontent.com/DqWvm3pd9kU2DRY7KRYVfStxPWIJegTPAICZKHHqCi8esvj1uv1h\_OdfaQ9FKdeTmP\_aOw\_Ns2-hDdsZq9EozTwT9iIA6oqnIYB5XdDW36HilS4G5XkFGpca2yrf2OjDWR0rPAPdkkgB8axunJ83hcc)

\-Delete all the bones, modifier and materials in the mesh when you import them into Blender. You don’t need them.

![](https://lh7-us.googleusercontent.com/JAbjv0YPH9jhurCT0c6cdY1RSdaysWRtDgF8nn7tHlW3NSnT1-Dsym0kcoyqvIW7VUPXYGhF5puJpX1kmVJpJlZelb84ZnAIi19gptlwyboU9wIljiNApPSzqyPBR-J41Dd\_-uCG4n8NzgFvXJoSEGc) ![](https://lh7-us.googleusercontent.com/J\_WTA1Z0eJz5V1eQLbt\_-aX4oarj2\_GUQ1Woz-1F4mxmwZ2XZd1z3D2wDiTp51zvm2NWMzJZURqaSm8xhRsleG8jbrdanTxTTQruQJ5nkgLvSoZitwr7bWtQieC6exMujoqIQ1KvwEJvwEM04uJI5nE)

![](https://lh7-us.googleusercontent.com/SG7\_PIkHi6MyWwUNKNxLGZmnmtTTfflsUl4zsdiR-VaJSbxMY7h\_-9pN-75hO8jf88PatAAz7hySLYTQkF0YF3TyCFq66zQxwO1mQZPolEwQDGKAy5bp-ExMc1BUnbYGfIiAg2mXrAWXnaOARY6VVCM)

\-Refit the hairstyle to fit V’s head. Be sure to check around the edges of the hairstyle to avoid clippings with the head.

![](https://lh7-us.googleusercontent.com/mDl79Ew7f3Ar01mCtvZzePe-LOy8EpHaNsPuPmCry3H91XKvOAhqlu39fbn6PTVzylXcBvhEc4Soa51MyjGIrsm8YrWi34Btr1pBr8sQQ06t2d8sin3Un6DNtZbLjFLHxBoGOL3X6DG8mZH0diITHdo)

\-Okay, here’s where it starts to get a little tricky. Unlike clothes, most head meshes only have one bone. Head. You can take the easy route, by going into edit mode, highlight all the vertices, assign them the vertex group Head. Do that and you’re done with the Mesh section of this tutorial. You can use this mesh in the game, and it will stay on your character’s head like a helmet. If your hair has any ornaments such as hairpin or ribbons, you can just do this submesh straight away.

![](https://lh7-us.googleusercontent.com/VHjAZsEyg3F9jANWC0pOL0WQymSHMJrOMZZ6DQ4odapLefFfhmR\_vBjzSWsBb5rTSABMFj8q99StXSEcyiLQGPW4HkntooIloG-E1pQBUib126EWMIQ6jpEVmJKdVpKPDoc24L4cOhwzwPIbV9ojEdk)\


## The Physics

{% hint style="info" %}
For more detes about physics, check [dangle-bones](../../3d-modelling/dangle-bones/ "mention") or [moving-a-dangle-chain.md](../../3d-modelling/dangle-bones/moving-a-dangle-chain.md "mention"). This is not necessary for the scope of this guide!
{% endhint %}

\-Remember when I said “like a helmet”? That also means your hair will not have any physics. Some short hair won’t have physics to wave around to begin with, but if you want your bangs and ponytails to wave when you open the character editor, get ready for some trial and error.

![](https://lh7-us.googleusercontent.com/\_7-443kbkdIYG\_1BZX0og\_7x-32DXiAJtyPcLcrkYAt9Vzx8mKOWw5VzvnAMChVY5yMJ-OdMPxefhv9DbIxYikfNYhKd6wPa2WaM-TaDavmIiQwfJ3dRHyyjqu3RV5JSa7Woq9QOEUEiXsdqDM8MQ6E)

\-First of all, understand which part of your hair you want to have physics first, and separate them into a submesh. Repeat the previous step on the submeshes that you don’t want to move. In this case, only the bangs have any space for physics, so I separated it into a submesh.

![](https://lh7-us.googleusercontent.com/D4X5fA3Cqo8gA62Mbdgo8RxNQfj8O8hlUjLcXwBYJNSH4Ncq\_fq9YdKAIFyhl2ccangVJfjy\_uv1UZeCYYO9d-nfZ37sUw41AODfguuCYeQdHxT2CbBOEU8B0uCiqqhUMvzglPkjn8E6KQD1xNM1Lik)

Search for a vanilla hairstyle from the game that resembles your physics part the most, and export them with Wolvenkit.&#x20;

{% hint style="info" %}
You can find overviews of all existing hair styles under [hair.md](../../references-lists-and-overviews/cheat-sheet-head/hair.md "mention")
{% endhint %}

What you want to look for is how much the vanilla hairstyle overlaps with your mod hairstyle. The closer their shape resembles, the better. In this case, I find hairstyle 05 to be the most suitable, so I export that mesh, as well as their rig and animgraph.

![](https://lh7-us.googleusercontent.com/d8utrGKyBwy64gsA1o78gG\_xGLqXZMAcaB8hsmMpTu0YnuerbPWzK6g51wy6DgvWHyTl\_cVOzkuuLXqsUHjy1iI3MPKv2lDKLXflsuxIQFdHDzlPLFd7CKSsGhTJlUiq0m\_Lm8sDq6IcvIR78cJigyY)

If you want your hair to have physics, be sure to export the `.animgraph` and `.rig`. They are the physic components for the hair.

\-Import the mesh into the game and transfer the weights from vanilla mesh to your mesh. Watch this [video](https://youtu.be/bR\_Vke\_\_voU?si=UWTVLX6\_eWCfR8Uh) if you don’t know how to transfer weights.

![](https://lh7-us.googleusercontent.com/mf\_7vDENzbO0TZydn4YdOIx3zUZ8GEIbYIlDVlI2eY7fSt1nT8WKW7xg9CRC-onkIK4xlAWSA2qTIMjvPccgnzdNXJGQ82NccwLV2Ial\_Oo-D4OHG5LRSl3J1UOTZqZZIXhduqaTpCNpj0HgqvQwWo4)

\-Parent the hair meshes under the vanilla mesh’s armature, as well as add the armature modifier.

![](https://lh7-us.googleusercontent.com/dfrzjeTG6X-6tnGvo-257aTNIB3A\_QBhKJae8WfhQHhU4\_VE-e8dDtkN2pwCL5Wuege2UNFa3N9JaJsARC-rdZOmwVzPK1WkWbTs6X19NJhobOQJg2lNsy72cijeZBRrjYmcO14NHznQWif587fQGBo)

_While you can put your ornaments and hairstyle together, I recommend keeping them separate. You can import any head item and use its armature instead. This is my personal preference to keep things tidy, to avoid confusion when we handle hair’s material and texture later. It’s best that you keep the hair and ornament in two separate mesh files._&#x20;

\-And we are now done with the Mesh Section, but we can’t export it just yet. We need to make sure that our hair will actually show up as hair in the game, so we shall move on to the next part.

![](https://lh7-us.googleusercontent.com/oZssWeROO7BeHPG9Rz7LHloNLX4h4kK\_rZJShBGyQezxdfVU3J6Auu4A6UKxphzfe5Mr8zWmK6vH3yP56\_iTjtZt2cv-v4vo\_ooRP7jMMr6wXueClE-sP54gznn9fRGF7MVN22JB8Hnev6WByHcPgc0)



## The Texture

If you are porting a hairstyle from another game, it is highly recommended that you just adapt the UV of your hairstyle to fit CP2077’s shared hair texture instead of using the original texture. This will allow your hair to use the game’s hair color system, as well as saving you a lot of hassle when handling the materials.

Excluding beards, caps and private hairs, CP2077 has 5 types of hair textures. Export them from Wkit and add them into Blender so that you can use it as reference for UV editing.

**Curly hair strands** - `base\characters\common\hair\textures\hh_curly01_alpha01_r.xbm`

**Dreadlocks** - `base\characters\common\hair\textures\hh_dread01_alpha01_r.xbm`

**Kinky hair strands** - `base\characters\common\hair\textures\hh_kinky01_alpha01_r.xbm`

**Long straight strands** - `base\characters\common\hair\textures\hh_long01_alpha01_r.xbm`

**Short straight strands** - `base\characters\common\hair\textures\hh_short01_alpha01_r.xbm`

Most hairstyles I see use long straight strands, but don’t be afraid to use other types of hair and experiment with them.&#x20;

Keep in mind that no matter what type you choose, you will always need three accompanying texture files for the hair texture to work properly. These files are `gradient`, `id` and `flow`. You can find them by replacing `alpha` in the file name with any of the terms above.

\-Open UV Editing and edit the UV to fit the white parts of the alpha texture. The black parts of the alpha map are where the mesh will be transparent, thus creating the image of strands of hair. Keep in mind that the hair root is pointing upwards, while the hair tip is pointing downwards. The direction is important for gradient handling. Scale and rotate the UV to fit the alpha.

![](https://lh7-us.googleusercontent.com/sMGwNj0bVINtWOIUmThTeEV2wptuKX8DkygMnEe0wTskuBla2a37jonKhsUJc24aF19kVVwOL3D15zge9knyme31RvkDWh4MWSaXRpp-pn77FFa2jlrlWp1oCAyz610Z5MIglB6d-QC0JZJBvl2qktY)

![](https://lh7-us.googleusercontent.com/hggdgqoO\_MnS91zYsrvdYxfUqErapBSaYjrxIqCB3oeSAwIm4JKpEs5IpOTFFq4H1hdAy9EVEj\_hEuGW2Zjz7QMLbAa4A61wh3o2JjFaWzurFvMkwkC34UdEurFnSN-ebhTV2l8WXPcFwGZjWtg2f3s)

This is how your UV should ideally look like. Everything is where the alpha will work.&#x20;

![](https://lh7-us.googleusercontent.com/mCiabspnfeyj-RuZMMWQfDHQPdY16m1Q3d0DvA7D9oQQwFItpW0RDml7Hma7iuBaZLvY5aK5d-8uYfYSjqRBeF0S5dwvKGbswI\_JMClEvoUbifbRR2HicRaPgFB5bmGY3VeF74xvVyGke\_gOXPQ1heE)

You can preview how your hair will look in Blender by creating a material and importing all the textures mentioned above.

\-Create a material and assign it on your mesh before opening the Shading tab.

\-Connect alpha texture to Alpha slot of Principled BDSF.

\-Create a mix node, set to color and multiply. Connect id texture to slot A and gradient texture to slot B, and connect the output of the multiply node to a Gamma node and set the value to 2.4. Connect the output of the Gamma node to Base Color of Principled BDSF.

\-Connect flow texture to Rebuild Normal Z to Normal Map to Tangent of Principled BDSF.

\-Turn on Viewport Shading.

This is what your mesh should look like. The black and white represents how hair color gradients will show itself on your hairstyle. Black is the root color., white is the tip color.

![](https://lh7-us.googleusercontent.com/UKY62V9EKjuFtVwHtB-mAaQWM5GZnXsiq7rybKQ\_laoHieuGspFhlBJGfA65hgb9W3gNAXyGdQgOa9Au3ydcL2jftMuTVUEdt6a4jPH9XrvJsn88ZzYhIvbvv2uMKdWB2\_iFVfRz6eTf\_AkACp5Jylw)![](https://lh7-us.googleusercontent.com/LK9Wl4VrmZtVpIhHxgcrSG-O-eIrp\_yBkrno5rTJbhYaJnAuRs98lKwzaISjmeZUnYZ8BRtqegn0oSeBBpN78mHUoo7JywvXgc-gcA9pli1H1tsS2sFn4Wr8UVRdgY6zi-rCWkhj6bawxYHlYgOVNlQ)

\-Now you can export your mesh.



## Wolvenkit

Create a project and copy the framework file from UUH4V Framework. I want to replace FemV hairstyle 33, so I chose file 33 for FemV.

![](https://lh7-us.googleusercontent.com/hdoSmhg\_dHOohBzJl6qMgZ92vx24XS4uUAGgit-nuFAbJnvTdBoUBXCnc3ZJGHOBmkAatdYXd6N86ec0uBRXMX\_gkBRePwecbqOj\_wSSRor9idd8-oSkGuqHfbHY2YGxRod1g1\_mQhBWENj4l\_8Fe4Q)

Remember this? Copy and replace one of the sets of three files. For example, you need to rename your imported mesh to `fhair33_pt1.mesh`. If that’s the case, you need to rename the `.animgraph` and `.rig` to `fhair33_pt1.animgraph` and `fhair33_pt1.rig`. Move them into the uuh4v\_framework folder and replace the original file.. Having the wrong names will cause your mesh to morph weirdly.

![](https://lh7-us.googleusercontent.com/d8utrGKyBwy64gsA1o78gG\_xGLqXZMAcaB8hsmMpTu0YnuerbPWzK6g51wy6DgvWHyTl\_cVOzkuuLXqsUHjy1iI3MPKv2lDKLXflsuxIQFdHDzlPLFd7CKSsGhTJlUiq0m\_Lm8sDq6IcvIR78cJigyY)

\-Open your mesh to check the materials. You want the materials to actually be what you want. Unless you have multiple submeshes, only the first entry in the material matters.

![](https://lh7-us.googleusercontent.com/fCSkikBccKAvMKl0cJ7DpaRZX\_RuqlQ3kNe0tGYK3YzbItiqzEp-SS10wsZhjxIq0HP1PLun6WK2JKFns\_osYq45ic3az4tH-3lv1jEeZpXCoV-Ip4DIjlrpG\_\_QdEwrtHYoxUga21UpTAi-1sk9Edk)

I want to use `cards`, not `cards_top`. I can manually change every instance of `cards_top` in the appearance, or find another mesh that uses cards in the first entry and copy the materials over instead. Since I joined my meshes into one mesh, only the first material entry matters for every appearance. This is the easy way to do it, because there are 35 appearances for 35 hair colors that you need to check over and edit. Copying the materials from another working hairstyle is the simplest way to do it.

![](https://lh7-us.googleusercontent.com/qXzOTtKH7qpYCinGF3H1kOcrap5RVRqPemkrtZtsKwNjJCnkDWnWTivRpC\_tWCA6sLOhJt2vItK6rjcxEYTBw\_ogsfNDogZHYTm0jrj8WXlM1vK49UnhYuRomk5zUtrH9mWc5BfpoDZkaUyaG7Dwl7M)

Now you can install the mod and see how it looks in the game!

![](broken-reference)

_Oof. The color looks about right, but…_

If you’re wondering why the hair is warping weirdly like that, it’s because of the physics. It is important to understand that the method taught in this tutorial is the easiest and fastest method, but also the most unreliable. Advanced modders can weight paint and edit rigs by themselves instead of relying on vanilla hair weights, but I know neither of those so I can’t teach you how. If you can’t get your hair physics to look right, it’s perfectly fine to leave it static instead. A good looking hairstyle is better than a glitchy wavy mess like this.

![](https://lh7-us.googleusercontent.com/095pvtVHngs\_cIVacrvSG5x-znzss7i0VYUkrMjlpw8xd6uE-gr\_gXxvA9i3fUOvhYpeisBVXztUD1ltWWcra3nCVu5nWL0-eeR9X5ZDnEz-HJPVsvW-YwjHMkdF7EhBafTxWkS1-9IbbnQN9uV3jJ0)

_Static hair mesh, but no weird morphing._

Oh right, we got a hat, don’t we?

The hat’s texture is the same as any other item in the game. You can use MultilayerSetup files or metal\_base.remt, it’s all up to you. Check [here](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators/materials/configuring-materials) if you don’t know how to do that.



\-Replace another mesh other than what you have for your hairstyle, and install the mod.

![](https://lh7-us.googleusercontent.com/BfsyEaDDuNuoVFmCXfq\_iGeZ8xh1AanfME-Zt-htODX0qvQlNTks8Ol8bTiXOYJFczk2j84hRonR2cSQ5yTtShJOYBW4rrS8AWmHpJFnxbjDcWKDAgq5CA5I8mGeLzDdTtA9m2LuVkpngEq7QR7fgj8)

_**Tadaa! A simple hairstyle replacement with a fancy hat.**_

![](https://lh7-us.googleusercontent.com/FPdKWkuzNM7U2I-gGx548LP1aFy2NoG-bPPR7SOsmwKGoS-HaHbDgeGBXXpb6NHLohfuJ8WKTTeuqJttPFG1Bej468QxUZ1GbeY5Rul8fMFYB44bhz0pSHKmLrXBj7FPPTqw4\_GfdVTjuhXm4PvWlFQ)

\
