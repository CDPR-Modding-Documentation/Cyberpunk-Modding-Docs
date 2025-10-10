---
description: What is Garment Support and how does it work?
---

# Garment Support: How does it work?

## Summary

This page will teach you how garmentSupport works – the system that Cyberpunk2077 uses to tuck pants into boots and shirts under jackets. It contains theory, which you don't need to understand to use the system.

_Credit goes to psiberx (_[_discord post_](https://discord.com/channels/717692382849663036/955663052903178270/1059406562277470240) _with initial explanation of the algorithm), island dancer for providing screenshots and know-how, and Auska for making morphtarget/garmentSupport import able in Wolvenkit._

### Wait, that's not what I want!

If you want to **create** garment support, check [garment-support-from-scratch.md](garment-support-from-scratch.md "mention")

If you want to **use** garment support in an existing mod, you only need to use [#component-prefixes](./#component-prefixes "mention")

If your garment support is shrinking too far, check [Painting garment support parameters](painting-garment-support-parameters.md)

If you have other problems, see [#troubleshooting-garment-support](./#troubleshooting-garment-support "mention") at the end of the page.

## What is garment support?

The engine morphs garments to avoid clipping — for example, if you equip a pair of boots and V's jeans no longer cover the shoes, but get tucked under.

<figure><img src="../../../.gitbook/assets/garment_support_in_action.png" alt=""><figcaption><p>Garment Support in action</p></figcaption></figure>

This process is accomplished via 'parameters' on the mesh:

<figure><img src="../../../.gitbook/assets/mesh_editing_parameters.png" alt=""><figcaption><p>These will show up as shape keys in your Blender export</p></figcaption></figure>

### Why doesn't it work on my NPC?

GarmentSupport only works on **actual garment items** that have been equipped using the game's **transaction system**. As of October 2024, that's not the case for NPCs. \
You'll have to go refitting!

## Component prefixes

Garment support will be applied based on garmentScore. For this, the **prefix** of the component name will be considered (components are named in your .app or .ent file's component array).

A high garment score means that the item is "on top", squishing anything worn "below". (See [#the-algorithm](./#the-algorithm "mention") for details.)

The prefixes are as follows:



<table><thead><tr><th width="130"></th><th></th></tr></thead><tbody><tr><td><p>h0_</p><p>t0_</p><p>s0_</p><p>l0_<br>...</p></td><td>Any component with a 0 in its prefix will be treated like a body mesh (no deform/squishing of <strong>any</strong> meshes with x0_ prefixes across .ent files)</td></tr><tr><td>h1_</td><td>Head inner (mask, sunglasses)</td></tr><tr><td>h2_</td><td>Head outer (helmet, bandana)</td></tr><tr><td>t1_</td><td>Torso inner (shirts)</td></tr><tr><td>t2_</td><td>Torso outer (jackets, coats...)</td></tr><tr><td>s1_</td><td>Shoes</td></tr><tr><td>l1_</td><td>legs (pants that aren't leggins)</td></tr></tbody></table>

## How it looks if it's broken



<figure><img src="../../../.gitbook/assets/garment_support_broken.png" alt=""><figcaption><p>Often, you can salvage things by deleting the parameters in WolvenKit</p></figcaption></figure>

## The algorithm

{% hint style="info" %}
TL;DR: High garment score means "on top", items below will get squished.
{% endhint %}

{% hint style="warning" %}
Components with the same prefix in the same .ent file will not squish each other, e.g. `l1_stockings` and l1\_pants will not deform each other, but they will deform `s1_socks`
{% endhint %}

The game calculates the garment score by checking the prefix of component names, where the one with the lowest prefix is the innermost:

```
s0 = 0    // no prefix will also be 0
l0 = 10
a0 = 20
t0 = 30
h0 = 40
s1 = 50
l1 = 60
t1 = 70
i1 = 80
hh = 90
h1 = 100
h2 = 110
t2 = 120
```

After considering the component name, the game will consider the tags in the .ent's `visualTagSchema`:

```
PlayerBodyPart = -2000
Tight = -1000
Normal = 0
Large = +1000
XLarge = +2000
```

An example for `t0_000_pma_base__full` (the default body component, torso+legs):

```
+30          prefix: t0_
-2000        visualTag: PlayerBodyPart

—————————————————————————
-1970
```

If you're using Equipment-EX slots for your clothing items, then the score is determined by outfit slot you are using. The scoring follows the same logic,  i.e. items in slots with higher scores will squish items in slots with lower scores. The garment scores for each outfit slot are:

```
OutfitSlots.Head = 310000
OutfitSlots.Balaclava = 160000
OutfitSlots.Mask = 170000
OutfitSlots.Glasses = 190000
OutfitSlots.Eyes = 130000
OutfitSlots.EyeLeft = 140000
OutfitSlots.EyeRight = 140000
OutfitSlots.Wreath = 180000
OutfitSlots.EarLeft = 140000
OutfitSlots.EarRight = 140000
OutfitSlots.Neckwear = 200000
OutfitSlots.NecklaceTight = 190000
OutfitSlots.NecklaceShort = 190000
OutfitSlots.NecklaceLong = 190000
OutfitSlots.TorsoUnder = 120000
OutfitSlots.TorsoInner = 150000
OutfitSlots.TorsoMiddle = 180000
OutfitSlots.TorsoOuter = 210000
OutfitSlots.TorsoAux = 240000
OutfitSlots.Back = 220000
OutfitSlots.Waist = 200000
OutfitSlots.ShoulderLeft = 200000
OutfitSlots.ShoulderRight = 200000
OutfitSlots.ElbowLeft = 200000
OutfitSlots.ElbowRight = 200000
OutfitSlots.WristLeft = 160000
OutfitSlots.WristRight = 160000
OutfitSlots.Hands = 160000
OutfitSlots.HandLeft = 170000
OutfitSlots.HandRight = 170000
OutfitSlots.HandPropLeft = 310000
OutfitSlots.HandPropRight = 310000
OutfitSlots.FingersLeft = 180000
OutfitSlots.FingersRight = 180000
OutfitSlots.FingernailsLeft = 100000
OutfitSlots.FingernailsRight = 100000
OutfitSlots.LegsInner = 130000
OutfitSlots.LegsMiddle = 160000
OutfitSlots.LegsOuter = 190000
OutfitSlots.ThighLeft = 140000
OutfitSlots.ThighRight = 140000
OutfitSlots.KneeLeft = 140000
OutfitSlots.KneeRight = 140000
OutfitSlots.AnkleLeft = 140000
OutfitSlots.AnkleRight = 140000
OutfitSlots.Feet = 180000
OutfitSlots.ToesLeft = 120000
OutfitSlots.ToesRight = 120000
OutfitSlots.ToenailsLeft = 100000
OutfitSlots.ToenailsRight = 100000
OutfitSlots.BodyUnder = 110000
OutfitSlots.BodyInner = 140000
OutfitSlots.BodyMiddle = 170000
OutfitSlots.BodyOuter = 300000
```



## Troubleshooting Garment Support



### Garment support isn't working/working oddly

#### Component IDs

Check the component's **id** in the mesh `.ent` or `.app` appearance's `components` array:

<figure><img src="../../../.gitbook/assets/mesh_troubleshooting_component_ID.png" alt=""><figcaption></figcaption></figure>

If any given ID is equipped twice, it can break garment support in the way you're observing.

{% hint style="info" %}
If you select the ID in the node tree viewer  to the left, you can use `Generate New CRUID` to create a new entry that is unique considering all your installed mods.
{% endhint %}

#### Import settings

Make sure to [import your mesh](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export/models#import-garment-support) with garment support enabled. If that doesn't do the trick, you can try [re-creating](garment-support-from-scratch.md) the garment support shapekeys in Blender.

### My garment support is shrinking too far! or clipping!

Check [Painting garment support parameters](painting-garment-support-parameters.md) — **paint it red**, baby!

### My garment support explodes on contact with another item!

It's not doing that to spite you. Most likely, you have a non-unique component ID, and the game can't tell the two items apart. Here's how to resolve that:

<figure><img src="../../../.gitbook/assets/unique_cruids.png" alt=""><figcaption><p>The CRUID editor is available in Wolvenkit 8.14+ - you can go grab the <a href="https://github.com/WolvenKit/WolvenKit-nightly-releases/releases">Nightly</a>, too </p></figcaption></figure>

### Importing with Garment Support

Make sure that your mesh has the [Import Garment Support](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export/models#import-garment-support "mention") property checked (this should be default by now).

If that doesn't work, you still have the option to re-create [garment-support-from-scratch.md](garment-support-from-scratch.md "mention") in Blender

### Yeeting Garment Support

If you're fed up with this shit and just want your item to stop cosplaying as an exploding pixel cloud, open the expandable.

{% hint style="danger" %}
This will prevent your garment from shrinking under other, "larger" garments, and practically guarantee that it clips.
{% endhint %}

<details>

<summary>Delete garment support</summary>

**This is not the advised course of action, more a desperate last-resort. Try everything else first!**

<figure><img src="../../../.gitbook/assets/stringcheese1.png" alt=""><figcaption><p>Looks like we have guests from beyond the Blackwall</p></figcaption></figure>

{% hint style="info" %}
To check if it's this, equip **only** the edited item. If it breaks as soon as you put on another clothing item with [garment supports](./#the-algorithm), then the solution below applies.
{% endhint %}

<figure><img src="../../../.gitbook/assets/garment_support_broken.png" alt=""><figcaption></figcaption></figure>

#### Option 1 (likely to work): Import your mesh with garment supports

On the .glb import setting, check the [Import Garment Support](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export/models#import-garment-support "mention") box.&#x20;

#### Option 2 (guaranteed to work): delete GarmentSupport from the mesh

<figure><img src="../../../.gitbook/assets/mesh_editing_parameters.png" alt=""><figcaption><p>This will break automatic shrinking when you put clothes over your item. But hey, if the alternative is a broken mess…</p></figcaption></figure>

</details>
