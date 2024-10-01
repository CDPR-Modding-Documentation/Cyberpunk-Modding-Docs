---
description: Which body parts are where?
---

# Cheat Sheet: Body

## Summary

**Last documented edit**: January 06 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page lists various properties of the player body. Use the Table of Contents or your browser's search (Hotkey: `Ctrl+F`) to quickly find what you're looking for. Any links will lead you to additional context.

You can find the list of skin tones, hair and facial expressions under [cheat-sheet-head](cheat-sheet-head/ "mention")

The details on arms can be found under [cheat-sheet-arms.md](cheat-sheet-arms.md "mention")

### Wait, this isn't what I'm looking for!

When editing body mods, you need to edit both the mesh and the morphtarget.

There is no dedicated guide yet, but you can refer to [a-new-head-for-v.md](../../modding-guides/npcs/a-new-head-for-v.md "mention").

For a list and explanation of body mods, check the [overlay-list.md](../../modding-guides/npcs/custom-tattoos-and-scars/converting-between-tattoo-frameworks/overlay-list.md "mention") page.

{% hint style="success" %}
While you can use this information to show/hide parts of the player body via chunkmasks, you might consider using [ArchiveXL tags](../../modding-guides/items-equipment/influencing-other-items.md#visualtags) instead.
{% endhint %}

***

## Player Base Body

<table data-header-hidden><thead><tr><th width="212">File</th><th width="309">File Path</th><th>Component</th></tr></thead><tbody><tr><td>male body</td><td><code>base\characters\common\player_base_bodies\player_man_average\t0_000_pma_base__full.mesh</code></td><td><code>t0_000_pma_base__full</code></td></tr><tr><td>female body</td><td><code>base\characters\common\player_base_bodies\player_female_average\t0_000_pwa_base__full.mesh</code></td><td><code>t0_000_pwa_base__full</code></td></tr><tr><td>female body, big boobs</td><td><code>base\characters\common\player_base_bodies\player_female_average\t0_000_pwa_base__full_breast_big.mesh</code></td><td><em>applied by morphtarget</em></td></tr><tr><td>female body, small boobs</td><td><code>base\characters\common\player_base_bodies\player_female_average\t0_000_pwa_base__full_breast_small.mesh</code></td><td><em>applied by morphtarget</em></td></tr><tr><td>female body, flat feet</td><td><code>base\characters\common\player_base_bodies\player_female_average\l0_000_pwa_base__cs_flat.mesh</code></td><td><code>l0_000_pwa_base__cs_flat</code></td></tr></tbody></table>

### Seamfix meshes

These meshes cover up seams at arms and shoulders, where the mesh edges might show gaps.

<table data-header-hidden><thead><tr><th width="214"></th><th width="316"></th><th>Component</th></tr></thead><tbody><tr><td>male body</td><td><code>base\characters\common\player_base_bodies\player_man_average\t0_000_pma_base__full_seamfix.mesh</code></td><td><code>t0_000_pma_base__full_seamfix</code></td></tr><tr><td>female body</td><td><code>base\characters\common\player_base_bodies\player_female_average\t0_000_pwa_base__full_seamfix.mesh</code></td><td><code>t0_000_pwa_base__full_seamfix</code></td></tr></tbody></table>

## Body tattoos

### Female body gender

<table><thead><tr><th width="494"></th><th>Component</th></tr></thead><tbody><tr><td><code>base\characters\common\player_base_bodies\player_female_average\tattoos\tx_000_pwa_base__full_tattoo_01.mesh</code></td><td><code>tx_000_pwa_base__full_tattoo_01</code></td></tr><tr><td><code>base\characters\common\player_base_bodies\player_female_average\tattoos\tx_000_pwa_base__full_tattoo_02.mesh</code></td><td><code>tx_000_pwa_base__full_tattoo_02</code></td></tr><tr><td><code>base\characters\common\player_base_bodies\player_female_average\tattoos\tx_000_pwa_base__full_tattoo_03.mesh</code></td><td><code>tx_000_pwa_base__full_tattoo_03</code></td></tr><tr><td><code>base\characters\common\player_base_bodies\player_female_average\tattoos\tx_000_pwa_base__full_tattoo_04.mesh</code></td><td><code>tx_000_pwa_base__full_tattoo_04</code></td></tr><tr><td><code>base\characters\common\player_base_bodies\player_female_average\tattoos\tx_000_pwa_base__full_tattoo_05.mesh</code></td><td><code>tx_000_pwa_base__full_tattoo_05</code></td></tr></tbody></table>

### Male body gender

<table><thead><tr><th width="494"></th><th>Component</th></tr></thead><tbody><tr><td><code>base\characters\common\player_base_bodies\player_man_average\tattoos\tx_000_pma_base__full_tattoo_01.mesh</code></td><td><code>tx_000_pma_base__full_tattoo_01</code></td></tr><tr><td><code>base\characters\common\player_base_bodies\player_man_average\tattoos\tx_000_pma_base__full_tattoo_02.mesh</code></td><td><code>tx_000_pma_base__full_tattoo_02</code></td></tr><tr><td><code>base\characters\common\player_base_bodies\player_man_average\tattoos\tx_000_pma_base__full_tattoo_03.mesh</code></td><td><code>tx_000_pma_base__full_tattoo_03</code></td></tr><tr><td><code>base\characters\common\player_base_bodies\player_man_average\tattoos\tx_000_pma_base__full_tattoo_04.mesh</code></td><td><code>tx_000_pma_base__full_tattoo_04</code></td></tr><tr><td><code>base\characters\common\player_base_bodies\player_man_average\tattoos\tx_000_pma_base__full_tattoo_05.mesh</code></td><td><code>tx_000_pma_base__full_tattoo_05</code></td></tr></tbody></table>

## NPC bodies

You can find NPC bodies in the following folder:

```
base\characters\common\base_bodies
```

<table><thead><tr><th width="187">NPC</th><th>file path</th><th>explanation</th></tr></thead><tbody><tr><td>man base</td><td><code>base\characters\common\base_bodies\man_average\t0_000_ma_base__full.mesh</code></td><td>average body type, male body gender</td></tr><tr><td>man big</td><td><code>base\characters\common\base_bodies\man_big\t0_000_mb_base__full_hql.mesh</code></td><td>Sumo body type</td></tr><tr><td>man child</td><td><code>base\characters\common\base_bodies\man_child\t0_000_mc_base__full.mesh</code></td><td>Used for all children, regardless of body gender</td></tr><tr><td>man fat</td><td><code>base\characters\common\base_bodies\man_fat\t0_000_mf_base__full.mesh</code></td><td>fat citizens</td></tr><tr><td>man massive</td><td><code>base\characters\common\base_bodies\man_massive\t0_000_mm_base__full_head.mesh</code></td><td>Used for Sasquatch and Adam Smasher's 2020 appearance</td></tr><tr><td>woman average</td><td><code>base\characters\common\base_bodies\woman_average\t0_000_wa_base__full_hq.mesh</code></td><td>average body type, female body gender.<br>Boob and foot submeshes included.</td></tr><tr><td>woman small</td><td><code>base\characters\common\base_bodies\woman_small\t0_000_ws_base__full.mesh</code></td><td>???</td></tr></tbody></table>

## Head

Find this information under [cheat-sheet-head](cheat-sheet-head/ "mention").

## Skin definitions

{% hint style="info" %}
For a list of [#skin-tones-by-index](cheat-sheet-head/#skin-tones-by-index "mention"), see [cheat-sheet-head](cheat-sheet-head/ "mention")
{% endhint %}

Skin materials are defined in the individual body files. For their paths, see [#player-base-body](cheat-sheet-body.md#player-base-body "mention").

You can find the [definitions](../files-and-what-they-do/3d-objects-.mesh-files#step-3-material-definition) in the localMaterialBuffer. Each material overrides the following properties locally:

* Normal (bump/height map)
* Albedo (diffuse/complexion)

All other properties are pulled from a [.mi file](../files-and-what-they-do/materials/re-using-materials-.mi.md) in the following folder:

<table><thead><tr><th width="251"></th><th></th></tr></thead><tbody><tr><td>female body gender</td><td><code>base\characters\common\skin\character_mat_instance\female\body\</code></td></tr><tr><td>male body gender</td><td><code>base\characters\common\skin\character_mat_instance\male\body\</code></td></tr></tbody></table>

### Body: material instances

The names of the body's material instance files are identical to those used by the player head. Find them under [#head-material-instances](cheat-sheet-head/#head-material-instances "mention").

## Making Body mods

If you want to make a body mod, you need to modify the following files.\
Please do clothing modders a favour either fit your body to vanilla proportions, or register a tag for [archivexl-body-mods-and-refits](../core-mods-explained/archivexl/archivexl-body-mods-and-refits/ "mention") right away!

### Female body gender

#### **Head:**

`base\characters\head\player_base_heads\player_female_average\h0_000_pwa__morphs.morphtarget`\
\
`base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\h0_000_pwa_c__basehead.mesh`

#### **TPP Body:**

`base\characters\common\player_base_bodies\player_female_average\t0_000_pwa_base__full.morphtarget`\
`base\characters\common\player_base_bodies\player_female_average\t0_000_pwa_base__full.mesh`\
`base\characters\common\player_base_bodies\player_female_average\l0_000_pwa_base__cs_flat.mesh`

#### **TPP Arms:**

`base\characters\common\player_base_bodies\player_female_average\arms_hq\a0_000_pwa_base_hq__full.mesh` (only used in character creation)\
`base\characters\common\player_base_bodies\player_female_average\arms_hq\a0_000_pwa_base_hq__l.mesh`\
`base\characters\common\player_base_bodies\player_female_average\arms_hq\a0_000_pwa_base_hq__r.mesh`

#### **FPP Head + Body + Arms:**

`base\characters\common\player_base_bodies\player_female_average\fpp\n0_000_pwa_fpp__neck.mesh` `base\characters\common\player_base_bodies\player_female_average\fpp\t0_000_pwa_fpp__torso.mesh` `base\characters\common\player_base_bodies\player_female_average\fpp\a0_000_pwa_fpp__full_l.mesh` `base\characters\common\player_base_bodies\player_female_average\fpp\a0_000_pwa_fpp__full_r.mesh` `base\characters\common\player_base_bodies\player_female_average\fpp\l0_000_pwa_fpp__cs_flat.mesh`

### Male body gender

#### **Head:**

`base\characters\head\player_base_heads\player_man_average\h0_000_pwa__morphs.morphtarget`\
`base\characters\head\player_base_heads\player_man_average\h0_000_pwa_c__basehead\h0_000_pwa_c__basehead.mesh`

#### **TPP Body:**

`base\characters\common\player_base_bodies\player_man_average\t0_000_pma_base__full.mesh`

#### **TPP Arms:**

`base\characters\common\player_base_bodies\player_man_average\arms_hq\a0_000_pma_base_hq__full.mesh` (only used in character creation)\
`base\characters\common\player_base_bodies\player_man_average\arms_hq\a0_000_pma_base_hq__l.mesh`\
`base\characters\common\player_base_bodies\player_man_average\arms_hq\a0_000_pma_base_hq__r.mesh`

#### **FPP Head + Body + Arms:**

`base\characters\common\player_base_bodies\player_man_average\fpp\n0_000_pma_fpp__neck.mesh`\
`base\characters\common\player_base_bodies\player_man_average\fpp\t0_000_pma_fpp__torso.mesh` `base\characters\common\player_base_bodies\player_man_average\fpp\a0_000_pma_fpp__full_l.mesh`\
`base\characters\common\player_base_bodies\player_man_average\fpp\a0_000_pma_fpp__full_r.mesh` \\
