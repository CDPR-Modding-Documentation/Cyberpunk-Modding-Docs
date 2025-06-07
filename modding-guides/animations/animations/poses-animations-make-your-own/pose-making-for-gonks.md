---
description: A simplified and Up-to-date tutorial on the pose making workflow. 🕺
---

# Pose Making for Gonks

## <mark style="color:blue;">▶</mark> <mark style="color:yellow;">Summary</mark> <a href="#summary" id="summary"></a>

> **Created & Published**: May 30th by [PinkyJulien](https://app.gitbook.com/u/iKTJipgsEBTEnUVSuliSjOUuiJq2 "mention") ([original link](https://docs.google.com/document/d/1VxkMHDBQLXppeRO5pj3T1SrTtepiJjx6Kfs0eURcJo4/edit?tab=t.0#heading=h.kvak42tu0v94))

After being asked about poses multiple times on Nexus and seeing a couple of folks struggle with it on Tumblr, I’ve decided to write a “gonkified” tutorial sharing my own pose-making workflow. 🤠

I assume you’re already familiar with WolvenKit, Blender, and how to make a mod for Cyberpunk in general - if not, [hit the modding wiki!](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/getting-started-making-mods)&#x20;

### <mark style="color:blue;">▶</mark> <mark style="color:yellow;">Requirements</mark> <a href="#requirements" id="requirements"></a>

* a recent version of [WolvenKit](https://wiki.redmodding.org/wolvenkit/readme) <mark style="color:yellow;">| used in tuto: 8.16.1</mark>
* a recent version of the [CP77 Blender Plugin](https://github.com/WolvenKit/Cyberpunk-Blender-add-on) <mark style="color:yellow;">| used in tuto: 1.6.4</mark>
* Blender 4.4 or above <mark style="color:yellow;">| used in tuto: 4.4.3</mark>
* [xBaeBsae’s Pose Templates](https://xbaebsae.jimdofree.com/cyberpunk-2077-guides/cp2077-custom-poses-and-animations/) | [direct folder](https://drive.google.com/file/d/1kL04dQy9xmK_yRsvsS4Sn83joPzrljAr/view)

***

## <mark style="color:blue;">◼</mark> <mark style="color:yellow;">Making our poses</mark>

For this tutorial, I’ll be making a **synced duo pose** for Masc V (= MA rig).

{% hint style="info" %}
**“Synced” poses are poses that are meant to be used together!** \
They come in two, three, fourth or more; there is no limit to how many characters you can snap together by using synced poses. ;)
{% endhint %}

To make synced poses,  you’ll need to [append](https://www.youtube.com/watch?v=48-1EuEc4D4) multiple pose templates into the same project. \
And to append multiple pose templates into the same project, it’s easier to first pack the template into a collection!

* Open xBaebsae’s template in blender
* Right click on the hierarchy window and choose “New Collection”

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXck6FsMAPLHziGgpnCf2RlUnf7MVNDdaktaqXh9jmNzg7cb0o3JEYh7z_45QWeSZnR8y1BWI7xqWhfj9ZhtvDnd68oGYrUOEfbyjjoZAqdNyP0ty55lk4V2Q6KsE6o--7jhE5CgIA?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption></figcaption></figure>

* Drag and drop the two armatures into your new collection
* Make sure to also drag the mesh that will be left behind!

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfqGKEr0mMps7754briCG7C2Mju8MEg3-inVvxs_sB5q6u1-CxuoTfVhTV3fgfb4lOjmesO8cVrQXzIPu9X7wa9FMgIov1kJ8FIGtulUaOdBnRm1JzT0jI9AtR_VYVE4BJoPVf5sw?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption></figcaption></figure>

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXciXoiHteKEwSoSLhSSQ9iaYaZ7Rinv1l285_hbDyGvpdt-5Z-p-IXfQCmceR7UZT3CRJXUCTWo9Ucxj8fXtpoH_rZgXjp_Zf6AQUqk2C2_zUZt1hX5vF_5-ekgFLKhRc1xD-zrBA?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption></figcaption></figure>

* Save the template .blend file and close it

You can now append your template’s collection into your pose making blender project! \
I recommend always working in a new blender file instead of working on the template directly; it avoids accidentally messing up the template or saving and overwriting the file.

Since I’m planning on making a duo pose for masc, I’ll append the same template twice. \
I’ve renamed them and given them distinctive colors for clarity! Yellow here is **MA\_A** and Blue is **MA\_B**.

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcrT7F2Y_OxqzOqF5Zu0E15rL5R04nPxrP7sX9IO01PVAinB7PMsyBBM_AQ0q6DnZcZu5CjbYfmpy9ybcadcPk9lDv_ryVbfaPgmzD4XDCZXcJWM98gGnVIrT9SaUbkE1xV7SLf?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption><p>MA_B moved to the side to showcase the two templates correctly</p></figcaption></figure>

For the sake of this tutorial, I’ll be using one of my previous poses.

{% hint style="warning" %}
**For synced poses to correctly snap in game, all actors need to have their root bone in the center of the scene (0.0.0)!** \
When posing your characters in blender, make sure to leave the Root bone unselected; this is really important, perhaps the most important part of making synced poses. The Root bone determines where the character will spawn in game; keeping the Root bone in the center of the scene will assure that the character will spawn in front of the player.
{% endhint %}

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXe1TEO7BLRRMLXZ5pKSZnV7ZqZN8LuYiLGQ613q2tRyuRECGM92GIr4JfdpGVWqgNXzKigVsJ-FN7wI8Z7dG3ZCU__MX1qAjLC2ZZcZVl-p19wMggtnlqRKDfPwEGVwDk8zCaMOqw?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption><p>Actor MA_B is far away from MA_A but his Root bone is still at 0.0.0</p></figcaption></figure>

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdLB4_vdv8I-L1Rk0pKnY3k3iQjfD3k7cdcAPgp0d5rPOpQbvQ6UE0-MOZUtXe8CDUc_uYS4S_I8CVQy83M0MyJysXOi7sHU-WUbIBU_HZACbd-zc376iFB69jcoJSPJ9u47FgjmQ?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption><p>Both actors having their Root bones at 0.0.0</p></figcaption></figure>

{% hint style="info" %}
Keeping the Root bone at the center of the scene will assure that your poses will look the exact same way in game.
{% endhint %}

Once you’re satisfied with your poses, we can bake them!  I’ll start with **MA\_A**

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdHdDKtpKjbMWKrc2hzecdR5dCoGksXjWETfRq4ptxQKfO04h5RxSzstN3zoJD1Ew1dTG7Kj8pXMibUW11SM1NgGu9B44rw1HMyR4PptvpNDmteKxvklM92H-h4t62xW7fy3qqMYA?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption><p>Final poses for MA_A and MA_B</p></figcaption></figure>

Make sure to have a couple of frames on your timeline, even for static poses.\
&#xNAN;_(I usually go overkill and put up to 5 frames, it never caused issues in the past but 2 frames should also do the job!)_

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXf07pHbSIMTGiiQ-6Otr7EvuPlfHQp7YCEHLSgoJe-CdCvlLYP8nPXLkdXo33d9klo4PPbrK0FIfREJXCE6QEVRkGny2kg5TfW0YMnfrWtEsk4BVc-T6pfZ-lcApwnMwAWc4AouIA?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption><p>5 static frames on the timeline</p></figcaption></figure>

Change your **Timeline** to the **Nonlinear Animation** tab

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfW-IcLb3-D7fXhUYbglNBk9bFStTSwtj2I1kBkcl8498yuLIq0a8V9_g6JIcIqUxjRtxexLcb9YbpFC7BLoq9o-3y-vO7hPKREfEC82UXdmTiisF2dzJk2DHzQWr2Z8vU-2XiO?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption><p>Change from Timeline to Nonlinear Animation tab</p></figcaption></figure>

Here, you can double click and rename both animation stripes - this will be the name showing up in AMM’s pose list! I try to make my pose names as descriptive as possible so it’s easier to use in game. _(This is only my way of doing it, and not THE way people should do it.)_

First, I first put an indicator of the pack it’s from - “hv” for High Voltage.\
Then I put the type of poses - both actors are standing, so “stand”.\
I add more descriptive words - it’s a kiss on the cheek!&#x20;

And since these are synced poses, I put an indicator to differentiate each actor; A for the actor doing the action, and B for the actor receiving the action.

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXeMjl4l0g5GY0IuKeHNkNE9OBpO1u35VL38oro2o2JDYlQ0-Ln5bi8uFg8LK5btffcqBERgmEkfeKq50OucPYb6XYnAtZvZ-Pil7R74UvYQIcuGUAafe9RsOsDDK9S-oAhb0A9Z?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption><p>Rename your animations before baking!</p></figcaption></figure>

You can then click the button right next to the names to bake the animations into anim stripes!

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdWbJAmysS0VUf0v3F4Zk5SOfA3wPZtTKDUB59hw2kB_1YuTOXM-bvF-WNJb0soIdYRew9tBNMNsMv_Cv5mO5NdJxtmfOVXYXGCcjQhjTW3gJDkrPWWzqefk8k2yQY43Rp9ez9yZA?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption><p>Baked animations ready for export</p></figcaption></figure>

Before exporting our anims, we’ll need to clean the list of animations in the CP77 Plugin to keep only the animations we want to export.

{% hint style="warning" %}
**Only export animations for one specific RIG at a time!**\
If your synced poses contain different rigs, for example MA and WA, you’ll need to export your animations in two times and in two different anim container - One export containing only the MA animations into a MA container and a second export containing only the WA animations in a WA container.
{% endhint %}

You can save as many Blender projects as necessary for your comfort - For example, delete all the WA animations from the list, save your blender project as “MA export”, CTRL+Z to undo the suppression, then delete all of the MA animations and save as “WA export”.

In my case, since I’m working with the Man Average “MA” RIG for both poses, I can safely keep both animations in the list and export them in the same anim container.

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXduQCeNvci7eKBPfVNBUDJx5bDVSe2ji_PwiVQYERlXy2tezHKVXTsSvhllgusWSuNLxT10rBR6BRkao4Zo8bBoX9MqoNVXWN3mCphbY6KJBv-OCcBT6S4wmVPzujlfknLfaJMPBA?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption><p>Animation tab of the CP77 blender plugin</p></figcaption></figure>

## &#x20;<mark style="color:blue;">◼</mark> <mark style="color:yellow;">Exporting our Poses</mark>

Before exporting, we also need to get ourself a file to export our anims into!\
Any .anims file will do - just make sure to get one that fits your rig.

In my case, I’ll grab an .anims that is for Male - “MA”\
&#xNAN;_(You can check which RIG is used by opening it and reading the path of the listed rig)_

Clean up the anims file by right clicking on each arrays/list and choosing “Clear Array/Buffer”. \
You can also remove all of the fallbackAnim arrays! _(afaik WolvenKit should do it automatically, but just to be sure)_

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcVMsyXDg5eyfWlXRMSGmfFemqcBSno5xFfl7QPtHQnoOIfnisSsZQ97h3-DDf6TQMhFgXupYxpAJbvfZLPnt_SQTNMFakczK0DvqbHY85ZyBRW9QsgGdKz6YsB-Sn-AFf7xXlfZg?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption><p>Emptied animation container</p></figcaption></figure>

You can now export the empty .anims container and open its location.

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcg8A1E6idS-b3Bu0WxiydUbvGl_8mI16bAak4rTRzlmX2s1el8wfnTl_DNP8qN0ZFe3Kgdonz9HJkJiDlFDPrxblrWg07mFHnzDizNDep7z8WqxGJuZVRpsjnKh5CzZSvXjrIw?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption><p>Empty anim container exported as glb</p></figcaption></figure>

Back in blender, you can now select one of your Armature and export your animations by using the CP77 GLB export option into our empty, exported container.&#x20;

{% hint style="info" %}
It doesn’t matter which armature you select; all anims present in the CP77 animset list will export into the same container! Again, if you have poses for different rigs, do two exports.
{% endhint %}

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfNh_7Fl_7RchTj2R04lPyMShqtFaXl_bsH6sBZDuZtMhkOzsbplAyIw3CO4d4boAXaiR7L920-m565Q4q1EDZfoPN8NpER6pvBdMO3b2Cs-LgQy4r3I38WiKFhXAszsJc_Bw42?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption><p>Make sure to check "Animations" before hitting Export!</p></figcaption></figure>

In wolvenkit, import your GLB back into the anims file.\
You should be able to see your anims names pop up in the Log!

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcTVVD5a7A2Es5iZt5mM9Z39gGQRAch9luBkltozAunTIHFBXEkVoDEbAZInjB-BuxrO7cJbr5sGrkbAPsoXl3_sEll5eTqQ1E-HXDaZ7FqyD1Ppk_lWXiB-ri5IeE8m_LjF0S9CQ?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption><p>Successful import log :D yeay!</p></figcaption></figure>

There’s a few adjustments we need to do in our anims file before it’s ready to use!

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfzkneTSFqkTgfCvNAaWGniScLcfh3vcfVPWtTlSkWdj8-ElQpjw-JTGRnvRkOeHV6y01Zh6DaYkKojPdCNUEP9LGQRfEAGjsNFjBA8A-sxhZV3vPJO468eBxFRSKpgNDPqgHZdcA?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption><p>Your poses in the anims container 👍</p></figcaption></figure>

Open up your Animations array and scroll down to the “numTracks” value.\
There should be a number here; remove it and replace it by 0.\
This will stop the pose from vibrating, even when frozen!&#x20;

_(Kisses to_ [_**Halkuonn**_ ](https://next.nexusmods.com/profile/halkuonn)_for sharing this tip with me 💛)_

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXeyoJM8UOwFKkILDx4h-EO_4y-lgyIEltDeCit9ldtKBvp18TQe-kyDqG7zU-pVxvCfLokC8VO-LU70Zi6JKuFArxIjiMirLkUnAdR-BTiG3ul1ZrXrjxRU1i2C9a43snDVRYJNfg?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption><p>Nuke the numTracks value to stop poses from vibrating</p></figcaption></figure>

We also need to remove any potential **events**.\
They can contain noises, FXs, or more annoyingly; an IK snap.

{% hint style="danger" %}
IK Snap causes poses to get stuck on the ground, making it really hard to use them with AMM!
{% endhint %}

Right click on the **Events** array and choose “**Reset Object**”.

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXeTQbwuWCyM5Kr_h16xZ_o02ciZ3hvVvhFGCSYkkjro76onLsEKT4rR04oUs-8Ukz5d6JakAc8WQYrMBmbEviuqg8-cTVFhRcRpjjxaKGWWCa8BDVa9pna30JlW5qxbY_DNSSAk?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption><p>Remove all the events from your poses</p></figcaption></figure>

And voilà! \
Your poses are now ready to use in game.

You can now either make them available for AMM, PM or both!&#x20;

* [AMM: Collab anims/poses](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/animations/animations/amm-collab-anims-poses)
* [ArchiveXL: adding Photo Mode poses](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/animations/animations/archivexl-adding-photo-mode-poses)



***

## <mark style="color:blue;">◼</mark> <mark style="color:yellow;">Manually fixing the T-pose bug</mark>

The T-pose bug is caused by pose makers using the same Workspot file.\
This is easily fixable by simply changing the finalAnim set hash number!

Open your workspot file, then:

* Open the workspotTree array
* Open the finalAnimsets array
* Open each rig entries to have access to their hash numbers

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfX1kzQGl8LnzV8gxphDDXmVboqrhizaG8WQnvnx4vy4SBn6n5IRYg5nmjitrTDkXB0TOZafa7GW40C3MwA-zuI_xUreHkgQvb-wR45NWWTG4Z0P5v2a4s2TICBmiPGm_lUyIdNmg?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption><p>Hash number in your workspot file</p></figcaption></figure>

Open Wolvenkit’s Tools tab and select Hash Tool.

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfTpKuyB9Xcq3xO5v8xjtZmIivG127URJqrtEa5Lrnj69OOb_LVYaNe-FUNyGZSr5gVkWI00SpH7lOJBi2aro-kK8K0xWSwd2XdVOncb_w74d3RXLJo-JcxovBqX-pUMrDjBQPv?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption><p>Where to find the Hash Tool :)</p></figcaption></figure>

You can now generate a new hash; I recommend typing an “unique” text, your pose pack’s name + the type of RIG for this specific animSet.&#x20;

{% hint style="warning" %}
You’ll need to generate a different hash for each finalAnimsets entries, so for each rigs! for example, nomadposema for MA, nomadposewa for WA, and nomadposemb for MB.
{% endhint %}

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXeB23h3JRHsTp1fwtsgzd8HoShqouMrD71eqQSs3WF3QnbMMSoYvlrypr8g89na0f0RMzSVZKNQQc-Z02-syzviRuVE86J45LF3x1QZ4hwS3KmmtTVYVdcm4bt0IfyGhy_v4UJ3zw?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption></figcaption></figure>

Copy the first string of number (CName) and paste it into your finalAnimsets hash field.

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdCPv7WlsZwnFEK0MVYfoYaCcXzLpcmgLnDqj4ZUbXi5Y2SKnUJ3GT6T-0e7ddDDObnTziJZF2YY2v_-fJY4D27bcSWwOVc5cSC263hQXuACnwUgLSsyiCNCgCG6JuuaNg3loK3sg?key=luxfQwgMLoIEofnwCMBmNQ" alt=""><figcaption></figcaption></figure>

Your poses won’t conflict with any other packs and won’t T-pose anymore!
