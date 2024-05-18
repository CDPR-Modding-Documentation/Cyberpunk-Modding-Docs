---
description: Which body parts are where?
---

# Cheat Sheet: Body

#### Summary

Last documented edit: January 06 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page lists various properties of the player body. Use the Table of Contents or your browser's search (Hotkey: `Ctrl+F`) to quickly find what you're looking for.  Any links will lead you to additional context.

You can find the list of skin tones, hair and facial expressions under [cheat-sheet-head](cheat-sheet-head/ "mention")

### Wait, this isn't what I'm looking for!

IWhen editing body mods, you need to edit both the mesh and the morphtarget.&#x20;

There is no dedicated guide yet, but you can refer to [a-new-head-for-v.md](../modding-guides/npcs/a-new-head-for-v.md "mention").

{% hint style="success" %}
While you can use this information to show/hide parts of the player body via chunkmasks, you might consider using [ArchiveXL tags](../modding-guides/items-equipment/influencing-other-items.md#visualtags) instead.
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

## Head

Find this information under [cheat-sheet-head](cheat-sheet-head/ "mention").

## Skin definitions

{% hint style="info" %}
For a list of [#skin-tones-by-index](cheat-sheet-head/#skin-tones-by-index "mention"), see [cheat-sheet-head](cheat-sheet-head/ "mention")
{% endhint %}

Skin materials are defined in the individual body files. For their paths, see [#player-base-body](cheat-sheet-body.md#player-base-body "mention").

You can find the [definitions](../files-and-what-they-do/3d-objects-.mesh-files/#step-3-material-definition) in the localMaterialBuffer. Each material overrides the following properties locally:

* Normal (bump/height map)
* Albedo (diffuse/complexion)

All other properties are pulled from a [.mi file](../files-and-what-they-do/materials/re-using-materials-.mi.md) in the following folder:

<table><thead><tr><th width="251"></th><th></th></tr></thead><tbody><tr><td>female body gender</td><td><code>base\characters\common\skin\character_mat_instance\female\body\</code></td></tr><tr><td>male body gender</td><td><code>base\characters\common\skin\character_mat_instance\male\body\</code></td></tr></tbody></table>

### Body: material instances

The names of the body's material instance files are identical to those used by the player head. Find them under [#head-material-instances](cheat-sheet-head/#head-material-instances "mention").

## Arms

The player base body does not come with arms attached — this makes it easier to switch out the different kinds of cyberarms.

{% hint style="info" %}
Arms are using different meshes for the first person perspective. You can usually find them near the regular meshes in a subfolder with the name `fpp`.

There's no easy way to hide arms. For more information, check [#archivexl-tags](../core-mods-explained/archivexl/archivexl-tags.md#archivexl-tags "mention")
{% endhint %}

You can look up the component names and their properties in the .ent files per body gender in these folders (the file names will start with `a0_`):

<table><thead><tr><th width="155.33333333333331"></th><th>Folder or .ent files</th><th>Component names</th></tr></thead><tbody><tr><td>Default (female)</td><td><code>base\characters\common\player_base_bodies\player_female_average\arms_hq</code><br><br><code>arms_full</code> is only used by character creator!</td><td><pre><code><strong>a0_001_pwa_base_hq__full  
</strong>a0_001_pwa_base_hq__full 
left_arm    
right_arm  
a0_000_pwa_base__fists                                                         
</code></pre></td></tr><tr><td>Default (male)</td><td><p><code>base\characters\common\player_base_bodies\player_man_average\arms_hq</code></p><p><br><code>arms_full</code> is only used by character creator!</p></td><td><pre><code><strong>a0_001_pma_base_hq__full  
</strong>a0_001_pma_base_hq__full 
left_arm    
right_arm  
a0_000_pma_base__fists  
</code></pre></td></tr><tr><td>Mantis Blades (female)</td><td><code>base\characters\cyberware\player\a0_003__mantisblade\entities\a0_003_wa__mantisblades.ent</code></td><td><pre><code>a0_003_wa__mantisblade_upperarm_left
a0_003_wa__mantisblade_upperarm_right
</code></pre></td></tr><tr><td>Mantis Blades (male)</td><td><code>base\characters\cyberware\player\a0_003__mantisblade\entities\a0_003_ma__mantisblades.ent</code></td><td><pre><code>a0_003_ma__mantisblade_upperarm_left
a0_003_ma__mantisblade_upperarm_right
</code></pre></td></tr><tr><td>Gorilla Arms (female)</td><td><code>base\characters\cyberware\player\a0_005__strongarms\entities\a0_005_wa__strongarms.ent</code></td><td><pre><code>a0_005_wa__strongarms_holstered_r
a0_005_wa__strongarms_holstered_l
a0_005_wa__strongarms_l
a0_005_wa__strongarms_r
a0_005_wa__strongarms_photo_mode_r
a0_005_wa__strongarms_photo_mode_l
</code></pre></td></tr><tr><td>Gorilla Arms (male)</td><td><code>base\characters\cyberware\player\a0_005__strongarms\entities\a0_005_ma__strongarms.ent</code></td><td><pre><code>a0_005_ma__strongarms_holstered_r
a0_005_ma__strongarms_holstered_l
a0_005_ma__strongarms_l
a0_005_ma__strongarms_r
a0_005_ma__strongarms_photo_mode_r
a0_005_ma__strongarms_photo_mode_l
</code></pre></td></tr><tr><td>Rocket Launcher</td><td><code>base\characters\cyberware\player\a0_006__launcher</code></td><td></td></tr><tr><td>Monowire (female)</td><td><code>base\characters\cyberware\player\a0_002__monowire_whip\entities\a0_002_wa__monowire_whip.ent</code></td><td><pre><code>a0_002_wa__monowire_whip_l_cableless
a0_002_wa__monowire_whip_r_cableless
</code></pre></td></tr><tr><td>Monowire (male)</td><td><code>base\characters\cyberware\player\a0_002__monowire_whip\entities\a0_002_ma__monowire_whip.ent</code></td><td><pre><code>a0_002_ma__monowire_whip_l_cableless
a0_002_ma__monowire_whip_r_cableless
</code></pre></td></tr></tbody></table>

## Making Body mods

If you want to make a body mod, you need to modify the following files. \
Please do clothing modders a favour either fit your body to vanilla proportions, or register a tag for [archivexl-body-mods-and-refits](../core-mods-explained/archivexl/archivexl-body-mods-and-refits/ "mention") right away!

### Female body gender

#### **Head:**&#x20;

`base\characters\head\player_base_heads\player_female_average\h0_000_pwa__morphs.morphtarget` \
\
`base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\h0_000_pwa_c__basehead.mesh`

#### &#x20;**TPP Body:**&#x20;

`base\characters\common\player_base_bodies\player_female_average\t0_000_pwa_base__full.morphtarget` \
`base\characters\common\player_base_bodies\player_female_average\t0_000_pwa_base__full.mesh` \
`base\characters\common\player_base_bodies\player_female_average\l0_000_pwa_base__cs_flat.mesh`

#### &#x20;**TPP Arms:**&#x20;

`base\characters\common\player_base_bodies\player_female_average\arms_hq\a0_000_pwa_base_hq__full.mesh`  (only used in character creation)\
`base\characters\common\player_base_bodies\player_female_average\arms_hq\a0_000_pwa_base_hq__l.mesh` \
`base\characters\common\player_base_bodies\player_female_average\arms_hq\a0_000_pwa_base_hq__r.mesh`

#### &#x20;**FPP Head + Body + Arms:**&#x20;

`base\characters\common\player_base_bodies\player_female_average\fpp\n0_000_pwa_fpp__neck.mesh` `base\characters\common\player_base_bodies\player_female_average\fpp\t0_000_pwa_fpp__torso.mesh` `base\characters\common\player_base_bodies\player_female_average\fpp\a0_000_pwa_fpp__full_l.mesh` `base\characters\common\player_base_bodies\player_female_average\fpp\a0_000_pwa_fpp__full_r.mesh` `base\characters\common\player_base_bodies\player_female_average\fpp\l0_000_pwa_fpp__cs_flat.mesh`

### Male body gender

#### **Head:**&#x20;

`base\characters\head\player_base_heads\player_man_average\h0_000_pwa__morphs.morphtarget` \
`base\characters\head\player_base_heads\player_man_average\h0_000_pwa_c__basehead\h0_000_pwa_c__basehead.mesh`

#### &#x20;**TPP Body:**&#x20;

`base\characters\common\player_base_bodies\player_man_average\t0_000_pma_base__full.mesh`&#x20;

#### &#x20;**TPP Arms:**&#x20;

`base\characters\common\player_base_bodies\player_man_average\arms_hq\a0_000_pma_base_hq__full.mesh` (only used in character creation)\
`base\characters\common\player_base_bodies\player_man_average\arms_hq\a0_000_pma_base_hq__l.mesh` \
`base\characters\common\player_base_bodies\player_man_average\arms_hq\a0_000_pma_base_hq__r.mesh`

#### &#x20;**FPP Head + Body + Arms:**&#x20;

`base\characters\common\player_base_bodies\player_man_average\fpp\n0_000_pma_fpp__neck.mesh` \
`base\characters\common\player_base_bodies\player_man_average\fpp\t0_000_pma_fpp__torso.mesh` `base\characters\common\player_base_bodies\player_man_average\fpp\a0_000_pma_fpp__full_l.mesh` \
`base\characters\common\player_base_bodies\player_man_average\fpp\a0_000_pma_fpp__full_r.mesh` \


