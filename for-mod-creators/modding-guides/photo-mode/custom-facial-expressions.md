---
description: Guide to change expressions for photo mode and AMM
---

# Custom Facial Expressions

**This tutorial will teach you how to replace the default Photo mode or AMM expressions with those from an NPC.**&#x20;

**Difficulty:** trivial if you know how to read

## Contents

* [Step 1: Locate the right file](broken-reference)
* [Step 2: Replace the file with the one you want](broken-reference)
* [Step 3: Pick the expressions you want](broken-reference)
* [References](broken-reference)
* [Troubleshooting](custom-facial-expressions.md#troubleshooting)

## Step 1: Locate the right file

### Photo Mode

<table data-header-hidden><thead><tr><th width="148"></th><th></th></tr></thead><tbody><tr><td>female rig</td><td><pre><code>base\animations\ui\photomode\photomode_female_facial.anims
</code></pre></td></tr><tr><td>male rig</td><td><pre><code>base\animations\ui\photomode\photomode_male_facial.anims
</code></pre></td></tr></tbody></table>

### AMM

Both genders will use

`base\animations\facial\male_average\interactive_scene\generic_average_male_facial_idle.anims`

{% hint style="info" %}
This will be called the **target file** in the rest of this guide
{% endhint %}

## Step 2: Replace the target file with the one you want

NPC animation files have the extension `.anims` and reside in the folder `base\animations\facial`. You can find the ones for facial expressions by searching in WolvenKit for

```
base\animations\facial\ *.anims
```

Find the file that you want to use and copy it over the original file.

{% hint style="info" %}
Although the file names are gendered, you can pick **any of them**.
{% endhint %}

&#x20;If you aren't sure which file you want to use, check the [references](../../references-lists-and-overviews/cheat-sheet-face-and-skin/cheat-sheet-facial-expressions.md#expression-references-for-individual-npc-files).&#x20;

_👉 If you are missing reference screenshots, feel free to create and upload them. The existing ones have been created the hard way._

```
Example:

To put Rogue's facial expressions on a male V, you copy
base\animations\facial\main_characters\rogue\rogue_facial_idle_poses.anims
over the target file at 
base\animations\ui\photomode\photomode_male_facial.anims

To use her expressions in AMM, overwrite
base\animations\facial\male_average\interactive_scene\generic_average_male_facial_idle.anims
```

## Step 3: Pick the expressions you want

Photo mode uses a total of 12 expressions by looking for [animation names](../../references-lists-and-overviews/cheat-sheet-face-and-skin/cheat-sheet-facial-expressions.md#photo-mode) in the target file. You need to connect the selection picker with the NPC file you just copied.&#x20;

{% hint style="success" %}
Find their names [here](../../references-lists-and-overviews/cheat-sheet-face-and-skin/cheat-sheet-facial-expressions.md).

**Important:** AMM and photo mode use different keys. Just make sure to pick the right table, and everything will be fine.
{% endhint %}

Do this by opening the target file (which you replaced with the NPC of your choice) in WolvenKit.&#x20;

Find the animation you want to use and change its name:

<figure><img src="https://i.imgur.com/KYevLPa.png" alt=""><figcaption><p>Replace the original name with one from the <a href="../../references-lists-and-overviews/cheat-sheet-face-and-skin/cheat-sheet-facial-expressions.md#photo-mode">list</a>. <br>If you don't know which ones you want to use, check out the <a href="../../references-lists-and-overviews/cheat-sheet-face-and-skin/cheat-sheet-facial-expressions.md#expression-references-for-individual-npc-files">references</a>.</p></figcaption></figure>

Rinse and repeat the process until you're done.

{% hint style="success" %}
Save the file, pack the project, and start the game - voila, you now have custom expressions.
{% endhint %}

## References

{% hint style="info" %}
You can find a list of screenshots with facial expression references [here](../../references-lists-and-overviews/cheat-sheet-face-and-skin/cheat-sheet-facial-expressions.md#expression-references-for-individual-npc-files).
{% endhint %}

## Troubleshooting

### My expressions don't work at all!

Make sure that you have replaced the correct file, and that your mod has been correctly packed and installed.

### Some of my expressions aren't working!

The game will look for the animation **by exact name**. AMM is using a different list than photo mode — make sure that you are using the right keys.

### It's showing expressions, but not the one I picked!

Check your target file: you have used a key twice.&#x20;

If the game is looking for the neutral expression, it will stop looking as soon as it finds an animation with the name of `facial_neutral`. If you have multiple of those, it won't care.
