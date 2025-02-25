---
description: Guide to change expressions for photo mode and AMM
---

# AMM/Photomode: Other Facial Expressions

## Summary <a href="#summary" id="summary"></a>

**Published: ??? by** [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update: Mar 08 2024 by** [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This tutorial will teach you how to replace **facial expressions** for Photo Mode or AMM with those of an NPC.&#x20;

**Difficulty:** You need to be able to read. If you run into trouble anyway, please hit us up [on Discord](https://discord.gg/redmodding) so that we can improve this guide!

### Wait, this is not what I want!

* If you want to look at **reference expressions**, check [here](../../../for-mod-creators-theory/references-lists-and-overviews/cheat-sheet-head/cheat-sheet-facial-expressions.md#expression-references-for-individual-npc-files).
* If you want to import your own facial expressions, then currently (Mar 08 2024) you're somewhat out of luck, because the toolchain doesn't fully support you yet and we don't have a guide. Reach out [on Discord](https://discord.gg/redmodding) and help us to get this show on the road!&#x20;
* If you want to make custom **poses** for anything that is not the face, check [poses-animations-make-your-own](../animations/poses-animations-make-your-own/ "mention")

## Step 1: Locate the right file

{% hint style="info" %}
This will be called the **target file** in the rest of this guide
{% endhint %}

### Photo Mode

<table data-header-hidden><thead><tr><th width="148"></th><th></th></tr></thead><tbody><tr><td>female rig</td><td><pre><code>base\animations\ui\photomode\photomode_female_facial.anims
</code></pre></td></tr><tr><td>male rig</td><td><pre><code>base\animations\ui\photomode\photomode_male_facial.anims
</code></pre></td></tr></tbody></table>

### AMM

Both body genders genders are using the same file:

`base\animations\facial\male_average\interactive_scene\generic_average_male_facial_idle.anims`

## Step 2: Replace the target file with the one you want

NPC animation files have the extension `.anims` and reside in the folder `base\animations\facial`. You can find the ones for facial expressions by [searching in WolvenKit](https://wiki.redmodding.org/wolvenkit/wolvenkit-app/usage/wolvenkit-search-finding-files) for

```
base\animations\facial\ *.anims
```

Find the file that you want to use and copy it over the original file.

{% hint style="info" %}
Although the file names are gendered, you can pick **any of them**.
{% endhint %}

&#x20;If you aren't sure which file you want to use, check the [references](../../../for-mod-creators-theory/references-lists-and-overviews/cheat-sheet-head/cheat-sheet-facial-expressions.md#expression-references-for-individual-npc-files).&#x20;

_👉 If you are missing reference screenshots, feel free to create and upload them and_ [_update the wiki_](https://app.gitbook.com/invite/-MP5ijqI11FeeX7c8-N8/H70HZBOeUulIpkQnBLK7)_._

<details>

<summary>Example</summary>

To put Rogue's facial expressions on a male V, you copy

```
base\animations\facial\main_characters\rogue\rogue_facial_idle_poses.anims
```

over your target file.

For photo mode:

```
base\animations\ui\photomode\photomode_male_facial.anims
```

For AMM:

```
base\animations\facial\male_average\interactive_scene\generic_average_male_facial_idle.anims
```

</details>

## Step 3: Pick the expressions you want

You now need to make the expressions from your new file selectable by AMM/Photo mode. This happens via [animation names](../../../for-mod-creators-theory/references-lists-and-overviews/cheat-sheet-head/cheat-sheet-facial-expressions.md#photo-mode) in the target file.&#x20;

{% hint style="success" %}
Find the correct names [here](../../../for-mod-creators-theory/references-lists-and-overviews/cheat-sheet-head/cheat-sheet-facial-expressions.md).

**Important:** AMM and photo mode use different keys. Just make sure to pick the right table, and everything will be fine.
{% endhint %}

1. Open the target file (which you replaced with the NPC of your choice) in WolvenKit.&#x20;
2. Find the animation you want to use and change its name:

<figure><img src="https://i.imgur.com/KYevLPa.png" alt=""><figcaption><p>Replace the original name with one from the <a href="../../../for-mod-creators-theory/references-lists-and-overviews/cheat-sheet-head/cheat-sheet-facial-expressions.md#photo-mode">list</a>. <br>If you don't know which ones you want to use, check out the <a href="../../../for-mod-creators-theory/references-lists-and-overviews/cheat-sheet-head/cheat-sheet-facial-expressions.md#expression-references-for-individual-npc-files">references</a>.</p></figcaption></figure>

3. Rinse and repeat the process with all animation names
4. Save the file
5. [Install the project and start the game](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/menu/toolbar#install-and-launch)

{% hint style="success" %}
Voila, you now have custom expressions.
{% endhint %}

## Troubleshooting

### My expressions don't work at all!

Make sure that you have replaced the correct file, and that your mod has been correctly packed and installed.

### Some of my expressions aren't working!

The game will look for the animation **by exact name**. AMM is using a different list than photo mode — make sure that you are using the right keys.

### It's showing expressions, but not the one I picked!

Check your target file: you have used a key twice.&#x20;

If the game is looking for the neutral expression, it will stop looking as soon as it finds an animation with the name of `facial_neutral`. If you have multiple of those, it won't care.
