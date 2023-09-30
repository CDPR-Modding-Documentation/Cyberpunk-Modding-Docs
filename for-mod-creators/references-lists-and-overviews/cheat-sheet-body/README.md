---
description: Which body parts are where?
---

# Cheat Sheet: Body

On this page, you can find information how the Cyberpunk player body is set up, along with its file paths.&#x20;

{% hint style="info" %}
You can find the list of skin tones, hair and facial expressions under [cheat-sheet-head](../cheat-sheet-head/ "mention")

There is no dedicated guide as for how to create body mods yet, but the process is roughly the same as for creating [a-new-head-for-v.md](../../modding-guides/npcs/a-new-head-for-v.md "mention").
{% endhint %}

{% hint style="success" %}
While you can use this information to show/hide parts of the player body via chunkmasks, you might consider using [ArchiveXL tags](../../modding-guides/items-equipment/influencing-other-items.md#visualtags) instead.
{% endhint %}

Many of the mesh files are pulled in via **morphtargets**. If you want to create a body mod, you need to edit both.

## Player Base Body

<table data-header-hidden><thead><tr><th width="212">File</th><th width="309">File Path</th><th>Component</th></tr></thead><tbody><tr><td>male body</td><td><code>base\characters\common\player_base_bodies\player_man_average\t0_000_pma_base__full.mesh</code></td><td><code>t0_000_pma_base__full</code></td></tr><tr><td>female body</td><td><code>base\characters\common\player_base_bodies\player_female_average\t0_000_pwa_base__full.mesh</code></td><td><code>t0_000_pwa_base__full</code></td></tr><tr><td>female body, big boobs</td><td><code>base\characters\common\player_base_bodies\player_female_average\t0_000_pwa_base__full_breast_big.mesh</code></td><td><em>applied by morphtarget</em></td></tr><tr><td>female body, small boobs</td><td><code>base\characters\common\player_base_bodies\player_female_average\t0_000_pwa_base__full_breast_small.mesh</code></td><td><em>applied by morphtarget</em></td></tr><tr><td>female body, flat feet</td><td><code>base\characters\common\player_base_bodies\player_female_average\l0_000_pwa_base__cs_flat.mesh</code></td><td><code>l0_000_pwa_base__cs_flat</code></td></tr></tbody></table>

### Seamfix meshes

These meshes cover up seams at arms and shoulders, where the mesh edges might show gaps.

<table data-header-hidden><thead><tr><th width="214"></th><th width="316"></th><th>Component</th></tr></thead><tbody><tr><td>male body</td><td><code>base\characters\common\player_base_bodies\player_man_average\t0_000_pma_base__full_seamfix.mesh</code></td><td><code>t0_000_pma_base__full_seamfix</code></td></tr><tr><td>female body</td><td><code>base\characters\common\player_base_bodies\player_female_average\t0_000_pwa_base__full_seamfix.mesh</code></td><td><code>t0_000_pwa_base__full_seamfix</code></td></tr></tbody></table>

## Head

The player base heads (and scars, tattoos, cyberware) are defined in .app files in the folder `base\characters\head\player_base_heads\appearances\head`

For a guide on how to actually use those things, check the [NPV guide](../../modding-guides/npcs/npv-v-as-custom-npc/npv-preparing-the-head-in-blender.md#step-1-getting-head).

### Male body gender

<table><thead><tr><th width="155.33333333333331"></th><th>path</th><th>component name</th></tr></thead><tbody><tr><td>eyes</td><td><code>base\characters\head\player_base_heads\player_man_average\h0_000_pma_c__basehead\he_000_pma_c__basehead.mesh</code></td><td>he_000_pma__basehead</td></tr><tr><td>teeth</td><td><code>base\characters\head\player_base_heads\player_man_average\h0_000_pma_c__basehead\ht_000_pma_c__basehead.mesh</code></td><td>ht_000_pma__basehead</td></tr><tr><td>eyebrows</td><td><code>base\characters\head\player_base_heads\player_man_average\h0_000_pma_c__basehead\heb_000_pma_c__basehead.mesh</code></td><td>heb_000_pma__basehead_morph</td></tr><tr><td>pimples</td><td><code>base\characters\head\player_base_heads\player_man_average\h0_000_pma_c__basehead\hx_000_pma_c__basehead_pimples_01.mesh</code></td><td>hx_000_pma__morphs_pimples_01</td></tr><tr><td>freckles</td><td><code>base\characters\head\player_base_heads\player_man_average\h0_000_pma_c__basehead\hx_000_pma_c__basehead_makeup_freckles_01.mesh</code></td><td>hx_000_pma__morphs_makeup_freckles_01</td></tr></tbody></table>

### Female body gender

<table><thead><tr><th width="155.33333333333331"></th><th>path</th><th>component name</th></tr></thead><tbody><tr><td>eyes</td><td><code>base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\he_000_pwa_c__basehead.mesh</code></td><td>he_000_pwa__basehead</td></tr><tr><td>teeth</td><td><code>base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\ht_000_pwa_c__basehead.mesh</code></td><td>ht_000_pwa__basehead</td></tr><tr><td>eyebrows</td><td><code>base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\heb_000_pwa_c__basehead.mesh</code></td><td>heb_000_pwa__basehead_morph</td></tr><tr><td>pimples</td><td><code>base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\hx_000_pwa_c__basehead_pimples_01.mesh</code></td><td>hx_000_pwa__morphs_pimples_01</td></tr><tr><td>freckles</td><td><code>base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\hx_000_pwa_c__basehead_makeup_freckles_01.mesh</code></td><td>hx_000_pwa__morphs_makeup_freckles_01</td></tr></tbody></table>

## Arms

The player base body does not come with arms attached — this makes it easier to switch out the different kinds of cyberarms.

{% hint style="info" %}
Arms are using different meshes for the first person perspective. You can usually find them near the regular meshes in a subfolder with the name `fpp`.
{% endhint %}

You can look up the component names and their properties in the .ent files per body gender in these folders:

<table><thead><tr><th width="155.33333333333331"></th><th>path</th><th></th></tr></thead><tbody><tr><td>Default (female)</td><td><code>base\characters\common\player_base_bodies\player_female_average\arms_hq</code><br></td><td><pre><code><strong>a0_001_pwa_base_hq__full  
</strong>a0_001_pwa_base_hq__full 
left_arm    
right_arm  
a0_000_pwa_base__fists                                                         
</code></pre></td></tr><tr><td>Default (male)</td><td><code>base\characters\common\player_base_bodies\player_man_average\arms_hq</code></td><td><pre><code><strong>a0_001_pma_base_hq__full  
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

