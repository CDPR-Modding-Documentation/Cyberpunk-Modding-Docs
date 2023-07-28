---
description: What is Garment Support and how does it work?
---

# Garment Support: How does it work?

{% hint style="info" %}
If garment supports are causing trouble for you, your easiest option is to delete the parameters from your mesh. For detail, see [here](troubleshooting-your-mesh-edits.md#my-mesh-is-string-cheese-exploding-vertices).

If you want to include garment supports, check [this](https://docs.google.com/document/d/10dXta2Vicm\_1iZeFy5U07\_PBCwxa1AhqFvVIMZnezPk/edit) guide by engres.
{% endhint %}

_Credit goes to psiberx (_[_discord post_](https://discord.com/channels/717692382849663036/955663052903178270/1059406562277470240) _with initial explanation of the algorithm) and IslandDancer for providing screenshots and know-how_

The engine morphs garments to avoid clipping — for example, if you equip a pair of boots and V's jeans no longer cover the shoes, but get tucked under.

<figure><img src="../../.gitbook/assets/garment_support_in_action.png" alt=""><figcaption><p>Garment Support in action</p></figcaption></figure>

This process is accomplished via 'parameters' on the mesh:

<figure><img src="../../.gitbook/assets/mesh_editing_parameters.png" alt=""><figcaption><p>These will show up as shape keys in your Blender export</p></figcaption></figure>

## Component prefixes

Garment support will be applied based on garmentScore. For this, the **prefix** of the component name will be considered (components are named in your .app or .ent file's component array).

For an explanation of how the algorithm calculates the score, [see the next section.](garment-support-how-does-it-work.md#the-algorithm)

The prefixes are as follows:



<table><thead><tr><th width="130"></th><th></th></tr></thead><tbody><tr><td><p>h0_</p><p>t0_</p><p>s0_</p><p>l0_<br>...</p></td><td>Any component with a 0 in its prefix will be treated like a body mesh (no deform/squishing)</td></tr><tr><td>h1_</td><td>Head inner (mask, sunglasses)</td></tr><tr><td>h2_</td><td>Head outer (helmet, bandana)</td></tr><tr><td>t1_</td><td>Torso inner (shirts)</td></tr><tr><td>t2_</td><td>Torso outer (jackets, coats...)</td></tr><tr><td>s1_</td><td>Shoes</td></tr><tr><td>l1_</td><td>legs (pants that aren't leggins)</td></tr></tbody></table>

## How it looks if it's broken



<figure><img src="../../.gitbook/assets/garment_support_broken.png" alt=""><figcaption><p>Often, you can salvage things by deleting the parameters in WolvenKit</p></figcaption></figure>

## The algorithm

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

