---
description: >-
  How to retarget vanilla poses and animations from one rig to another and how
  to port external animations by retargeting them to cyberpunk's armatures 🕺
---

# Retargeting Poses/Animations

## <mark style="color:blue;">▶</mark> <mark style="color:yellow;">Summary</mark>

> **Created & Published:** April 2023 by [PinkyJulien](https://app.gitbook.com/u/iKTJipgsEBTEnUVSuliSjOUuiJq2 "mention") ([original link](https://docs.google.com/document/d/1nHPQvkK6ijwb8iQ8y1X8CBG-wnNUCTYCjrdUCGMenW4/edit?tab=t.0))\
> **Last Documented Update**: March 2025 by [PinkyJulien](https://app.gitbook.com/u/iKTJipgsEBTEnUVSuliSjOUuiJq2 "mention")

In this tutorial, I’ll show you how to Retarget an animation\
Retargeting is also useful for Static poses packs to avoid shrinked shoulders when using WA anims on MA characters for example!

### <mark style="color:blue;">⏸</mark> <mark style="color:yellow;">Wait, this is not what I want!</mark>

> To learn about making animations and pose packs, check the [..](../ "mention") category, such as

* [poses-animations-make-your-own](poses-animations-make-your-own/ "mention")
* [amm-collab-anims-poses.md](amm-collab-anims-poses.md "mention")

If you're here looking to retagert your Static Poses Pack, I recommend checking this other [**Retargeting Tutorial**](https://docs.google.com/document/d/1CrPTKiGJzy2Tj_klJVHhRdXZgqD7yC2ZsJuRu9nqQuc/edit) by **Halkuonn**, which uses a different plugin better suited for static poses

### <mark style="color:blue;">▶</mark> <mark style="color:yellow;">Requirements</mark>

* Latest version of [WolvenKit](../../../for-mod-creators-theory/modding-tools/wolvenkit.md)
* Latest version of [Blender](../../../for-mod-creators-theory/3d-modelling/blender-getting-started/) and [Blender CP77 Plugin](../../../for-mod-creators-theory/modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-import-export.md#summary)
* General modding and [pose making](poses-animations-make-your-own/) knowledge

![](../../../.gitbook/assets/pkd_retargeting_animations_1.gif)

***

## <mark style="color:blue;">◼</mark> <mark style="color:yellow;">Retargeting vanilla animations</mark>

### <mark style="color:blue;">1.</mark> <mark style="color:yellow;">Installing the retargeting plugin: Rokoko</mark>

First, you’ll need to grab the [**Rokoko Plugin from their official website**](https://www.rokoko.com/integrations/blender)

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXd5NhLiLcHh2Ql7uL4gtLwJ-Z6w6lpzL-ir4RZG031BdP2aa_H6z02hOy2-edBThOkiOETZPjP7qLE-E2nKtgBD5OuzT19RPYvoqREo9m6BnUX8zZneLoFG_C92jZqcLKVHQaHv?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption><p>Rokoko Blender Plugin Download Button</p></figcaption></figure>

And [install it like any Blender Addon](../../../for-mod-creators-theory/modding-tools/wolvenkit-blender-io-suite/installing-the-wolvenkit-blender-plugin/#step-1-install-the-plugin)

> _`Edit > Preferences > Add-ons`_\
> &#xNAN;_`drop down arrow on the top right > Install from Disk…`_

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXecrcDkKxa5SiEKj6S7ipWS_Yos2ApmuTGTANAEAYb8roc3RqaNOADEcoYFhwQOvUbNlAEJNqzkRFekaG9oCstzPK8rEQDu_ZHg1fcOhyKIhqEBdqiTUMaBmZd083G8v2YlPsihIQ?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption><p>Rokoko Addon in the Add-Ons window</p></figcaption></figure>

Upon first opening the Rokoko plugin, you’ll need to **Create an account**

{% hint style="info" %}
This is completely free and you can sign in via your Google account
{% endhint %}

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcuVbBon1UQ4VCwMUtZiZN0U4na4oGW1N9J5mluGtsqNwaIEEcLM9B1Ez_CmTckKq_xM1FBnsA4X1A2zRT1lE5-v_LjLxyPc-UU3r0YTkgGlhow_hrPdZIhNlOn9zWO9p8Mvq3IRQ?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption><p>Rokoko Plugin Tab - Sign In</p></figcaption></figure>

Once signed in, you can return to blender

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXft5cS4w1hrd4BLbUdral2vkMwSGzHZ5g-Pxhq-PS_kj-VsKVslG0hh4XtfZifdhKEX6fws8L9zsiQeOrD4mxob8y6bAaSZ8WFb3CaHmsZCYqclJvKJTHTxxKomHtcJVw_CV-pV?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

For the sake of this tutorial, we’ll focus on the **Retargeting Menu**\
Close up everything else 👀

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXe4f6OCxDYs1C_D5m09KwvMArLpJ5HcUfxwl3MIag_xNsN20J0iUAuGNs6pk6oieK09LR_1MyioB28kW0PZCNFJxpaiHh3MqfPhrMml87k-SzxTwG17bm-giBNF9wQOjuKZtp5qAw?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption><p>Rokoko Plugin Tab - Retargeting</p></figcaption></figure>

### <mark style="color:blue;">2.</mark> <mark style="color:yellow;">Gathering our files</mark>

Now that everything’s ready for the retargeting, we need to grab our files\
For the first part of this tutorial, we'll retarget a **vanilla animation to another rig**

If you don’t have them already, you'll need to grab [**Angy’s pose templates**](poses-animations-make-your-own/#download-the-template-files)

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXe_pZTuUnet-U1YD8y4Ev8-N3MQy5if_pg_QpbVGsAbdO0jloQNZPwwk5EHMzFU8TAvuEH5v1m2pww5AF3TybpVOLxhPNFR3b2DikIqcbixImN0VKp4Gxwl97utPixFwWmkGuJw?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption><p>xBaebsae's Animations Templates</p></figcaption></figure>

As an example, I’ll be retargeting Alex’s dance for MA\
So I’ll use xBaebsae’s **MaleAverage** template

You’ll also need to grab an animation you wish to retarget from wKit

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdGcdrVS0gZB6Cx2gFnPdKg61IH5Ym48ndJGRrlUEHQYIA78I_lH83-h0Xqoxqzo-o9JSuL7F-dyw1rT1Ya3rQZQSy3WQEzmsxa84M7tx3LGFjGRISIpTcjZyowrKK2xDi2Oot5?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption><p>.anims file example</p></figcaption></figure>

[Export the animation](../../items-equipment/recolours-and-refits/r-and-r-your-own-wolvenkit-project.md#how-to-export-files) and open it in your Blender project

For clarity sake, I renamed the MaleAverage armature to `MA` and Alex's animation to `ALEX`

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcdLqs5D4C3-2A0eNETDyKxpwy9mpANEB5SqMZ67Re2ApQiQxa2qwost5sngGL1i5iR_OErOCKPrWyJTn2HbDL7PCLgPijSwHCobbbig-VYBYBpLdOLk1NJ03OkPAwaFoPBKcAk?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption><p>xBaeBsae MaleAverage Template and Alex's Dance Animation in Blender</p></figcaption></figure>

Before retargeting, we first need to choose which animation we’d like to retarget!\
Cyberpunk's `.anims` files usually have more than one animation in them

To do that, open the [**CP77 Modding tab**](../../../for-mod-creators-theory/modding-tools/wolvenkit-blender-io-suite/#animation-tools)\
Open the **Animation Tools** menu and look into the **Animsets list**

Be sure to select the **Source Armature**, in my case `Alex`\
and click on the **Play Button** ▶ of any animation you want to retarget

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdT2qlEZy2D3ujvn_ylwAZo-XIs2rjYAIZ__xedjAbixbwUvyr74DzNh4YFmk4w6ipzU0wo17kdZcmUDh1hW6E72PT4-XG1RWF6M3-USgXD9SdD6zJxmk-XzSw7BcN_PrsQmdMSFw?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption><p>CP77 Modding Plugin - Animation Tools Tab</p></figcaption></figure>

You should see the **Source Armature** move to the chosen anim

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXd_TOcGE6NjTrh4FftsMqSZVlU4qZWUemzdoHih11C09ZjcOxlBl4rB8MB2g8IWQCDTT4KVZq40WkduguhZtr1HuCGZqQ-4KdsdPA0VdLfV4Eq7ylwFhXLZ3C7WUusHdKzL31nQew?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption><p>GIF - Imported Animation Armature moving</p></figcaption></figure>

Press **space** or the **Pause Button** ⏸ on the timeline to stop the anim\
We can now get into the retargeting process!

### <mark style="color:blue;">3.</mark> <mark style="color:yellow;">Retargeting</mark>

Select your **Target Armature**, in my case `MA`

Open the **Rokoko Plugoin tab**\
and focus on the **Retargeting** menu

Put the **Source Armature** (in my case `Alex`) in the `Source` field\
and your **Target Armature** (in my case `MA`) in the `Target` field

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfNJy2kEPzH9X0fOtdaZDbQ2Q_Lf1DzWpaR7GIwMRilQn2eRlFv53wF2XDCyRYsKkkWB48mTGrVeNdBJWcN4oxG0hhXAJHwlwWVpXTBpdzeW2yRMu83ypzdvBREDeolhNUd5laapw?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

Then press **Build Bone List**

Since we’re retargeting a vanilla animation to another rig, the armatures share the same bones names, making this step really easy - However, <mark style="color:yellow;">**I still recommend reading through the list and verifying that everything does match**</mark>**!** If a bone happens to be listed multiple time, the plugin will let you know

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcBItjw5s54ly_CD38rIpNg04S9imI2hZTuUJiNYWhn8vQ3aiMMHTyLWRYMlYF5YCgPgSGOgOQapfYxf7RHYENHf7YWv1-XLdp8A5Sm1p6wl0ZgO_S05SNxQ2e_O-kHYcBy1Pmjhg?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption><p>Example of a bones naming missmatch when building the bone list</p></figcaption></figure>

In the example above, we can see that the `LeftUpLeg` and `RightUpLeft` bones doesn’t automatically match; to fix that, simply click on the miss-matching bones names and select the correct matching one

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfMlYl1O-jxSVGoRlRYNc9pFP1UO33RfJRNx6_fzJ96vXeDMNa9zAi1IfCUaHVpsliohFRudHaGtU1N9qbqMWuljs99O2a-tMfy3C_luH2uUysNxdotRSP-CR9J60qVau7K84dBfQ?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

I recommend leaving the `Root`, `Trajectory` and `Reference_Joint` bone fields empty **regardless** of the type of animation you’re retargeting, but **especially** if you're porting an external animation

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXevf__cH0kUqcRIurch56XQAyan9UapfoOcHO6C6q5koDzuFsYxHkpJFx9PYIQkORDnJIa687jJ0_9rVsb7RQ4erm-12RSon1GyMLuTEGvSNawVbHbOEIP6Md5Ydw9dBO_XGhDByQ?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption><p>Leave these fields empty!</p></figcaption></figure>

We then need to check `Auto Scale` and make sure to use the `Rest Pose`

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXeWjrxxD7lQS_niXyILdQXqu1EorUaW-7JBgjuWWLUPD3OVYFRaHSoauUSLhXHFBlw_j5bfV8vJ2YJvjotNcHTLLI7o_9wZbhGRg91QaZtNEGzAxUOPoRtlGyWQXoLBSMkF7kwc?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

Once you **verified** the bone list and checked everything, you can press `Retarget Animation`

Your Template model should automatically get into a pose\
Press **space** or the **start button ▶** on the timeline to see the animation!

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXefMBnZ3-Rdq5a4bl5rWIE4BlYb1l8hHrw1ry10vM4x0e9wOUP9NiBjaxJ4SiEr9aiiN1oPuBbJsjSoWemDRMTVz0Gb-eFGMFNLNQysBO5eqNSyKS8eRxfCBTeZshIk1_57rnkBmQ?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
You might see some deformation or bones breaking; that’s ok and should be smoothed in game
{% endhint %}

If the previewed animation isn't complete or you wish to see it loop correctly, you'll need to change the timeline's length by putting the exact number of frames for this specific animation

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXd2GgRL5umEIC0sADa44fBjNzjFUcm4-jsax2cGem_r9d1o8zdOZcNIGbsSfWiuDzXciNVtic2nMpNVwBBkxWbsPOT6RhSzuV9lCYKTz6Hk5OWgOlk-N_e3FmJ38hoQptrp5hidBw?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

If you're happy with the retargeting, you can follow the regular [**Pose Making** worflow](poses-animations-make-your-own/#summary)

Switch to the **Nonlinear Animation** menu

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfUvb3quvq46Dioeg05ykho_crbNghwPUSzn-151HvF1692xUYD5fN3guGUIF_804ubsp599tzOSKTaOAswV9u9jdGv3aJWt6kSHhz-Op3oV3CQ4yvgJCrjUMzqs-MDfrw7EGCqeA?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

Close the **Source Armature** list to only see your **Target Armature**’s animations list

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXf79Rx0SV3l4EKUkc7Nqd-dp48m4KC5m_45p19ELndDxUxLVlZRk1jnOesIPSY17iE31tw-hqwppTUHnC2f2t_-5mQCeScQoAevypvbavhdevBB0X5xZKUdd1v64SrOBITcPJWD4A?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

**Double click** on the name to rename the animation

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcmAzZG9IdkSNrZQaUAO6C1F4Unvtmb1MfjCuEoXVBFSEtX9PfA1dPOw52xPykOTxvxjV0-84jaZavWtMbeR7BiXIFM031_xx_krxeP26wKeUY0ldVVOGkFrC_Jf0ZYGAuZjtpmdw?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

And **bake** your animation by pressing the `push down action` button

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdqwfe7KCJdbBXBnPuE1TVk49LuyU3y0uMhkPUKDufwCXjJoOH_yD4GAsz9yxDz_paZXAhPdpWNrx1DslkUkvbvHcbfSUnlf14wNyyqoHVpY8Mg6W-DNTAPDRYbG3zE_6fvm4WvhQ?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

The animation is now saved into your **Target Armature**!

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfKTtlHb_Mwt1xOCMORurwWgJykluYmcyKpO4wYoFOJX_MUF4Iy9AyE07owMEoxWx769sflZOoh2Oe_zI3rpgyWEXyLw-Q5xRSj6N4yldrwI5-wJlHumsQW21c4iagvEVFm36GVVw?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

### <mark style="color:blue;">4.</mark> <mark style="color:yellow;">Exporting our retargeted animation</mark>

Before exporting our animation, we need to clean up our blender project

Go back to the CP77 Modding plugin's Animsets list\
And **delete ✖** every other animations to keep **only** your retarget

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXc9W_BiInwT_BNjm4mjS7NRwktyeRX0MZEG6E7F_HwFAvJryPm5aCL7ujQuHOeno1Uvt3GMO1rhcjjT8Vj_JVBbCYMwdZNx-9q33TvJlFIPPJavm3t_xMxzeEXaBhNEuJ1x2rcTdw?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

It’s now ready to export back to WolvenKit!

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXf7jZa-4oOKasYAIBuItc82epplXH55hsNOv-jxinGxR_BLPSGl3cn753CFbYHA5C5H13QWfWG4jNdkq6JcyUQh7sAiMHKGnIIkpXCArRyrXtQ3VHw2FHHnp5jTNEeqKTdBhnxY3A?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

We still need a **container file** to export our new animation into

For **Male Average** `MA` poses, I recommend using the following file:\
`generic_male_average__stand__2h_on_sides__02.anims`

It has a single animation, making it easy to clean up into a blank state

Add it to your wKit project and open it

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfhqxYZLvffNQGKnoqVW8SiuPddNOq4qJaWi0hi9wlCs4gCAaCq_xCXeKdoSa2JKX5YvCJDgFpkGO8qMmLZJQzmT0L-pNjL6hKXFnvRFXwpTENap_bQhtfOfRO23EttgORSyDw3gw?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

**Right click** on `animationDataChunks` and select `Delete all items in Array`\
Do the same on `animations`

Verify that the rig matches your **Target Armature** rig

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXd2SeDdAmbLMCWXlv-L-I-ZXa_rx5koc0rV1TVw4zUpHRmAtbN8Iu5Ugi-vJofrET7YSq2wBLq13sIbykEr2S00g0aTgr7kJJy700BzdIwI6dxfyEsevm4AqUa94uioGdaQsMtX?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

Save the file and **export** it using wkit export tool

Go back to Blender\
Select your **Target Armature** and **Export** the file using **Cyberpunk GLB**\
Make sure to check `Animations` and export over the anim file container you just cleaned

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdUixnLQM8m90SULBNiKIAkCVodW18X4YquGfRVLgt0fi_4nVefometUMbF286Qk2J5WfGpKTJLFkzquXSLtGjB-hZ-8JBF0MpSsojmza73F2pv2Ol9wiA1guuELJuDfRROn7Ck4g?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

In **WolvenKit**, make sure the **Target File Format** is set to `Anims` and check `Use existing file`

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXco489pvMnofK9d_nzOBPaKDu0pxtvb_zxedkGP4FDOYfn01rGeFLhfJ3AGuireD_TwJ9quGYV5GTVNN-AakacSYvx95VN_c6-PnePrkr-nZQxTlLWG-9Ldc6tfyh10nJfRpUkkpg?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

If everything went well, you should read in the log;

`[...] total: 1 animations (...1 new…)`

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXd0s6oOp0uFx85MbDO0OXsSjBhSADAZn8eD1O5qXeRhncV2jPmtB6wv5Y1rY7VhH1U8e5T2PkD8ucc50SCQVyIlZubJeOIRYTLmqsGcKfWOR-fpCqhq41sr_75G7cVibIxQPdIJtA?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption><p>Successfull Animation Import Logs</p></figcaption></figure>

Your animation is _almost_ ready to test\
Open the file and navigate into your animation `animBuffer` data

There, find the `numTracks` entry and put it at **0**\
In my own experience, this fix multiple issues like animations flickering and twitching when frozen

{% hint style="info" %}
Thanks to **Halkuonn** for sharing this fix!
{% endhint %}

<figure><img src="../../../.gitbook/assets/image (616).png" alt=""><figcaption></figcaption></figure>

Your animation is now ready to test!\
Plop it in game by either making a quick replacer or an [AMM Poses Pack](amm-collab-anims-poses.md#summary)

{% hint style="warning" %}
As of March 2025, Photomode isn't compatible with animated poses
{% endhint %}

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfQJ_fcfT1s62BQ6tw-ymlmmWCFSDx6mt4p7iB9xKKUamRtLeS24YS8hVdyBk9WfDTMiI2G7ajaRmR7UlG5GmzcSL-eYWt6HjS7BpIYqDRKPg70MXSbMFgqEGCIx1dHEnZOrvTckQ?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
Turns out the forearm/elbow twitch is noticeable in game, you can go back into blender to try and fix it!
{% endhint %}

***

## <mark style="color:blue;">◼</mark> <mark style="color:yellow;">Retargeting external animation</mark>

Retarget animations form other games requires a bit more work and preparation

{% hint style="info" %}
Be sure to follow the first part of this tutorial "Retargeting Vanilla Anims" if it's your first time retargeting!
{% endhint %}

For this example, I’ll be using one of Fortnite animation

First, we'll need to change our template's armature **Rest Position**

For a proper retarget, both source and target armatures should have similar **Rest Poses**\
This is **really important** if you want the animation to look somewhat identical to its original source and avoid weird deformations!

Select your imported **Source Armature** and change it’s pose to **Rest Position**

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXeMtLFqyOsY3cnyAx_HzUAuVfsGnus3rkfHSEB59KjkJKm9IQU2jUlPIOqXR_K3MB_v5yE9SnIpiN0tkq7VFJ6q4MRxcwI-dfEETrI5ZnjxI6KUPqKL57JX_9OWnRsiiUjoRN35Ig?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

Then, select your CP77 **Target Armature** and make sure it's currently set to **Pose Position**

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXft1wJUz7xLSnUW47fciB5c-KQ-RMAB6gerA0wqlYftxzozruznf-fdteCoj3BV2ESELgvHmkat60DNYiLLFkpdU2azuwoOztS8pvxxHmRpQNZ7RVNMF_hqOTrR4TSRUlfGpOeeIw?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

With your **Target Armature** still selected, switch to **Pose Mode**\
and change the **Transform Orientations** to `Local` for an easier workflow

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXej1C9NEqe62DRPRUOXd_DgjRS6cdKpVPUTExFZ8qalYz0hYtjuIJoYStCfv26hHgeq8Ch18nWcJfVlJiA8n8nM1AWvVFeG5w65b1AZMftnfmyhJq9M3I3vkuyE8NBNeebHEoXh?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

Our goal here is to move our CP77 **Target Armature** to best match the **Source Armature** pose

The poses _doesn’t need_ to perfectly match and be layed on top of one another\
\&#xNAN;_(they shouldn't, especially if the models don’t have the same heights)_

Just make sure that the bones are angled and rotated in a **similar** way

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfTHnXpoefMhL3xPPEKuZ-hb43-zYdr7LisEzMokcti0rS18qe416G_5YzcbopBa6skKFjHFwSuQVt9i-LCdMu7h-Ci2Wou7dT3OFVeGX2S7mDzmeVYBYpCOsbqb9hrFeW6_0xh5Q?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

I’m making it rough for this tutorial, but the closer you’ll match the **Source pose**, the better the retarget will be! Be precise if you wish to 👌

Once your pose is done, select your whole armature `(CTRL+A)`\
Then go into

`Pose > Apply > Apply Pose as Rest Pose`

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXeenPYj3OT7pcy8utnxymR1HbDVH1zE_fXVMyhEjzCIsbHDX4D5Vj02BqdlD8Rk_IjFS8xzJEPNnXWD1K7Q6IkyMrU-3ZLb_TgwvaPkEe_rgAzSJTSD6k44puuYYwv4UUdBfPbE?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

The CP77 **Target Armature**’s **Rest Pose** should now match your **Source Armature**'s **Rest Pose**

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXeC7EU6hc5pAktjmuLk8b-8uIKT5nLgf2ICcS-pG6TxlSD6EyPfwwZouS2uP_TDpGfAZHH7pPTwLmxwfJ3CHBew8hKhF_MJCflAroYPa5WDSkUhtBchRK--O5PR7l2Rh12m_wDVfw?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

You can now follow the same Retargeting steps as before!

Make sure to also pay extra attention to the **Bone List**\
Since the armatures are different, you will need to manual input bones names

If the heights of the models differ a lot, check which bones match each area of the body

For example, the Fortnite armature has 5 Spine Bones, while the CP77 Armature only has 4\
But the area doesn't match; I can’t simply input `Spine1` into `spine_01`

By comparing each skeletons and bones placement, I've noticed `Spine1` fits the `spine_03` placement

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcs6XLcXZd975WP78sLQoR6FmiZyatyCmdx4Mu-JG7VUmQL5wMZG9a3JUI5548Nj4dclwB92KzULTESAbvhcYO1bOIE3o2FZHUpe1prPNpKIWM549AKiQSA3UqemXbzbMkewt9UTA?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

Once that’s done, hit the **Retarget Animation** button and enjoy your shitpost ✨

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcWK8Y-EsE7rn8Mia98PEHWg62GK80H8gOXG4RPq8euP_RVAfY8KXWdvK9QlsAoxqgHjXpW1ldHcs3g-Bmq6_RRqfgigGaMTYMxBumf8tfojCS0elQwFiplRr-lM81EVg7f_wo6?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

***

## <mark style="color:blue;">◼</mark> <mark style="color:yellow;">Fix misaligned limbs and bones</mark>

When retargeting an external animation, you might notice misaligned limbs

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXemWJgWAyZbBaJu_tsVXOIkLgzPvpudCd_K6x-Z7GMtqIqUnMCF95aUrZQR2IxnHLJR03arMwwKOr1aOg7tBOMiydmidJ5wHFRMZ8yTYuAT6dQ4Qoe2X4qSv66eKJr2HYBqvItFLw?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption><p>The hands are supposed to form an heart here - obviously Not the case after the retarget</p></figcaption></figure>

This can be frustrating, but thankfully we can easily fix this!\
No need to re-do the entire animation keys by keys, bones by bones ✋

Head over the **Graph Editor** tab

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfU-EmVg7dIbmXLHIwlrZUWAKV7t7Sj4lnR858Ngjn1zBT7s6jtlhcfSTuMDToR3JehP6qBsYpSFTLMeEoC83fQC6AjUzm5sqHikug7y8npv2aTvk1MtvrZhwrX8cgsOjghDFcs?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

In **pose mode**, select the bone you’d want to fix

With the **Move Tool** active, move the different “waves” on the graph;\
each waves correspond to this bone’s **quaternion rotations**

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfLnoyzhPh_0jm-4xJlnA_rQseZM2cRrW9yxBbhenjY3dovofn1td5ZweAUA-y9LXVYQEM13IuVUtt8_34_BdsCzCZV-QgFLFndhOXswPvIg2KG0hpJbya0SX5QpYFnlQhPaOud?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

For a better control, I recommend locking all of the waves and only unlocking the one you’re currently fixing/moving - allows you to be more precise

{% hint style="warning" %}
Be careful not to move the selected wave forward or backward in the timeline as this will un-sync the selected bone's keyframes from the rest of the animation!
{% endhint %}

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXeyAXwKoaodt-t9dhj726M--MpWKDmj94QrVMnjGCoaZiWNXDk2oA_wUtLc5wfKu26AJ558Ihp5a4FMk1JLO6FrQKx67fR2AVDaLfSPZl6S3cFJZRTiDxjifKzaflhVee5g0E9iYg?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption></figcaption></figure>

You can select any other bone at any point and go back-and-forth fixing what needs fixing\
There’s no need to “apply” or insert new keyframes for the change to take effect on your animation

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXeGD2wCIjFYwlkJz-Ssn8_f_WmdYqjykNCUsj5ahl70hXF-BZZBNorXXvq3MbJyWu2StpqH2F0RRLmGNkdLEEMkYEonO0cTCOUMfjYN6IapJByDStairuMGM7ApvkVV4cxky23yKQ?key=-34AOAcLx7ftX-VWeAWU2Q" alt=""><figcaption><p>&#x3C;3 &#x3C;3 &#x3C;3</p></figcaption></figure>
