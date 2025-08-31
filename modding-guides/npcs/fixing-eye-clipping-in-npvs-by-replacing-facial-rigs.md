---
description: The subtle art of stuffing bones into meat
---

# Fixing Eye Clipping in NPVs by Replacing Facial Rigs

**Created:** August 11, 2025 by [saltypigloaf](https://app.gitbook.com/u/yM6HClAkcKNdJsz4fmRLM7qDIKL2 "mention")\
**Last documented update:** August 30, 2025 by [saltypigloaf](https://app.gitbook.com/u/yM6HClAkcKNdJsz4fmRLM7qDIKL2 "mention")

***

### **Overview**

In vanilla _Cyberpunk 2077_, V’s face only ever uses **Rig 000 and it's associated bone structure**, no matter what facial sliders you pick in Character Creation.  This is a **known bug** and it causes serious visual problems.

> ❗ **Why it matters:**
>
> * There are **22 facial rigs** in the game.
> * Each rig corresponds to a set of morph slider values: for example, Rig 000 = “all sliders at 1,” Rig 001 = “all sliders at 2,” etc.
> * These rigs exist so that every facial feature aligns correctly to your custom CC choices.
> * Using the wrong rig leads to _eyeballs clipping through eyelids or cheeks_ when looking sideways in Photo Mode.
> * For V, this can be corrected using mods like [Facial Customisation\[sic\] Rig Fix](https://www.nexusmods.com/cyberpunk2077/mods/7179) & [Facial Customization Fix - ArchiveXL](https://www.nexusmods.com/cyberpunk2077/mods/22849) but does not apply to NPVs.

***

### **Before You Start**

This guide assumes you already know how to:

* Import/export meshes with WolvenKit

> 💡 **If you’ve built NPVs before, you already meet these requirements.** This guide focuses on the **rig replacement** process, not general WolvenKit navigation.

***

### **The Fix**

We replace the head skeleton in your mesh with one from the correct donor rig that matches your NPV’s eye shape.

> ✅ **Result:** Restores correct bone positions for eyes and facial features. Eye tracking works again; no more “eyeballs escaping through your face.”

***

### **The Trade-Off**

> ⚠ **Heads up:** This changes the _entire_ head skeleton, not just the eyes.
>
> * **Pro:** Eyes track correctly; no clipping.
> * **Con:** The rest of the head inherits _slight_ positional changes from the donor rig.
> * For most NPVs this is worth it.

***

### **Tools Needed**

<table><thead><tr><th width="180">Software</th><th width="193">Version</th><th>Notes</th></tr></thead><tbody><tr><td>Wolvenkit<br><a href="https://github.com/WolvenKit/Wolvenkit/releases">Stable</a> | <a href="https://github.com/WolvenKit/WolvenKit-nightly-releases/releases">Nightly</a></td><td>>= 8.6 recommended </td><td>You can't make mods without Wolvenkit</td></tr></tbody></table>

***

### **Workflow Overview**

1. Identify donor rig for your NPV’s face/eye shape.
2. Export target mesh to GLB.
3. Copy skeleton data from donor to target in WolvenKit.
4. Re-import target mesh into WolvenKit.
5. Update the face\_rig component

***

### **Step-by-Step Guide**

#### 1. Prepare Files

* Identify your donor mesh, based on the Character Creation chosen for the Eye
  * Navigate to `base\characters\head\player_base_heads\player_{body}_average\`&#x20;
  * Find the subfolder with the numeric value of your Eye choice.  The number will be offset by 1 because the rig 000 is associated with Character Creation choice of 01.

> 📄 **Example:**
>
> If your eye selection was 12, your rig/bones will be found in the 011 folder, either:
>
> * `h0_`**`011`**`_pwa_c__young_714`
> * `h0_`**`011`**`_pma_c__middle_763`

* Import the necessary files into WolvenKit:
  * **Source mesh** (donor head with correct rig, identified above)
  * New **facialsetup** and **rig** files
  * **Target mesh** (NPV head you want to fix)
* Duplicate the target mesh to keep an untouched backup.

> ⚠ **Warning:** Never work directly on your final NPV mesh! Always duplicate for edits.

***

#### 2. Export target mesh to GLB

* Export your target mesh using the Export Tool in WolvenKit.

> ⚠ **Note:** You won't need to edit this GLB directly, but the step of exporting and importing is absolutely necessary.

***

#### 3. Copy Skeleton Data

* Open both both the target and donor meshes in WolvenKit.
* Change the **Editor Mode** to **Advanced** in both
* In the target mesh, delete the following arrays:
  * `"boneNames"`.
  * `"boneRigMatrices"`.
  * `"boneVertexEpsilons"`
  * `"renderResourceBlob/header/bonePositions"`
* In donor mesh, copy each of these arrays, one at a time, and paste them into the target mesh:

***

#### 4. Re-import target mesh into WolvenKit

* Save your changes.
* Using the **Import Tool**, import your target mesh from GLB.

> ⚠ **Important:** This step is crucial for allowing WolvenKit to correctly calculate the new bone values.  Without it, your NPVs face will droop and sag.

***

#### **5. Update the `face_rig` Component**

After replacing the skeleton in the mesh, you need to update the **`face_rig`** component so the game points to the correct donor rig and facial setup.

1. In WolvenKit, open the `.app` or `.ent` file that contains your NPV’s head setup.
2. Locate the **`face_rig`** component.
3. Update:
   * **`rig`** → point this to the donor `.rig` file you imported in Step 1.
   * **`facialSetup`** → point this to the donor `.facialsetup` file you imported in Step 1.
4. Leave the **`animGraph`** value _unchanged_ — this stays as it is.

<figure><img src="../../.gitbook/assets/wiki_component.png" alt=""><figcaption></figcaption></figure>

> ⚠ **Important:** If you don’t update both `.rig` and `.facialsetup` to match the donor, the facial bones will not behave correctly in-game.

### **Credits**

* **Original JSON Method:** [xBaebsae](https://xbaebsae.jimdofree.com/cyberpunk-2077-guides/cp2077-transferring-and-expanding-skeletons-in-meshes/)
* @eagull, [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention") , and @scorpiontank for their invaluable input
* [Zwei Valerie](https://app.gitbook.com/u/YvPrbtYFcff1iVuhhxhlJJEYw8l1 "mention") and [lLorion](https://app.gitbook.com/u/PBj6mVsHrzUk8L79wwGi1JC8qnp2 "mention") for trials/testing
