---
description: How to transfer physics from one mesh to another for cross-rigs refits. 🦴
---

# Transferring Dangle Bones

## <mark style="color:blue;">▶</mark> <mark style="color:yellow;">Summary</mark> <a href="#summary" id="summary"></a>

> Created & Published: August 2024 by [PinkyJulien](https://app.gitbook.com/u/iKTJipgsEBTEnUVSuliSjOUuiJq2 "mention") _(_[_Original link_](https://docs.google.com/document/d/1t6dx-3WeOsK3dsz6TwsRUpPJxznp3ShBNaN1PcRoLpE/edit?tab=t.0)_)_&#x20;

This guide won't go over how to port or refit a garment, or how to create and pack a mod.

I assume you're already familiar with WolvenKit, Blender, and how to navigate both softwares; if not, I recommend checking the other guides available in the Modding Wiki!&#x20;

{% hint style="info" %}
Transferring dangle chains from one rig to another won’t be perfect; depending on the rigs, it might create a more-or-less visible offset (stretching and/or floating). In my own experiences, transferring dangles from WA to MA seems to be ok; MA to WA should also be ok.&#x20;

For a precise and proper transfer, refer yourself to Eagul’s tutorial on [moving-a-dangle-chain.md](../../for-mod-creators-theory/3d-modelling/meshes-and-armatures-rigging/dangle-bones/moving-a-dangle-chain.md "mention")
{% endhint %}

### <mark style="color:blue;">▶</mark> <mark style="color:yellow;">Requirements</mark> <a href="#requirements" id="requirements"></a>

* a recent version of [WolvenKit](https://wiki.redmodding.org/wolvenkit/readme)&#x20;
* a recent version of the [CP77 Blender Plugin](https://github.com/WolvenKit/Cyberpunk-Blender-add-on)&#x20;
* Blender 4.4 or above&#x20;

***

## 🟦 <mark style="color:yellow;">Preparing our files in WolvenKit</mark>

I’ll first gather the files that I need as I would for a regular refit.

I search and add Claire’s pants to my project; I also add its animgraph and rig for later, since this particular garment has physics!

I then grab the PMA tight T-bug netrunner suit, this is the garment I use the most for my WA > MA garment refits because of it’s full body rig and good armpits/crotch base weights.

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXd-oLBAuTwqc_8WJ7uc3qlVVw-vI4vKXr3h1JwWt8DD1DYszGQE5RJjK1XwpRRRN_epsfeFi8gsn0ecuH4AdN-wVouGolC0G9yPMHbuxGl30AnSD-BbQqIPCYIc7_OGw_Q4kRJ8rAHHCeTq2mflj91jzqY3?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

I export both meshes to GLB, ready to be imported into Blender.

Before starting on the actual 3D refitting, we need to prepare our PMA mesh container; for now, it doesn’t have any of the necessary bones for Claire’s pants physics to work, and we won’t be able to import it _(wKit will throw an error mentioning the missing bones!)_

Open the garment with physics that you want to transfer; in my case, Claire’s pants, and open the **boneNames** list

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdkb4wOFN75sC66E8o4BRVGGgEJiBOaqUoyRMfZTv_e0vrnA_WGjN2oB2fQMBqoJhMPFiNvlrE9FOaVf9pCkp1ov2zi5rpBMwbi1Z61mYVgjK5z_9idqpRlxPJW9xX88XJZv8fKvyVua6RA3npzbZbbrRSL?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

You’ll need to find the “**DYNG**” bones; these are the physics bones!

Take note of the **entries numbers**, **this is really important**\
For Claire’s pants, the DYNG bones are the entries 38 to 51

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfbKczgMsZwCZsZSVlmAqjQYHzaII8lgaGCeSNf89gC2TyvnZCRCv_pIxHBQjXaNpQ46Inq63Lb-bxTVWTcxpuW-p_fgeOsi5t2PS9sUWpsLP6opQYpBHREOnODv48PQP_u9t-XoAVICIKabdHLV6cqx3hF?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

I’ll now delete everything that ISN'T a dyng bones; simply select the whole list above the first dyng bone entry, right click and pick “delete selection”

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXee49OtcvRcFAGRWipmoF-a8Qq15gaahuCA4zZkWlg3feb5vOwz58O6ynT-ZMsHp0Q1_sAsyVTtQwgMFLWCm5xiZB0Lh85ViW_Y6Po1YB_p1__FzAshhridG42HztsdqYEKKmV3W6p7vaYUXdE1Y2OQuiTN?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

The **boneNames** list now only has the dyng bones!

We need to do the same for the **boneRigMatrices**, **boneVertexEpsilons** and **bonePositions** lists

As we noted before, the dyng bones start at the entry number 38; I will select and delete the selection from entry 1 to 37 in the boneRigMatrices list

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcJUiyWbz4uNKPpcWiZnZRPdjtrhe_OeW9c1gAAJrWOUDZ3vjmtYphAFuN1I_2_9CMaI2pPuY8pouJpSogtOcDoOu86lDvuQddUMuyXYdNBPtD8BZLhev4T3w1ubzjsBIRfy4ENY30mIRTPT-gn8tDza4c?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

Same deal in the **boneVertexEpsilons** list right underneath

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcqV804kPYQRAnBxCC4lDXpxliL3qZZ3wxq4iI9qdZIGim9-l361BBS1Hgrnw2Z15bpQuU1JwOOFogJHN2qK0-D5snKt17F1a5YsMgPNpfWmL1E2kBOYiv_FOJpbk4g6kI5du0Zy2-0E_dGkukw7JTI3cGp?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

A good indication that you did everything right is checking the number of entries between brackets; in my case, everything is at 14, meaning I did not mess up!

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfidgPmUNOqKasBx-Hv9p8aQ6-gmg6jpI7BJnLxyDqnFqKL-5i1keuIlPlqLsR1rwHGUfeQNalQt-X2LOmW7Cp152Kasy4t6SXMAL0GP6N4Nyjpky4734ICNTz9moHWY-A-u8NwnG44z196eJ12s4rCJ8qn?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

One last list we need to edit is hidden deeper in the mesh data

Scroll down and open up the **renderResourceBlob**\
expand the header and finally the **bonePositions** list

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXd2EkeBgHzZoUiTX_OZ6CCCQ99g4RZ5kgprCpXlrTnlOPvE1QtO5N81tZanXmh-Jil8OEa9FJIQ5bC54RsTFBinJbD9oSs56lyR8mOYfgLZjUvDPeQU4-tbmqkjYx2S16XHD0H8lC2_DivuLJspV0iHYnAV?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

Just like the other list, I’ll go ahead and delete the entries 1 to 37, keeping only the entries 38 to 51 = the DYNG bones

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcexvrJ9s1afyhi64gcfezcBdYb1GqiVfnfClNxlkQfiDxUEYEXddMM5tNWmXs67uNt9XZYHKucyjb-YOCQ0BRerRR6xoMRmx1mDJn96Doeue9KsazI8SMRO6HeK__zbNhjC6O8lqqhf1-4C7A6URfh82i5?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

Now that we isolated the DYNG bones, we can now transfer them to our PMA container, in my case the tight netrunner suit!

We simply need to copy the entries from the **boneNames**, **boneRigMatrices**, **boneVertexEpsilons** and **bonePositions** lists from our physic source mesh, Claire’s Pants, and paste them into our target PMA mesh’s corresponding lists

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXd457uj4PvZVH6Y5_yNMqt_-vuOmCbMbyftG1I9slpDOjI4Ecw27bvrqjNHx44iCj6RzV1kGe63QKBPznTfkEhgTi2FCjMzX-OaQo_sU_U1QqOppO-Fw7n0taDNDR62XpBx8wD3oiumK-VMv-753MkKfBMb?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXeZDY4tHlV5IXxdAAjhLzxSQs73y5kkvqiPP7_oUK7nMcwRWIkUd1I2tGCQtthWL_-FwGR4JxT1MEIWP70QBCBFfWwllEtKyFlt_VbYtxG1QM8VQYSUqorIeR8oUcNoC7625BPeApAN3Me-9LsfvKrSOmj2?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdmvsvxYY648h1y7_t-q4j8IhLN5w42McmXqU5JWXQ8hDHtJSkPnys50Cby3ApD_4QNh--j7WDjMcYgGDYzHMB9CZEFxRkMW_LH0TDL8kO1gVOkt26F37rjptabslh4MK3bU1txsGmSMA3XY7FUe9g-z-6_?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

You can (and should) scroll down the list to check if all of the DYNG bones are correctly pasted into your container :3

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXe03EPxHKV_1JBmS7CvKgOeA1u68Bv_jDp4r9VZe1k_11bdjrWm0Ydv9HKr_gCZZc_sKGmcdpertjdbGOu3Cl7I2AKGGokjfXkwJ0H-VgDcBzLq2-aQRD5dCFqAF6_2_ez-fVugrN2P3m6BiSsh4AJavYA?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

Everything’s correct! Do the same for the other lists until and make sure they have the same numbers of entries

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfu0QWNP1soTHpwqLP_nlMJemdKgSKz3nH2JuncSPmrMduHS9Htim-5-G2f_w6hPM8E80XiOu44OXC2zPvjL2tLNmTtEioURBRPVomvbgM2TokagyI3Z7tH0Spk17Zi31UHffKqoaAfrs6NdVsVJt4hZSRN?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

Once that’s done, don’t forget to **save your .mesh!**

## **🟦&#x20;**<mark style="color:yellow;">**Transferring Bones in Blender**</mark>

Now that our mesh container is ready, we need to refit our model and transfer the dyng bones from the WA rig to the MA rig 👉

I’ll skip the refitting part; I’ll also assume you know how to rig transfer a WA mesh to a MA rig (if not, check out my [Rig Transfer tutorial here](rig-swapping-garments-other-body-conversion.md))&#x20;

Before transferring the weights from your PMA source to the rig transferred garment, I recommend locking the dyng bones vertex groups to make sure they won’t lose their assigned weight values when you transfer the weight from your MA source!

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfbcqVf2KDR-Pd_C87K3RJgclm48luC8hhm8JotWxkv98WcHL63l95ZSA8_ARS2qv0JhZKaZgo-87W5meb2KuMXDD-CT2cmeGeMPvnMAVbFxv_KEDGf-pU4fFXNBP4YRRyba-UxlaPm48tJZJCFmGOeItvZ?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

Once the 3D refit is done and the weights are correctly transferred, we need to transfer the dyng bones from the WA armature to the MA armature

Select your source garment -Claire’s pants- armature and enter **Edit Mode**

Expand the Armature list and select all of the dyng bones

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdoe4CaJGffO0-H1Y6avlWLi58JfQPGEdWs8hIEuDFtUQES_OiHRjxsQBaraY2QUmukVox4RouBeG9-VkuneDMwU1lxxiefn5YyK2Y3MIZKpiZLQzsqtnpOkd2eHGyh9hVexIPsHaGO35JtRkvlf7Tuk4Hb?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

Place your cursor in the 3D viewport and press P&#x20;

A pop up window will appear to confirm that you want to separate the selected bones; simply click on it to confirm

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXd1JGlEyeMrPaH2G09qpeUcPI5ZBoIdv2IGFetp3MRsN4sO8LAu9yAqiJ5xFE1uGg8oyDfYWQbA8rJGrafhdUAVr-hftzzwczl_RGsVhepx8Zutw_UtWDjn2eMuT25Pf8vOENNJR5IIYT1hJ-I5trGC2DXW?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

The dyng bones are now isolated in a different armature!

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXcB6cWEzMfLatjQZTImsupLqMA6KnQLYgS8nR_0kq9vGChQBtU7U34aQjG0J6ibadYtqUPPuCBHn1s-8J2OjTMySpi5JwuaVG39HmET9dLUIn-tETF54maCpJ-gLB-JGBTZX1Gmbk2DJt1n1rgeHpxMxyjp?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

You can safely delete the original Claire’s pants

You now have the isolated DYNG bones armature and your Male Rigged garment with your refitted garment

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXfqmJAYNdCrsKSsoonxetaKOEWI-Oo4MP6M_xmKiW1Eh-cqREX-LA0vB3eRNvvQsE3t3QPfODo0eoyGs4Q3i8ww294NlTPj5ItfteWD5-BX_TOncY2r_SbdtBuudbJvBLa4pwpT7HCLQBNlFcJ5IA7gxDIk?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

To merge the two Armatures, simply select the dyng bones armature and **CTRL+click** on the PMA armature (the lightblue selection will receive the darkblue selection(s) when merged)

Then place your cursor on the 3D viewport window and press **CTRL+J** to merge

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdy59RpVYcWwJ5-LSUyQ2A4LXrz9t5ZnSjmvbUjPpJaFEBY-9Lcf5I4lTjr0PW9pCa9a0-5hU0VdYTh6xTYH_Dzg82AkbCvkhP5s04Autws-fGWm1U9T3f3Pvi0EbGWvJ27y6PsG1Xxkp-d6TpYbOkBETo?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdHgzdf1Ftpt1AsSn_0sNb6JQRwK7WB39Knh3VpsdtjS2o4yRDQFZdL6glEGpLQ54wT9ODdujGzT1thkyMk3o2JZc_PYre3Mkyir9hMv0g6WzOIh59pkuriU0V0axntwmAOX8MqC7clCvbKxIho3_gUDZjj?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

And that’s it! Your MA rigged garment now has the proper physic bones

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdvEHYhL2gF85iFFW1si5ReOhXO7epYJGqyDuzvyZC1ulJ1lf-vmEEk4DhKrdAB_Rn2nvkcRxiTj2kIIowT1fbZgRNd6JzIqj5rRSXfKH8SXA4U7rp0cB13cyYCylEDDJF67vLq3etW-0sY_ht6T7-4Dkiy?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>

Save your refit over the MA garment .glb file; it should have the same emplacement and name as the container we previously edited by adding the dyng bones to its data

## 🟦 <mark style="color:yellow;">Test your Refit in game</mark>

Import it with wKit import tool as you would any regular refit; no need to select any rig or any special option; if the bone transfer was done correctly, you shouldn’t run into any errors!

You can now grab your newly imported mesh and test it

Don’t forget to set up the animgraph and rig in an animated component for the physic to work in game! You can copy/paste the components from the original garments files

<figure><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXdDJm5N3sLcxZeV374amk3W88ECWiDxY_o-5dfTiImiIsqkm51LzXO_qDBfwKFuepnN1g4AYZ61hoXszsQOfbnS_rEaCSoVBvRN91uT1qP2jeQsi7MZlubXYdlwzBdDE8mPseWJ_6s7JvO38luojR_-w__h?key=hYoc8I2SJxI3cd4pfkCg5g" alt=""><figcaption></figcaption></figure>
